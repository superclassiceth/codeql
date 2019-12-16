import cpp

string describe(File f) {
  f.compiledAsC() and
  result = "C"
  or
  f.compiledAsCpp() and
  result = "C++"
}

from File f
where f.toString() != ""
select f.toString(), f.getRelativePath(), concat(f.getAQlClass().toString(), ", "),
  concat(describe(f), ", "), concat(f.getATopLevelDeclaration().toString(), ", "),
  concat(LocalVariable v | f.getADeclaration() = v | v.toString(), ", ")
