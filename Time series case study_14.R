pollution = read.csv("C:\\Users\\hp\\Desktop\\Assignments\\Time series\\PredictiveAnalyticsPollutionData.csv")
head(pollution)

#Q1

pollution$type = replace(pollution$type,pollution$type== "RIRUO","Residential Area")
pollution$type = replace(pollution$type,pollution$type== "Industrial Area","Industrial")
pollution$type = replace(pollution$type,pollution$type== "Sensitive Area" ,"Sensitive")
pollution$type = replace(pollution$type,pollution$type== "Industrial Areas","Industrial")
pollution$type = replace(pollution$type,pollution$type== "Sensitive Areas" ,"Sensitive")
pollution$type = replace(pollution$type,pollution$type== "Residential Area" ,"Residential")
pollution$type = replace(pollution$type,pollution$type== "Residential and others" ,"Residential")
pollution$type = replace(pollution$type,pollution$type== "Residential, Rural and other Areas" ,"Residential")


head(pollution)
unique(pollution$type)
View(pollution)




#Q2

pol = pollution[which(pollution$stn_code==52 & pollution$location=="Pune"),]
cbind(lapply(lapply(pol[c('so2','no2','spm','rspm','pm2_5')],is.na), sum))
pol[,c('rspm','pm2_5')] = list(NULL)
pol$date = as.Date(pol$date, format = "%m/%d/%Y")
pol$qtr = quarters(pol$date)

qtr1 = pol[which(pol$qtr == "Q1"),]
qtr2 = pol[which(pol$qtr == "Q2"),]
qtr3 = pol[which(pol$qtr == "Q3"),]
qtr4 = pol[which(pol$qtr == "Q4"),]

length(which(is.na(qtr1$spm)))
qtr1$spm[is.na(qtr1$spm)] = mean(qtr1$spm,na.rm = TRUE)
qtr2$spm[is.na(qtr2$spm)] = mean(qtr2$spm,na.rm = TRUE)
qtr3$spm[is.na(qtr3$spm)] = mean(qtr3$spm,na.rm = TRUE)
qtr4$spm[is.na(qtr4$spm)] = mean(qtr4$spm,na.rm = TRUE)
pol = rbind(qtr1,qtr2,qtr3,qtr4)
cbind(lapply(lapply(pol[c('so2','no2','spm')],is.na), sum))


#Q3

  library(forecast)
  
  quantile(pollution$spm,na.rm = TRUE)
  
  pollution$spm = na.interp(pollution$spm)
  pollution$so2 = na.interp(pollution$so2)
  pollution$no2 = na.interp(pollution$no2)
  pollution$rspm= na.interp(pollution$rspm)
  
  quantile(pollution$spm,na.rm = TRUE)
  
  pollution$spm_category[(pollution$spm<=117)] <- "Very Good"
  pollution$spm_category[(pollution$spm>117)&(pollution$spm<=182)] <- "Good"
  pollution$spm_category[(pollution$spm>182)&(pollution$spm<=277)] <- "Poor"
  pollution$spm_category[(pollution$spm>277)&(pollution$spm<=3380)] <- "Very Poor"
  view(pollution)
  
  nrow(pollution[which(pollution$spm_category=="Very Good"),])
  nrow(pollution[which(pollution$spm_category=="Good"),])
  nrow(pollution[which(pollution$spm_category=="Poor"),])
  nrow(pollution[which(pollution$spm_category=="Very Poor"),])
  nrow(pollution)
  
  V = lm(so2~type,data=pollution)
  summary(V)

  

#Q4


pollution$pm2_5 = na.interp(pollution$pm2_5)
pollution$spm = na.interp(pollution$spm)
pollution$rspm = na.interp(pollution$rspm)
pollution$so2 = na.interp(pollution$so2)
pollution$no2 = na.interp(pollution$no2)

m1 = lm(so2~type, data=pollution)
m2 = lm(spm~type, data=pollution)
m3 = lm(no2~type, data=pollution)
m4 = lm(rspm~type, data=pollution)
m5 = lm(pm2_5~type, data=pollution)

summary(m1)
summary(m2)
summary(m3)
summary(m4)
summary(m5)

#Since the coefficient is negative in 
#residential areas of pollutants , The claim that the environmentalists make is correct.


#Q5


  which(is.na(dp$so2))
  which(is.na(dp$date))
  
  dp = pollution[which(pollution$location == "Pune" & pollution$type == "Industrial"),]
  head(dp)
  
  
  dp$so2
  
  dp$date = as.Date(dp$date, format = "%m/%d/%Y")
  head(dp)
  dp = drop_na(dp,location)
  nrow(dp)
  dp$spm = na.interp(dp$spm)
  dp$so2 = na.interp(dp$so2)
  dp_ts = ts(dp$so2,frequency = 4)
  plot(dp_ts)
  
  decom = decompose(dp_ts)
  plot(decom)
  holt_model = HoltWinters(dp_ts)
  holt_forecast = forecast:::forecast.HoltWinters(holt_model,h=16)
  resid2=holt_forecast$residuals                      
  sqrt((sum(resid2**2,na.rm = T)/length(resid2)))
  
  holt_forecast
