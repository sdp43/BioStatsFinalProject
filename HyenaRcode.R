#this is the R code needed to output a plot with a line of best fit as well and do a linear regression analysis

#a file called "FinalProject" was made to store certaind ocuments, such as the raw data csv file
setwd("~/Desktop/FinalProject")
hyena<-read.csv('HyenaData.csv')
hyena<- as.data.frame(hyena)

#check if data is correclty transferred and made into dataframe
hyena
typeof(hyena)

#output summary of data (mean, median, etc.)
outsum<- capture.output(summary(hyena))
cat("Results", outsum, file="summary.txt", sep="\n", append=FALSE)

pdf("scatterplot.pdf")
plot<- plot(FundamentalFreq ~ Age, data= hyena, ylab= "Fundamental Frequency (Hz)", xlab = "Age (years)", main= "Hyena's Fundamental Frequency in Relation to Age")
dev.off()


####################################################################################################
lion <- read.csv(url("http://www.zoology.ubc.ca/~schluter/WhitlockSchluter/wp-content/data/chapter17/chap17e1LionNoses.csv"))
head(lion)
plot(ageInYears ~ proportionBlack, data = lion)
