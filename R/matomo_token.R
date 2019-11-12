#' Matomo Token
#'
#' This function returns the Matomo access token that is set in the environment variable MATOMO_TOKEN.
#'
#' @return A character string containing the Matomo token.
#' @export
#' @examples
#' Sys.setenv(MATOMO_TOKEN = "anonymous")
#'
#' matomo_token()
matomo_token <- function() {
  matomo_token <- Sys.getenv("MATOMO_TOKEN")
  if (identical(matomo_token, "")) {
    stop("Please set env var MATOMO_TOKEN to your Matomo token.",
      call. = FALSE
    )
  }
  matomo_token
}
