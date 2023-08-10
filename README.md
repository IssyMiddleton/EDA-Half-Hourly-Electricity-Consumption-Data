# Half-Hourly Electricity Consumption Analysis

This R code uses ProjectTemplate and produces an Energy Report in .pdf format using RMarkdown. An example report is saved in the Reports folder, which will be overwritten if you knit the RMarkdown file provided. This analysis will look for a file in the data folder called consumption so if you'd like to rerun against new data, simply replace the existing .csv file called consumption with a new one (same format obviously - two columns, Timestamp and Value). If you have gas consumption data in the same format the reports will generate, the labels will be kWh. No price data or daily standing charges are included.

The .csv file provided in the data folder called consumption contains actual, half-hourly electricty consumption readings, provided by a volunteer with full consent to share in the interests of innovation and learning. The profile is believed to be reflective of a domestic property without Low Carbon Technologies.

ProjectTemplate is an R package that helps users organize statistical analysis projects. Download the code from GitHub and open in RStudio (green button Code, Download Zip from the main branch).To load your new project, you'll first need to `setwd()` into the directory where this README file is located, once you've extracted from the zip file. Then you need to run the following two lines of R code:

	library('ProjectTemplate')
	load.project()

For more details about ProjectTemplate, see http://projecttemplate.net
