#' Query the Matomo Media Analytics for video resources
#'
#' Returns the media analytics for video resources.
#'
#' This function expects the hostname and token to be set as environment variables.
#'
#' @return A list containing a data frame with the requested analytics values.
#' @param idSite The id of your website.
#' @param period The period you request the statistics for. Can be any of: day, week, month, year or range.
#' @param date The date you request the statictics for. Standard format = YYYY-MM-DD or today or yesterday.
#' @param segment Defines the Custom Segment you wish to filter your reports to.
#' @param idSubtable The id of a possible subtable.
#' @param secondaryDimension Secondary dimension is the dimension used in the sub-table of the Event report you are requesting.
#' @param expanded If is set to 1, the returned data will contain the first level results, as well as all sub-tables.
#' @param ... Possible further options to the query in the format variable = value. For a list of possible options see: \url{https://developer.matomo.org/api-reference/reporting-api}
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(MATOMO_HOST = "https://demo.matomo.org")
#' Sys.setenv(MATOMO_TOKEN = "anonymous")
#'
#' matomo_media_video_resources(idSite = 62)
matomo_media_video_resources <- function(idSite = NULL,
                                         period = "day",
                                         date = "yesterday",
                                         segment = NULL,
                                         idSubtable = NULL,
                                         secondaryDimension = NULL,
                                         expanded = NULL,
                                         ...) {
  # Construct the query
  query <- list(
    module = "API",
    method = "MediaAnalytics.getVideoResources",
    idSite = idSite,
    period = period,
    date = date,
    segment = segment,
    idSubtable = idSubtable,
    secondaryDimension = secondaryDimension,
    expanded = expanded,
    ...
  )

  # Construct the url for the api call
  url <- modify_url(matomo_hostname(), query = query)

  # Query the api and return the response
  matomo_package_query(url)
}

#' Print result of matomo_media_video_resources()
#'
#' Print a structured return of the matomo_media_video_resources() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the matomo_media_video_resources() function.
#' @seealso \code{\link{matomo_media_video_resources}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(MATOMO_HOST = "https://demo.matomo.org")
#' Sys.setenv(MATOMO_TOKEN = "anonymous")
#'
#' resp <- matomo_media_video_resources(idSite = 62)
#'
#' resp
print.matomo_media_video_resources <- function(x, ...) {
  cat("<Matomo ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
