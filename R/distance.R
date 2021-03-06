#' Distance between two points
#'
#' Calculates the distance between two [data-Point]s in degress,
#' radians, miles, or kilometers. Uses the
#' Haversine formula 
#' to account for global curvature.
#'
#' @export
#'
#' @param from Origin [data-Feature]<([data-Point])>
#' @param to Destination [data-Feature]<([data-Point])>
#' @param units (character) Can be degrees, radians, miles, or kilometers
#' (default).
#' @template lint
#' @family measurements
#' @return Single numeric value
#' @examples
#' from <- '{
#'  "type": "Feature",
#'  "properties": {},
#'  "geometry": {
#'    "type": "Point",
#'    "coordinates": [-75.343, 39.984]
#'  }
#' }'
#' to <- '{
#'   "type": "Feature",
#'   "properties": {},
#'   "geometry": {
#'     "type": "Point",
#'     "coordinates": [-75.534, 39.123]
#'   }
#' }'
#' lawn_distance(from, to)
lawn_distance <- function(from, to, units = 'kilometers', lint = FALSE) {
  from <- convert(from)
  to <- convert(to)
  lawnlint(list(from, to), lint)
  if (lint) {
    is_type(from, "Feature", "Point")
    is_type(to, "Feature", "Point")
  }
  ct$eval(sprintf('var point1 = %s;', from))
  ct$eval(sprintf('var point2 = %s;', to))
  ct$eval(sprintf("var avg = turf.distance(point1, point2, {units:'%s'});",
    units))
  ct$get("avg")
}
