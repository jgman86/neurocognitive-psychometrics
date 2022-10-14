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
n_color <- 4
n_samples <- 30

# applying the rainbow function
baseline_colors <- rainbow(n_color)

# prints the hex color codes
baseline_colors


pie(rep(1,36),
    col=Polychrome::palette36.colors(36))

# creates a pie chart of baseline colours
pie(rep(1, n_color), col = baseline_colors, 
    main = "Baseline Colors")

sorted<-sortByLuminance(stim_colors_clean)
# Create Colors and Check for Distinctiveness (> 40) and Luminance 

stim_colors<-Polychrome::createPalette(n_samples,range = c(30,70),seedcolors = baseline_colors, M = 100000,prefix = "SC_")
luminance(stim_colors,main = "Luminance Distribution of Stims")
Polychrome::computeDistances(stim_colors)
plotDistances(stim_colors)

# Use pre selected palette 

stim_colors <- Polychrome::palette36.colors(36)


# creates a pie chart colors
pie(rep(1, n_samples), col = stim_colors, 
    main = "Stim Colors")

# Select Colors
stim_colors_clean <- stim_colors[-c(1,2)]

pie(rep(1, length(stim_colors_clean)), col = stim_colors_clean, 
    main = "Stim Colors")


# Convert to double RGB Values for Matlab

stim_colors_rgb_clean <- hex2RGB(stim_colors_clean)

# Calculate Luminance

# Save Values to File
#write.csv2(stim_colors_rgb_clean@coords, "stim_colors.csv")

# Classify Colors According to family

color_class <- c("Red","Purple","Green","Blue","Yellow","Red","Green","Green","Blue","Purple","Purple","Yellow","Blue","Red","Green","Green",
                  "Purple","Yellow","Green","Red","Purple","Yellow","Purple","Purple","Green","Blue","Red","Green","Green","Green","Purple","Purple",
                "Blue","Blue")


colnames(color_class) <- c("class")

stim_colors_clean <- as.data.frame(stim_colors_rgb_clean@coords)


stim_colors_clean %>% group_by(color_class) %>% count()

# Color Brightness


bright <- function(df)
{
  
  b <- sqrt(.241*df[,1]^2 + .691*df[,2]^2 + 0.068*df[,3]^2)
  
  return(b)
  
  
}
# Calculate Subjective Luminance 

subj_luminance <- stim_colors_clean %>% select(R,G,B) %>%  mutate_at(.vars = c("R","G","B"),
  funs(case_when(
    . <= 0.04045 ~ ./12.92,
    TRUE ~ ((. + 0.055)/1.055)^2.4))) %>% mutate(brightness = R * 0.2126 + G *0.7152 + B* 0.072)
                                                

# Join all data 
stim_colors_final<-cbind(stim_colors_clean,subj_luminance$brightness)

colnames(stim_colors_final) <- c("R","G","B","class","brightness")                                                      

# safe to file 

write.csv2(stim_colors_final,"stim_colors_final.csv")



