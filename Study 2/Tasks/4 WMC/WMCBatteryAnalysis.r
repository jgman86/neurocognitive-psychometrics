#wipe everything
rm(list=ls())
graphics.off()
library(graphics)
library(xlsReadWrite)


## READ DATA FILES:

## MAC (may or may not work)
# datafilename <- file.choose(new = FALSE)
# dir <- strsplit(datafilename,"logs/")
#	dataDir <- dir[[1]][1]
#	datafilename <- paste(dataDir,"logs/",list.files(paste(dataDir,"logs/", sep="")),sep="")

## WIN	
datafilename <- choose.files()

dir <- strsplit(datafilename,"-")   #splits file name (including path) into segments at the "-"
sub <- c()
sexp <- c()
sexpTab <- c()
for (i in 1:length(datafilename)) {
	sub <- cbind(sub,dir[[i]][2]) 
	sexp <- cbind(sexp,strsplit(dir[[i]][1],"\\\\"))  #splits file directory and name
  lexp <- length(sexp[[i]])   #how many snippets are there in sexp? The last is the task name
  dataDir <- "C:"
  for (j in 2:(lexp-1)) {
    dataDir <- paste(dataDir, sexp[[1]][j], sep="\\")
   }
	sexpTab <- cbind(sexpTab,sexp[[i]][lexp])	#task name

}
	tab_sub <- table(sub) 
	subjects <- as.numeric(names(tab_sub))
	numOfSubj <- as.vector(tab_sub)
	
	tab_sexp <- table(sexpTab)	
	subexperiments <- as.factor(names(tab_sexp))
	numOfSexp <- as.vector(tab_sexp)

#subjects
#numOfSubj
#subexperiments
#numOfSexp
#datafilename

