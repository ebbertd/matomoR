#' Query the Matomo Media Analytics for video resources
#'
#' Returns the media analytics for video resources.
#'
#' This function expects the hostname and token to be set as environment variables.
#'
#' @return A list containing a data frame with the requested analytics values.
#' @inheritParams matomo_media_video_resources
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(MATOMO_HOST = "https://demo.matomo.org")
#' Sys.setenv(MATOMO_TOKEN = "anonymous")
#'
#' matomo_media_video_titles(idSite = 62)
matomo_media_video_titles <- function(idSite = NULL,
                                         period = "day",
                                         date = "yesterday",
                                         segment = NULL,
                                         idSubtable = NULL,
                                         secondaryDimension = NULL,
                                         ...) {
  # Construct the query
  query <- list(
    module = "API",
    method = "MediaAnalytics.getVideoTitles",
    idSite = idSite,
    period = period,
    date = date,
    segment = segment,
    idSubtable = idSubtable,
    secondaryDimension = secondaryDimension,
    ...
  )

  # Query the api and return the response
  matomo_package_query(query = query)
}

#' Print result of matomo_media_video_titles()
#'
#' Print a structured return of the matomo_media_video_titles() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the matomo_media_video_titles() function.
#' @seealso \code{\link{matomo_media_video_titles}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(MATOMO_HOST = "https://demo.matomo.org")
#' Sys.setenv(MATOMO_TOKEN = "anonymous")
#'
#' resp <- matomo_media_video_titles(idSite = 62)
#'
#' resp
print.matomo_media_video_titles <- function(x, ...) {
  cat("<Matomo ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
