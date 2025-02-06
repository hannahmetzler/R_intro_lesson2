## LOAD PACKAGES ####
library(dplyr)
library(ggplot2)
library(readr)

## READ IN DATA AND ORGANIZE ####
# Read in data
data = readr::read_csv("data/pets.csv",  col_types = "cffiid")

# Look at data
dim(data)
head(data) 
tail(data) 
xtabs(~pet, data) 

dplyr::glimpse(data)

# Subset out cats
data_cats <- data %>%
  dplyr::filter(pet == "cat")

data_cats #print out the new data frame

# Look at cats data
dim(data_cats) 
head(data_cats) 
tail(data_cats) 
xtabs(~pet, data_cats)
xtabs(~country, data_cats)

## MAKE FIGURES ####
# Weight by pet
data.plot = ggplot(data, aes(x = pet, y = weight)) +
  geom_boxplot()
data.plot

# Pretty plot
data.plot <- ggplot(data, aes(x = pet, y = weight, fill = pet)) +
  geom_boxplot()+
  theme_bw()+
  ggtitle("Weight by pet")
data.plot

# save the plot
ggsave('figures/boxplot_pets_weight.png', 
       plot = data.plot, 
       width = 4, 
       height = 4, 
       dpi = 300)
