#this is the R code needed to do a linear regression analysis

####################################################################################################
#looking at the sample data

#a file called "FinalProject" was made to store certaind ocuments, such as the raw data csv file
setwd("~/Desktop/FinalProject")
hyena<-read.csv('HyenaData.csv')
hyena<- as.data.frame(hyena)

#check if data is correclty transferred and made into dataframe
hyena
typeof(hyena)

#output summary of data (mean, median, etc.)
outsum<- capture.output(summary(hyena))
cat("Results", outsum, file="dataSummary.txt", sep="\n", append=FALSE)

pdf("scatterplot.pdf")
plot<- plot(FundamentalFreq ~ Age, data= hyena, ylab= "Fundamental Frequency (Hz)", xlab = "Age (years)", main= "Hyena's Fundamental Frequency in Relation to Age")
dev.off()

####################################################################################################
#linear regression analysis of smaple data

#Fit the linear regression to the data using least squares. Use lm, which was also used for ANOVA
#Save the results into a model object, and then use other commands to take the quantities we want.
hyenaRegression <- lm(FundamentalFreq ~ Age, data = hyena)

#make text file of regression output
out<- capture.output(summary(hyenaRegression))
plot(FundamentalFreq ~ Age, data= hyena, ylab= "Fundamental Frequency (Hz)", xlab = "Age (years)", main= "Hyena's Fundamental Frequency in Relation to Age")
cat("Results", out, file="regressionSummary.txt", sep="\n", append=FALSE)

#add least squares regression line to plot
pdf("scatterplotwithregressionLine.pdf")
plot(FundamentalFreq ~ Age, data= hyena, ylab= "Fundamental Frequency (Hz)", xlab = "Age (years)", main= "Hyena's Fundamental Frequency in Relation to Age")
abline(hyenaRegression)
dev.off()

####################################################################################################

