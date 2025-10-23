library(ggplot2)
# Data is at https://www.doc.govt.nz/our-work/monitoring-reporting/, updated in October each year with the Annual Report of the Department of Conservation Te Papa Atawhai
# To update, add the new data values at the end of the vectors in the data frame, and run the code in R or RStudio
kpop <- data.frame("year" = 1977:2025,
                   "breeding" = c(FALSE,FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,TRUE,FALSE,TRUE,TRUE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE),
                   "transferred" = c(1,1,1,3,7,25,21,21,21,21,26,41,46,46,46,51,51,50,49,49,49,49,49,49,49,49,49,49,48,48,48,47,47,45,42,41,40,38,37,34,33,32,31,26,26,26,26,26,26),
                   "stewart" = c(149,132,111,91,72,44,45,43,44,43,38,18,11,9,8,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
                   "offshore" = c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,5,8,13,13,13,37,37,34,38,38,38,44,77,77,86,84,84,89,89,124,121,117,117,185,179,174,222,221,216),
                   "fiordland" = c(17,13,13,13,8,8,5,3,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
                   "total" = c(167,146,125,107,87,77,71,67,67,66,64,59,57,55,56,55,53,52,51,51,54,57,62,62,62,86,86,83,86,86,86,91,124,122,128,125,124,127,126,158,154,149,148,211,205,200,248,247,242)
)
kpop$breed_years <- ifelse(kpop$breeding, kpop$year, NA)
ggplot(kpop, aes(year, total)) +
  geom_line(size=1, color="darkblue") +
  geom_point(size=2.5, shape=23, stroke=2, fill="yellow", color="darkgreen") +
  geom_segment(aes(x = breed_years, y = total+30, xend = year, yend = total+10), linewidth=1, colour="red", arrow = arrow(length = unit(0.2, "cm")), arrow.fill = "red") +
  theme_linedraw(base_size = 14) +
  theme(plot.title = element_text(size=16, face="bold"),
        axis.text = element_text(size=14),
        axis.title = element_text(size=14,face="bold"),
        panel.grid = element_blank()) +
  scale_y_continuous(name = "Number of kākāpō", breaks = seq(from = 0, to = 260, by = 20), limits = c(0,260)) +
  scale_x_continuous(name = "Year", breaks = seq(from = 1975, to = 2025, by = 5)) +
  labs(title = "Kākāpō population size")

ggplot(kpop, aes(year, total)) +
  geom_line(size=1, color="darkblue") +
  geom_point(size=2.5, shape=23, stroke=2, fill="yellow", color="darkgreen") +
  geom_segment(aes(x = breed_years, y = total+30, xend = year, yend = total+10), size=1, colour="red", arrow = arrow(length = unit(0.2, "cm")), arrow.fill = "red") +
  theme_linedraw(base_size = 14) +
  theme(plot.title = element_text(size=16, face="bold"),
        axis.text = element_text(size=14),
        axis.title = element_text(size=14,face="bold"),
        panel.grid = element_blank()) +
  scale_y_continuous(breaks = seq(from = 0, to = 260, by = 20), limits = c(0,260)) +
  scale_x_continuous(breaks = seq(from = 1975, to = 2025, by = 5)) +
  theme(
    plot.title = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank())
