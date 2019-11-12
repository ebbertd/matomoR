#' matomoR user agent
#'
#' This function returns the user agent used in api calls of the matomoR package.
#'
#' @return A character string containing the user agent used in api calls generate with the matomoR package.
#' @import httr
#' @export
#' @examples
#' matomo_package_useragent()
matomo_package_useragent <- function() {
  ua <- user_agent("http://github.com/ebbertd/matomoR")
  ua
}
