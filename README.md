# Consumption Analysis

This file uses ProjectTemplate and produces an Energy Report in pdf format using RMarkdown. An example is saved in the Reports folder.

The file provided in the data folder called consumption contains actual, half-hourly electricty consumption readings, provided by a volunteer with full consent to share in the interests of innovation and learning. The profile is believed to be reflective of a domestic property without Low Carbon Technologies.

ProjectTemplate is an R package that helps users organize statistical analysis projects. 

To load your new project, you'll first need to `setwd()` into the directory where this README file is located. Then you need to run the following two
lines of R code:

	library('ProjectTemplate')
	load.project()

Data, already fully preprocessed is loaded with all of the libraries you want to use. The RMarkdown report is saved to the folder called reports.

For more details about ProjectTemplate, see http://projecttemplate.net
