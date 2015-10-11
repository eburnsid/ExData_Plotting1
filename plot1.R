source_energy_data <- function(file_name, min_date, max_date) {
  energy_data <- read.table(file_name, sep=";", header=TRUE)
  energy_data[, "Date"] <- as.Date(energy_data[, "Date"], format="%d/%m/%Y")
  energy_data <- subset(
    energy_data, energy_data[, "Date"] >= min_date)
  energy_data <- subset(
    energy_data, energy_data[, "Date"] <= max_date)
  return(energy_data)
}

plot1 <- function(file_name, min_date=as.Date("2007-02-01"), max_date=as.Date("2007-02-02")) {
  energy_data <- source_energy_data(file_name, min_date, max_date)
  plot_col = "Global_active_power"
  energy_data[, plot_col] <- as.numeric(as.character(energy_data[, plot_col]))
  hist(
    energy_data[, plot_col], 
    plot = TRUE, 
    main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)",
    xaxp = c(0, 6, 3),
    col="red"
  )
}