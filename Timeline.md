---
title: "Create a Dynamic Projet Timeline on RStudio"
author: "Lok Yiu"
date: "2018-10-24"
output:
      html_document:
        keep_md: true
---



## Create a Timeline on R
This is an example of creating a timeline using the R script created by [Dean Attali](https://daattali.com/shiny/timevis-demo/) and the `timevis` package. I really like it as the script is very simple ad tidy. This is a great example for data scientists or analysts using our programming knowledge to make thing in the way we want (and without any additional cost to purchase other software)! 

My approach is slightly different to Dean's one. I think making a task list on MS Excel is more handy than typing the task and dates directly into the script, in particular I know my list will grow dramatically in the future. Thus I have made a modification in this demo: Making a timeline by reading the a task list from a CSV file.

My script can be found on [Github](https://github.com/lokyiu/lokyiu.github.io/blob/master/timeline.R) and you can download the timeline in the [html version](https://github.com/lokyiu/lokyiu.github.io/blob/master/Create%20a%20Dynamic%20Projet%20Timeline%20on%20RStudio.html)

## Getting Start [Skip if you have RStudio installed on your computer]
* To begin with the very first step is to install [RStudio](https://www.rstudio.com/), then install. Or you can follow the instructions created by [ayeimanolr](https://ayeimanol-r.net/2013/04/21/289/). Getting RStudio is free and easy. 


```r
# install.packages("timevis") # Remove the "#" in this line and run if you have not installed the packages
library("timevis")
```

## Load Data
As an example, you can download my example project task lists on Google drive:


```r
id <- "1N7Nyi-u-mqAkQ8SmwsgK6D4QkGE0kOpK"
dt <- read.csv(sprintf("https://docs.google.com/uc?id=%s&export=download", id))
print(dt)
```

```
##    id                              content      start        end group
## 1   1                        Project Start 15/10/2018                4
## 2   2                          ED Approval 15/11/2018                4
## 3   3                     Shiny Deployment 17/12/2018 14/01/2019     2
## 4   4    Shiny: Deploy on Testing Platform 17/12/2018 24/12/2018     2
## 5   5 Shiny: Deploy on Production Platform  6/01/2019 14/01/2019     2
## 6   6                        Xmas Shutdown 25/12/2018  5/01/2019     3
## 7   7                          Project End 15/01/2019                4
## 8   8                    Engagement Period 15/11/2018  6/01/2019     1
## 9   9                       Shiny: Testing  8/11/2018 15/11/2018     2
## 10 10             Final Engagment Strategy  8/11/2018 15/11/2018     1
## 11 11             Draft Engagment Strategy  1/11/2018  8/11/2018     1
```

## Prepare the task list
I reformat 3 columns to make sure the date and task can displayed properly.


```r
dt[dt==""] <- NA # Replace all blank to NA
dt$start <- as.Date(as.character(dt$start), "%d/%m/%Y") # reformat the date field to my preferred format
dt$end <- as.Date(as.character(dt$end), "%d/%m/%Y")
dt$content <- as.character(dt$content) # formate the content as text characters
```

## Plot the Timeline
Here is the exciting part. Simply run the following code and we will have a timeline. You can zoom in and out and drag horizontally to display the tasks. 


```r
timevis(dt, width = 900)
```

<!--html_preserve--><div id="htmlwidget-afcb61539b6687fad10c" class="timevis html-widget" style="width:900px;height:480px;">
<div class="btn-group zoom-menu">
<button type="button" class="btn btn-default btn-lg zoom-in" title="Zoom in">+</button>
<button type="button" class="btn btn-default btn-lg zoom-out" title="Zoom out">-</button>
</div>
</div>
<script type="application/json" data-for="htmlwidget-afcb61539b6687fad10c">{"x":{"items":[{"id":" 1","content":"Project Start","start":"2018-10-15","group":"4"},{"id":" 2","content":"ED Approval","start":"2018-11-15","group":"4"},{"id":" 3","content":"Shiny Deployment","start":"2018-12-17","end":"2019-01-14","group":"2"},{"id":" 4","content":"Shiny: Deploy on Testing Platform","start":"2018-12-17","end":"2018-12-24","group":"2"},{"id":" 5","content":"Shiny: Deploy on Production Platform","start":"2019-01-06","end":"2019-01-14","group":"2"},{"id":" 6","content":"Xmas Shutdown","start":"2018-12-25","end":"2019-01-05","group":"3"},{"id":" 7","content":"Project End","start":"2019-01-15","group":"4"},{"id":" 8","content":"Engagement Period","start":"2018-11-15","end":"2019-01-06","group":"1"},{"id":" 9","content":"Shiny: Testing","start":"2018-11-08","end":"2018-11-15","group":"2"},{"id":"10","content":"Final Engagment Strategy","start":"2018-11-08","end":"2018-11-15","group":"1"},{"id":"11","content":"Draft Engagment Strategy","start":"2018-11-01","end":"2018-11-08","group":"1"}],"groups":null,"showZoom":true,"zoomFactor":0.5,"fit":true,"options":[],"height":null,"api":[]},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

## Plot the Timeline with grouping
You can also visualise tasks by groups. You can also download the .html file to view the timeline on Chrome/IE. I hope you enjoy this demo.


```r
groups = data.frame(id = 1:4, content = c("Outreaching", "System/Platform Changes", "Xmas Shutdown Period", "Key Milestone"))
timevis(dt, groups, width = 900)
```

<!--html_preserve--><div id="htmlwidget-614f6c57dacfde4b092b" class="timevis html-widget" style="width:900px;height:480px;">
<div class="btn-group zoom-menu">
<button type="button" class="btn btn-default btn-lg zoom-in" title="Zoom in">+</button>
<button type="button" class="btn btn-default btn-lg zoom-out" title="Zoom out">-</button>
</div>
</div>
<script type="application/json" data-for="htmlwidget-614f6c57dacfde4b092b">{"x":{"items":[{"id":" 1","content":"Project Start","start":"2018-10-15","group":"4"},{"id":" 2","content":"ED Approval","start":"2018-11-15","group":"4"},{"id":" 3","content":"Shiny Deployment","start":"2018-12-17","end":"2019-01-14","group":"2"},{"id":" 4","content":"Shiny: Deploy on Testing Platform","start":"2018-12-17","end":"2018-12-24","group":"2"},{"id":" 5","content":"Shiny: Deploy on Production Platform","start":"2019-01-06","end":"2019-01-14","group":"2"},{"id":" 6","content":"Xmas Shutdown","start":"2018-12-25","end":"2019-01-05","group":"3"},{"id":" 7","content":"Project End","start":"2019-01-15","group":"4"},{"id":" 8","content":"Engagement Period","start":"2018-11-15","end":"2019-01-06","group":"1"},{"id":" 9","content":"Shiny: Testing","start":"2018-11-08","end":"2018-11-15","group":"2"},{"id":"10","content":"Final Engagment Strategy","start":"2018-11-08","end":"2018-11-15","group":"1"},{"id":"11","content":"Draft Engagment Strategy","start":"2018-11-01","end":"2018-11-08","group":"1"}],"groups":[{"id":"1","content":"Outreaching"},{"id":"2","content":"System/Platform Changes"},{"id":"3","content":"Xmas Shutdown Period"},{"id":"4","content":"Key Milestone"}],"showZoom":true,"zoomFactor":0.5,"fit":true,"options":[],"height":null,"api":[]},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

