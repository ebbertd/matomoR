#' matomoR query function
#'
#' This is an internal function of the matomoR package to query the api.
#' You can use it to call any endpoint that does not have a higher-level interface.
#'
#' @return The response of the api call.
#' @param url The URL for the api call, by default the environment variable `MATOMO_HOST`.
#' @param query A list of query parameters.
#' @import httr
#' @importFrom jsonlite fromJSON
#' @export
#' @examples
#' Sys.setenv(MATOMO_HOST = "https://demo.matomo.org")
#' Sys.setenv(MATOMO_TOKEN = "anonymous")
#'
#' # Construct the query
#' query <- list(
#'  module = "API",
#'  method = "API.getMatomoVersion"
#' )
#'
#' # Make the query
#' matomo_package_query(query = query)
matomo_package_query <-
  function(query = NULL, url = NULL) {

    url <- httr::modify_url(matomo_hostname(), query = query)

    # Save api call to variable
    resp <-
      GET(
        url,
        query = list(query,
                     format = "JSON",
                     token_auth = matomo_token()),
        matomo_package_useragent()
      )

    # Parse the response
    parsed <-
      fromJSON(content(resp, "text", encoding = "UTF-8"), simplifyDataFrame = TRUE)

    # Structure the return
    structure(list(
      content = parsed,
      url = url,
      response = resp
    ),
    class = "matomo_api")
  }
