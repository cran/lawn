#' Convex hull polygon
#'
#' Takes a set of [data-Point]'s and returns a convex
#' hull polygon. Internally, this uses the
#' convex-hull  module
#' that implements a Monotone chain hull
#'
#' @export
#' @param input Input points in a [data-FeatureCollection].
#' @template lint
#' @family transformations
#' @return a convex hull [data-Polygon]
#' @examples
#' points <- '{
#'   "type": "FeatureCollection",
#'   "features": [
#'     {
#'       "type": "Feature",
#'       "properties": {},
#'       "geometry": {
#'         "type": "Point",
#'         "coordinates": [-63.601226, 44.642643]
#'       }
#'     }, {
#'       "type": "Feature",
#'       "properties": {},
#'       "geometry": {
#'         "type": "Point",
#'         "coordinates": [-63.591442, 44.651436]
#'       }
#'     }, {
#'       "type": "Feature",
#'       "properties": {},
#'       "geometry": {
#'         "type": "Point",
#'         "coordinates": [-63.580799, 44.648749]
#'       }
#'     }, {
#'       "type": "Feature",
#'       "properties": {},
#'       "geometry": {
#'         "type": "Point",
#'         "coordinates": [-63.573589, 44.641788]
#'       }
#'     }, {
#'       "type": "Feature",
#'       "properties": {},
#'       "geometry": {
#'         "type": "Point",
#'         "coordinates": [-63.587665, 44.64533]
#'       }
#'     }, {
#'       "type": "Feature",
#'       "properties": {},
#'       "geometry": {
#'         "type": "Point",
#'         "coordinates": [-63.595218, 44.64765]
#'       }
#'     }
#'     ]
#' }'
#' lawn_convex(points)
#' @examples \dontrun{
#' lawn_convex(points) %>% view
#' }
lawn_convex <- function(input, lint = FALSE) {
  input <- convert(input)
  lawnlint(input, lint)
  if (lint) is_type(input, c("Feature", "FeatureCollection"), "Point")
  ct$eval(sprintf("var cv = turf.convex(%s);", input))
  structure(ct$get("cv"), class = "polygon")
}
