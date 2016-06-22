# Read economist data into data frame df
df = read.csv("EconomistData.csv")

str(df) # Check the structure of the data frame
summary(df) # Get summary statistics 

#install.packages("ggplot2") # install package to plot data
library(ggplot2) # load package

ggplot(df, aes(x = CPI, y = HDI)) + geom_point() # plot the data
# HDI: "Human Development Index"
# CPI: "Corruption Perception Index"

# Draw a straight line that best "fits" the data
ggplot(df, aes(x = CPI, y = HDI)) +
  geom_point() +
  geom_smooth(method = "lm")

# Color countries based on Region
ggplot(df, aes(x = CPI, y = HDI, color = Region)) +
  geom_point()

# Change X and Y axes titles
ggplot(df, aes(x = CPI, y = HDI, color = Region)) +
  geom_point() +
  scale_x_continuous(name = "Corruption Perception Index") +
  scale_y_continuous(name = "Human Development Index") +
  scale_color_discrete(name = "Region of the world")

# Identify a small subset of countries of interest
pointsToLabel <- c("Russia", "Ukraine", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore", "Tanzania")

# Create a new data frame with the selected countries
smallDF = subset(df, Country %in% pointsToLabel)

# Plot the data for the selected countries and name them
ggplot(smallDF, aes(x = CPI, y = HDI, color = Region, , label=Country)) +
  geom_point() + geom_text(aes(label=Country),hjust=0, vjust=0) + 
  scale_x_continuous(name = "Corruption Perception Index") +
  scale_y_continuous(name = "Human Development Index") +
  scale_color_discrete(name = "Region of the world")

