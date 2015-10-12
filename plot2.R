source("plot1.R")

plot2 <- function(
  energy_data=NULL,
  file_name=NULL,
  min_date=as.Date("2007-02-01"), 
  max_date=as.Date("2007-02-02"),
  ylab="Global Active Power (kilowatts)"
) {
  if (is.null(energy_data)) {
    if (is.null(file_name)) {
      stop("Must provide either data table or file name")
    }
    energy_data <- source_energy_data(file_name, min_date, max_date)
  }
  plot_col <- "Global_active_power"
  energy_data[, plot_col] <- as.numeric(as.character(energy_data[, plot_col]))
  plot(
    ts(energy_data[, plot_col]),
    ylab=ylab,
    xaxt="n",
    xlab=""
  )
  axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
}