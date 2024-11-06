#' Provide number of R packages by library
#'
#' Provide the number of R packages by library in a data frame
#'
#' @param by tidy-select columns to group by. Defaults to `LibPath`
#' @param sizes logical should file sizes be calculated? Defaults
#' to `FALSE`
#'
#' @return a data.frame of R packages by library
#'
#' @export
#'
#' @examples
#' lib_summary()
lib_summary <- function(by = .data$LibPath, sizes = FALSE) {
  if(!is.logical(sizes)) {
    stop("'sizes' must be logical, i.e. 'TRUE' or 'FALSE'")
  }

  pkg_df <- lib() |>
    calculate_sizes(do_calc = sizes)

  pkg_df |>
    dplyr::group_by({{ by }}) |>
    dplyr::summarize(
      n = dplyr::n(),
      dplyr::across(dplyr::any_of("size"), sum, .names = "size")
    )
}


#' Generate a data frame of installed packages
#'
#' @return a data.frame of all packages installed on your system
#' @export
lib <- function() {
  pkgs <- utils::installed.packages()
  as.data.frame(pkgs, stringsAsFactors = FALSE)
}


#' calculate sizes
#'
#' @param df a data.frame
#' @param do_calc logical should the function be executed? Default is
#' `FALSE`
#'
#' @return df with a size column
#' @noRd
calculate_sizes <- function(df, do_calc = FALSE) {
  if(!do_calc) {
    return(df)
  }

  df |>
    dplyr::mutate(
      size = map_dbl(
        fs::path(.data$LibPath, .data$Package),
        \(x) sum(fs::file_size(fs::dir_ls(x, recurse = TRUE)))
      )
    )
}

