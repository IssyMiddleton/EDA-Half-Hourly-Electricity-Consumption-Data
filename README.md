# Consumption Analysis

This file uses ProjectTemplate and produces an Energy Report in pdf format using RMarkdown. An example is saved in the Reports folder.

The consumption data provided in the folder called data is real data, provided by a volunteer. The profile is believed to be reflective of a domestic property without Low Carbon Technologies.

ProjectTemplate is an R package that helps users organize statistical analysis projects. 

To load your new project, you'll first need to `setwd()` into the directory where this README file is located. Then you need to run the following two
lines of R code:

	library('ProjectTemplate')
	load.project()

Data, already fully preprocessed is loaded with all of the libraries you want to use. The RMarkdown report is saved to the folder called reports.

For more details about ProjectTemplate, see http://projecttemplate.net
