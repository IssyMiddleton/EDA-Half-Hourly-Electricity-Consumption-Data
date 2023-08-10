# Consumption Analysis

This R code uses ProjectTemplate and produces an Energy Report in .pdf format using RMarkdown. An example report is saved in the Reports folder, which will be overwritten if you knit the RMarkdown file provided. This analysis will look for a file in the data folder called consumption so if you'd like to rerun against new data, simply replace the existing .csv file called consumption with a new one. 

The .csv file provided in the data folder called consumption contains actual, half-hourly electricty consumption readings, provided by a volunteer with full consent to share in the interests of innovation and learning. The profile is believed to be reflective of a domestic property without Low Carbon Technologies.

ProjectTemplate is an R package that helps users organize statistical analysis projects. 

To load your new project, you'll first need to `setwd()` into the directory where this README file is located. Then you need to run the following two
lines of R code:

	library('ProjectTemplate')
	load.project()

Data, already fully preprocessed is loaded with all of the libraries you want to use. The RMarkdown report is saved to the folder called reports.

For more details about ProjectTemplate, see http://projecttemplate.net