# test <- matrix(nrow=length(subjects),ncol=length(subexperiments))
data <- as.data.frame(matrix(nrow=length(subjects),ncol=16))
names(data)<- c("Subject", "MUpc", "OSpcLet", "OSrtLet", "OSpcOp", "OSrtOp", "SSTM", "ChRTpc", "ChRTrt", "TSpc", "nTSpc", "TSrt", "nTSrt", "WRpcKey", "WRrtKey", "WRresp")
for (subj in 1:length(subjects)) {
 	for (subexp in 1:length(subexperiments)) {
 		for (datafile in 1:length(datafilename)) {
 			#dat <- matrix();
 			dirsplit <- strsplit(datafilename[datafile],"-")
 			expsplit <- strsplit(dirsplit[[1]][1],"\\\\")
      lexpsplit <- length(expsplit[[1]])
 			if (as.character(subjects[subj]) == dirsplit[[1]][2] && subexperiments[subexp] == expsplit[[1]][lexpsplit]) {
 				# test[subj,subexp] <- 1;	
 				data$Subject[subj] <- subjects[subj]
	 			if (subexperiments[subexp] == "MU") {
	 				MUData <- read.table(datafilename[datafile], header=FALSE, row.names=NULL, fill=TRUE);
					names(MUData) <- c("Trial","R1", "R2", "R3", "R4", "R5", "R6", "S1", "S2", "S3", "S4", "S5", "S6");
					for (i in 1:dim(MUData)[1]) {
      					temp <- MUData[i,c("S1", "S2", "S3", "S4", "S5", "S6")]
      					MUData$MU[i] <- mean(temp[temp>-1])
     					}
     					MUpc <- mean(MUData$MU)
     					data$MUpc[subj] <- MUpc	
	 				}
 				else if (subexperiments[subexp] == "OS") {
 					OSData <- read.table(datafilename[datafile], header=FALSE, row.names=NULL, fill=TRUE)
					names(OSData)[1:2] <- c("Trial","Setsize")
  						letterDecision <- rep.int(0,dim(OSData)[1])
  						operationDecision <- rep.int(0,dim(OSData)[1])
						letterRT <- rep.int(0,dim(OSData)[1])
						operationRT <- rep.int(0,dim(OSData)[1])
  						for (i in 1:dim(OSData)[1]) {
            					for (j in 1:OSData$Setsize[i]) {
                						if (as.character(OSData[i,2+j]) == as.character(OSData[i,10+j]))
                    						{letterDecision[i] <- letterDecision[i]+1}
                						if (as.character(OSData[i,26+j]) == as.character(OSData[i,34+j]))
                    						{operationDecision[i] <- operationDecision[i]+1}
								#letterRT[i+1] <- letterRT[i] + OSData[i,18+j]  
            					}
            					letterDecision[i] <- letterDecision[i]/OSData$Setsize[i]
            					operationDecision[i]<-operationDecision[i]/OSData$Setsize[i]
							letterRT[i] <- sum(OSData[i,19:(18+OSData$Setsize[i])]/OSData$Setsize[i])
							operationRT[i] <- sum(OSData[i,43:(42+OSData$Setsize[i])]/OSData$Setsize[i])
    						}
					data$OSpcLet[subj] <- mean(letterDecision[1:dim(OSData)[1]])
					data$OSrtLet[subj] <- mean(letterRT[1:dim(OSData)[1]])
					data$OSpcOp[subj] <- mean(operationDecision[1:dim(OSData)[1]])
					data$OSrtOp[subj] <- mean(operationRT[1:dim(OSData)[1]])	
 					}
 				else if (subexperiments[subexp] == "SSTM") {
 					SSTMData <- read.table(datafilename[datafile], header=FALSE, row.names=NULL, skip=1, fill=TRUE)
 					data$SSTM[subj] <- SSTMData[2] 
 					}
				else if (subexperiments[subexp] == "TSC") {
					ChRTData <- read.table(datafilename[datafile], header=FALSE, row.names=NULL, fill=TRUE)
					names(ChRTData) <- c("Task", "dgt", "key", "correct", "RT")
					data$ChRTpc[subj] <- sum(ChRTData$correct)/dim(ChRTData)[1]
					data$ChRTrt[subj] <- aggregate(x=ChRTData$RT, by=list(ChRTData$correct), mean)$x[2]
					}
	 			else if (subexperiments[subexp] == "TS") {
	 				TSData <- read.table(datafilename[datafile], header=FALSE, row.names=NULL, fill=TRUE)
	 				names(TSData) <- c("Task", "dgt", "key", "correct", "RT")
					for (i in 2:dim(TSData)[1]) {     
      					TSData$TS[1] <- 0
      					temp[i] <- TSData$Task[i] - TSData$Task[i-1]
      					if (temp[i] == 0) {TSData$TS[i] <- 0} else {TSData$TS[i] <- 1}
     					}
     					data$nTSpc[subj] <- aggregate(x=TSData$correct, by=list(TSData$TS), mean)$x[1]
     					data$TSpc[subj] <- aggregate(x=TSData$correct, by=list(TSData$TS), mean)$x[2]
     					data$nTSrt[subj] <- aggregate(x=TSData$RT, by=list(TSData$TS, TSData$correct), mean)$x[2]
     					data$TSrt[subj] <- aggregate(x=TSData$RT, by=list(TSData$TS, TSData$correct), mean)$x[3]
	 				}
				else if (subexperiments[subexp] == "WR") {
					WRData <- read.table(datafilename[datafile], header=FALSE, row.names=NULL, skip=2, fill=TRUE)
					names(WRData) <- c("Letters", "cond", "correct", "RT", "response")
					data$WRpcKey[subj] <- sum(WRData$correct)/dim(WRData)[1]
					data$WRrtKey[subj] <- aggregate(x=WRData$RT, by=list(WRData$correct), mean)$x[2]
					temp <- charmatch(WRData$Letters, WRData$response, nomatch=0)
					data$WRresp[subj] <- length(which(temp>0))/dim(WRData)[1]					}
			}			
 		}
 	}
}

data

################################################
## Write data into Excel file
################################################

rawdata <- data.matrix(data) 
rawdat <- paste(dataDir,"rawdat.xls",sep="")
write.xls(rawdata, rawdat, colNames=TRUE, sheet = 1, from = 1, rowNames = NA, naStrings = ' ')


     
