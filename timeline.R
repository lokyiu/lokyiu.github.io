# This is the script to make a project timeline on RStudio

### Copy everything below this line and paste it in RStudio or any online R platform and you will get the timeline

# Install and load library
install.packages("timevis")
library("timevis")

# Load demo project task list from Google drive
## replace "1N7Nyi-u-mqAkQ8SmwsgK6D4QkGE0kOpK" to your Google document ID if you want to make your own timeline
id <- "1N7Nyi-u-mqAkQ8SmwsgK6D4QkGE0kOpK"
dt <- read.csv(sprintf("https://docs.google.com/uc?id=%s&export=download", id))
print(dt)

# Prepare the data
dt[dt==""] <- NA # Replace all blank to NA
dt$start <- as.Date(as.character(dt$start), "%d/%m/%Y") # reformat the date field to my preferred format
dt$end <- as.Date(as.character(dt$end), "%d/%m/%Y")
dt$content <- as.character(dt$content) # formate the content as text characters

# Plot the Timeline
## Here is the exciting part. Simply run the following code and we will have a timeline. You can zoom in and out and drag horizontally to display the tasks.
timevis(dt, width = 900)

# Plot the Timeline with grouping
groups = data.frame(id = 1:4, content = c("Outreaching", "System/Platform Changes", "Xmas Shutdown Period", "Key Milestone"))
timevis(dt, groups, width = 900)