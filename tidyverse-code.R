library(dplyr)


# Function arguments passed as variables
var_summary <- function(data, var) {
  data |>
    summarize(
      min_var = min({{ var }}),
      max_var = max({{ var }})
    )
}

mtcars |>
  group_by(cyl) |>
  var_summary(mpg)


# Function arguments passed as characters
var_summary2 <- function(data, var) {
  data |>
    summarize(
      min_var = min(.data[[var]]),
      max_var = max(.data[[var]])
    )
}


mtcars |>
  group_by(cyl) |>
  var_summary2("mpg")


# Writing functions with data variables
big_cars_summary <- function(var) {
  mtcars |>
    filter(.data$cyl >= 6) |>
    group_by(.data$cyl) |>
    summarize(
      n = n(),
      mean = mean({{var}})
    )
}

big_cars_summary


# Summarize mass by one or more grouping variables
# use starwars data
starwars_mass_summary <- function(...) {
  starwars |>
    group_by(...) |>
    summarize(
      mean_mass = mean(.data$mass, na.rm = TRUE),
      sd_mass = sd(.data$mass, na.rm = TRUE)
    )
}

starwars_mass_summary(hair_color, homeworld)


# Name injection using dynamic dots :=

var_summary3 <- function(data, var, new_col_name) {
  data |>
    summarize(
      "{new_col_name}" := min({{var}})
    )
}

mtcars |>
  group_by(cyl) |>
  var_summary3(mpg, "min_mpg")


var_summary4 <- function(data, var) {
  data |>
    summarize(
      "{{var}}_min" := min({{var}})
    )
}


mtcars |>
  group_by(cyl) |>
  var_summary4(mpg)


# Summarize starwars dynamically and create new column names
starwars_dynamic_summary <- function(...) {
  starwars |>
    summarize(
      across(
        c(...),
        .fns = list(mean = mean, min = min),
        .names = "{.col}_{.fn}"
      )
    )
}

starwars_dynamic_summary(mass, height)
<<<<<<< HEAD


# Another across() example
new_summary <- function(df, group_var, cols) {
  df |>
    group_by({{ group_var }}) |>
    summarize(
      across(
        {{ cols }},
        .fns = list(min = min, max = max)
      )
    )
}

mtcars |>
  new_summary(
    cyl,
    #c("mpg", "disp")
    #starts_with("mp")
    where(is.numeric)
  )
=======
>>>>>>> e0f743fba3e69bf222f756f023439932959e074b
