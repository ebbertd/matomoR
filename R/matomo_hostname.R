#' Matomo hostname
#'
#' This function returns the Matomo hostname that is set in the environment variable MATOMO_HOST.
#'
#' @return A character string containing the Matomo hostname.
#' @export
#' @examples
#' Sys.setenv(MATOMO_HOST = "https://demo.matomo.org")
#'
#' matomo_hostname()
matomo_hostname <- function() {
  matomo_hostname <- Sys.getenv("MATOMO_HOST")
  matomo_hostname <- paste0(matomo_hostname, "/index.php")
  if (identical(matomo_hostname, "")) {
    stop("Please set env var MATOMO_HOST to your Matomo host.",
      call. = FALSE
    )
  }
  matomo_hostname
}
