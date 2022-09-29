library(paletter)
library(here)
library(colordistance)
library(tidyverse)
library(Polychrome)
library(colorspace)
library(pavo)

path <- here()

set.seed(666)

# Create Color baseline Palette ----

# no. of baseline colors in the palette
n_color <- 5
n_samples <- 25

# applying the rainbow function
baseline_colors <- rainbow(n_color)

# prints the hex color codes
baseline_colors

# creates a pie chart of baseline colours
pie(rep(1, n_color), col = baseline_colors, 
    main = "Baseline Colors")


# Create Colors and Check for Distinctiveness (> 40) and Luminance 

stim_colors<-Polychrome::createPalette(n_samples,range = c(45,75),seedcolors = baseline_colors, M = 100000,prefix = "SC_")
luminance(stim_colors,main = "Luminance Distribution of Stims")
Polychrome::computeDistances(stim_colors)
plotDistances(stim_colors)

# creates a pie chart colors
pie(rep(1, n_samples), col = stim_colors, 
    main = "Stim Colors")

stim_colors_clean <- stim_colors[-c(8,24,17,6)]

# creates a pie chart colors
pie(rep(1, length(stim_colors_clean)), col = stim_colors_clean, 
    main = "Stim Colors")


# Convert to double RGB Values for Matlab

stim_colors_rgb_clean <- hex2RGB(stim_colors_clean)


# Save Values to File
write.csv2(stim_colors_rgb_clean@coords, "stim_colors.csv")

# Classify Colors According to family

color_class <- as.matrix(c("Red","Green","Green","Blue","Purple","Blue","Yellow","Purple",
                           "Green","Red","Yellow",
                           "Purple","Blue","Green","Red","Purple","Yellow",
                           "Purple","Purple","Green","Blue"))

colnames(color_class) <- c("class")

stim_colors <- as.data.frame(stim_colors_rgb_clean@coords)
stim_colors<-cbind(stim_colors,color_class)
stim_colors$class <- as.character(stim_colors$class)

stim_colors %>% group_by(class) %>% count()

