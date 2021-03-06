% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/polygonize.R
\name{lawn_polygonize}
\alias{lawn_polygonize}
\title{Polygonizes multi-linestring's to polygons}
\usage{
lawn_polygonize(lines, lint = FALSE)
}
\arguments{
\item{lines}{Line(s) to polygonze}

\item{lint}{(logical) Lint or not. Uses geojsonhint. Takes up increasing
time as the object to get linted increases in size, so probably use by
default for small objects, but not for large if you know they are good
geojson objects. Default: \code{FALSE}}
}
\value{
one or more \link{data-Polygon}
}
\description{
Takes a \link{data-LineString} or \link{data-MultiLineString} and returns
\link{data-Polygon}'s
}
\details{
Polygonizes a set of lines that represents edges in a planar graph. Edges
must be correctly noded, i.e., they must only meet at their endpoints.
}
\examples{
\dontrun{
 # line <- '{
 #   "type": "FeatureCollection",
 #   "features": [
 #     {
 #      "type": "Feature",
 #      "properties": {
 #        "stroke": "#F00"
 #     },
 #      "geometry": {
 #        "type": "LineString",
 #        "coordinates": [[-83, 30], [-84, 36], [-78, 41]]
 #      }
 #    },
 #     {
 #      "type": "Feature",
 #      "properties": {
 #        "stroke": "#F00"
 #     },
 #      "geometry": {
 #        "type": "LineString",
 #        "coordinates": [[-86, 34], [-88, 33], [-73, 39]]
 #      }
 #    }
 #  ]
 # }'
 #
 # line <- '{
 #   "type": "FeatureCollection",
 #   "features": [
 #     {
 #      "type": "Feature",
 #      "geometry": {
 #        "type": "LineString",
 #        "coordinates": [[0, 0], [1, 1]]
 #      }
 #    },
 #     {
 #      "type": "Feature",
 #      "geometry": {
 #        "type": "LineString",
 #        "coordinates": [[1, 1], [-1, -1]]
 #      }
 #    },
 #     {
 #      "type": "Feature",
 #      "geometry": {
 #        "type": "LineString",
 #        "coordinates": [[-1, -1], [0, 0]]
 #      }
 #    }
 #  ]
 # }'


 # x <- '{
 #   "type": "FeatureCollection",
 #   "features": [
 #     {
 #       "type": "Feature",
 #       "properties": {},
 #       "geometry": {
 #         "type": "LineString",
 #         "coordinates": [
 #           [
 #             119.00390625,
 #             -22.024545601240337
 #           ],
 #           [
 #             120.58593749999999,
 #             -28.613459424004414
 #           ],
 #           [
 #             125.595703125,
 #             -32.99023555965107
 #           ],
 #           [
 #             133.330078125,
 #             -32.99023555965107
 #           ],
 #           [
 #             142.646484375,
 #             -30.977609093348676
 #           ],
 #           [
 #             142.294921875,
 #             -24.126701958681668
 #           ],
 #           [
 #             139.04296875,
 #             -16.299051014581817
 #           ],
 #           [
 #             128.84765625,
 #             -15.199386048559994
 #           ]
 #         ]
 #       }
 #     },
 #     {
 #       "type": "Feature",
 #       "properties": {},
 #       "geometry": {
 #         "type": "LineString",
 #         "coordinates": [
 #           [
 #             142.646484375,
 #             -30.977609093348676
 #           ],
 #           [
 #             132.451171875,
 #             -27.449790329784214
 #           ],
 #           [
 #             128.671875,
 #             -23.1605633090483
 #           ],
 #           [
 #             119.00390625,
 #             -22.024545601240337
 #           ]
 #         ]
 #       }
 #     }
 #   ]
 # }'
 # lawn_polygonize(lines = x)
}
}
\keyword{internal}
