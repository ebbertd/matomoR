#' matomoR query function
#'
#' This is an internal function of the matomoR package to query the api.
#'
#' @return The response of the api call.
#' @param url The URL for the api call.
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
#' # Create the url
#' url <- httr::modify_url(matomo_hostname(), query = query)
#'
#' # Make the query
#' matomo_package_query(url)
matomo_package_query <-
  function(url = NULL, query = NULL) {
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
