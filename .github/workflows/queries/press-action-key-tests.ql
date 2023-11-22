/**
 * @description Find tests that call pressActionKey
 * @kind problem
 * @id javascript/press-action-key-tests
 * @problem.severity recommendation
 */

import javascript

/**
 * Holds if a function is a test. 
 */
 
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

/** 
 * Holds if `caller` contains a call to `callee`.
 */

predicate calls(Function caller, Function callee) {
  exists(DataFlow::CallNode call |
    call.getEnclosingFunction() = caller and
    call.getACallee() = callee
  )
}

/** 
 * Holds if function named pressActionKey
 */

from Function test Function x
where isTest(test) and
      calls+(test, x) and
      x.getName() = "pressActionKey"
select test, "Test calling pressActionKey: " + test.getName()
