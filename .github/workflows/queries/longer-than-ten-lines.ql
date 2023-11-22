import javascript

predicate longFunctions(Function f) {
  f.getNumLines() > 10
}

from Function f
where longFunctions(f)
select f, "Function longer than 10 lines: " + f.getName()
