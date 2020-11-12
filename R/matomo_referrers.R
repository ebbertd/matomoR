#' Query the Matomo Referrer Analytics
#'
#' Returns all referrers data
#'
#' @inheritParams matomo_media_video_resources
#'
#' @return
#' @export
#'
#' @examples
matomo_referrers_all <- function(idSite = NULL,
                              period = "day",
                              date = "yesterday",
                              segment = NULL) {
  # Construct the query
  query <- list(
    module = "API",
    method = "Referrers.getAll ",
    idSite = idSite,
    period = period,
    date = date,
    segment = segment
  )

  # Query the api and return the response
  matomo_package_query(query = query)
}
