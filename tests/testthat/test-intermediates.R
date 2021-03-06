test_that("intermediate interpolation in distance works", {
  expect_equivalent(round(track_intermediate(c(0, 0, 1, 0), c(0, 1, 1, 0),
                                      ISOdate(2001, 1, 1) + c(1:4))[[1]]$int_y, digits = 2L),
                    c(0, 0.06, 0.12, 0.19, 0.25, 0.31, 0.37, 0.44, 0.5, 0.56, 0.62,
                      0.69, 0.75, 0.81, 0.87, 0.94, 1))

  expect_equivalent(round(track_intermediate(c(0, 0, 1, 0), c(0, 1, 1, 0))[[3]]$int_x, digits = 2L),
                    c(1, 0.94, 0.87, 0.81, 0.75, 0.69, 0.62, 0.56, 0.5, 0.44, 0.37,
                      0.31, 0.25, 0.19, 0.12, 0.06, 0))

  expect_equivalent(round(track_intermediate(c(0, 0, 1, 0), c(0, 1, 1, 0), distance = 4000)[[3]]$int_x, digits = 2L),
                    c(1, 0.98, 0.95, 0.93, 0.9, 0.88, 0.85, 0.83, 0.8, 0.78, 0.76,
                      0.73, 0.71, 0.68, 0.66, 0.63, 0.61, 0.59, 0.56, 0.54, 0.51, 0.49,
                      0.46, 0.44, 0.41, 0.39, 0.37, 0.34, 0.32, 0.29, 0.27, 0.24, 0.22,
                      0.2, 0.17, 0.15, 0.12, 0.1, 0.07, 0.05, 0.02, 0))


  expect_equivalent(round(track_intermediate(c(147, 148), c(-42, -43), distance = 4000)[[1]]$int_x, digits = 2L),
                    c(147, 147.03, 147.05, 147.08, 147.11, 147.14, 147.16, 147.19,
                      147.22, 147.25, 147.27, 147.3, 147.33, 147.36, 147.39, 147.41,
                      147.44, 147.47, 147.5, 147.52, 147.55, 147.58, 147.61, 147.64,
                      147.66, 147.69, 147.72, 147.75, 147.77, 147.8, 147.83, 147.86,
                      147.89, 147.92, 147.94, 147.97, 148))
})




test_that("intermediate interpolation in time works", {
  expect_equivalent(round(track_intermediate(c(0, 0, 1, 0), c(0, 1, 1, 0),
                                             ISOdate(2001, 1, 1) + c(1:4) * 24 * 3600, duration = 1800)[[1]]$int_y, digits = 2L),
                    c(0, 0.02, 0.04, 0.06, 0.08, 0.1, 0.12, 0.14, 0.16, 0.18, 0.2,
                      0.22, 0.24, 0.27, 0.29, 0.31, 0.33, 0.35, 0.37, 0.39, 0.41, 0.43,
                      0.45, 0.47, 0.49, 0.51, 0.53, 0.55, 0.57, 0.59, 0.61, 0.63, 0.65,
                      0.67, 0.69, 0.71, 0.73, 0.76, 0.78, 0.8, 0.82, 0.84, 0.86, 0.88,
                      0.9, 0.92, 0.94, 0.96, 0.98, 1))


})

test_that("intermediate required arguments are sane", {
  expect_error(track_intermediate(c(0, 0, 1, 0), c(0, 1, 1, 0), duration = 10000))
  expect_error(track_intermediate(c(0, 0, 1, 0), c(0, 1, 1, 0), duration = 10000, distance = 50000))

})
