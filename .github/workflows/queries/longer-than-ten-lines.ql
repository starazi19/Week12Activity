/**
 * @description Find functions longer than 10 lines
 * @kind problem
 * @id javascript/longer-than-ten-lines
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if f has longer than 10 lines
 */
predicate longFunctions(Function f) {
  f.getNumLines() > 10
}

from Function f
where longFunctions(f)
select f, "Function longer than 10 lines: " + f.getName()
