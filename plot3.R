source("plot1.R")

plot3 <- function(
  energy_data=NULL,
  file_name=NULL,
  min_date=as.Date("2007-02-01"), 
  max_date=as.Date("2007-02-02"),
  bty="o"
) {
  if (is.null(energy_data)) {
    if (is.null(file_name)) {
      stop("Must provide either data table or file name")
    }
    energy_data <- source_energy_data(file_name, min_date, max_date)
  }
  plot_cols <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  colors <- c("black", "red", "blue")
  for (ii in seq(1, 3)) {
    plot_col <- plot_cols[ii]
    energy_data[, plot_col] <- as.numeric(as.character(energy_data[, plot_col]))
    if (ii == 1) {
      plot(
        ts(energy_data[, plot_col]), 
        ylab="Energy sub metering", 
        col=colors[ii], 
        xaxt="n", 
        xlab=""
      )
    }
    else {
      lines(ts(energy_data[, plot_col]), col=colors[ii])
    }
  }
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
  legend("topright", plot_cols, lty=1, col=colors, bty=bty)
}