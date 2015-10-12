source("plot1.R")
source("plot2.R")

subplot1 <- function(energy_data) {
  plot2(energy_data=energy_data)  
}

subplot2 <- function(energy_data) {
  plot_col <- "Voltage"
  energy_data[, plot_col] <- as.numeric(as.character(energy_data[, plot_col]))
  plot(
    ts(energy_data[, plot_col]),
    xlab="datetime",
    ylab="Voltage",
    xaxt="n"
  )
  axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
}

subplot3 <- function(energy_data) {
  plot3(energy_data=energy_data, bty="n")
}

subplot4 <- function(energy_data) {
  plot_col <- "Global_reactive_power"
  energy_data[, plot_col] <- as.numeric(as.character(energy_data[, plot_col]))
  plot(
    ts(energy_data[, plot_col]),
    xlab="datetime",
    xaxt="n",
    ylab=plot_col
  )
  axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
}

plot4 <- function(
  file_name, 
  min_date=as.Date("2007-02-01"), 
  max_date=as.Date("2007-02-02")
) {
  energy_data <- source_energy_data(file_name, min_date, max_date)
  par(mfrow=c(2, 2))
  subplot1(energy_data)
  subplot2(energy_data)
  subplot3(energy_data)
  subplot4(energy_data)
}