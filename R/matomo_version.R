#' Query Matomo for the version
#'
#' Returns the version of the Matomo server.
#'
#' This function expects the hostname and token to be set as environment variables.
#'
#' @return A list containing the server version.
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(MATOMO_HOST = "https://demo.matomo.org")
#' Sys.setenv(MATOMO_TOKEN = "anonymous")
#'
#' matomo_version()
matomo_version <- function() {
  # Construct the query
  query <- list(
    module = "API",
    method = "API.getMatomoVersion"
  )

  # Construct the url for the api call
  url <- modify_url(matomo_hostname(), query = query)

  # Query the api and return the response
  matomo_package_query(url)
}

#' Print result of matomo_version()
#'
#' Print a structured return of the matomo_version() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the matomo_version() function.
#' @seealso \code{\link{matomo_version}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(MATOMO_HOST = "https://demo.matomo.org")
#' Sys.setenv(MATOMO_TOKEN = "anonymous")
#'
#' resp <- matomo_version()
#'
#' resp
print.matomo_version <- function(x, ...) {
  cat("<Matomo ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
