
###
# Rectangular signal with parameters
#
# x = vector for x- Axis
# t = first semiwave
# b = second semiwave
# p = period
rect <- function(x, t, b, p) {
	ifelse((x%%(2 * p)) < p, t, b)
}

###
# Sawtooth signal with positive and inverted negative parts
#
# x = vector for x- Axis
saw2 <- function(x) {
	ifelse(x%%2 < 1, x%%1, -(x%%1))
}
