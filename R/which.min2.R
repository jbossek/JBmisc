#' More conventient function to get the index of the minimal index in a numeric vector.
#' (\code{base::which.min} only returns the first position of the minimum value).
#'
#' @param x [\code{vector}]\cr
#'   Source vector with numeric values.
#' @param type [\code{character}]\cr
#'   String indicating how to handle multiple occurences of the minimal value. Possible values are
#'   "first", which leads to the know behavior of base::which.min, "last" which returns the index
#'   of the last occurence of the minimal element, "random", which chooses the position by dice roling
#'   and finally all, which returns a vector of all positions.
#' @return [\code{vector}]
#'   Position(s) of the occurence(s) of the minimal value.
#' @export
which.min2 = function(x, type = "first") {
  if (!is.vector2(x))
    stop("which.min2 expects a vector as input.")
  if (length(x) == 0)
    return(NA)
  if (is.list(x))
    x = unlist(x)
  idx = which(x == min(x))
  return(get(idx, type))
}

# helper for which.{min,max}2
get = function(x, type) {
  switch(type,
    "all" = x,
    "first" = x[1],
    "last" = x[length(x)],
    "random" = getRandomElements(x, size = 1L))
}

# simply returns all available options for 'type' parameter in which.{min,max}2
getSupportedWhichTypes = function() {
  c("all", "first", "last", "random")
}
