# Predictive-analytics-pollution-case-study
This case study looks into the pollution related data collected from different locations across all major states.
The purpose of this study is to study the patterns in the pollution levels and take appropriate actions customized to the particular 
location.
The study will also predict the pollution levels that can be expected going into the future.
The first column gives each location a specific station code. The last column date has the date mentioned in the format mm/dd/yyyy 
format.
The values of five pollutants have been collected. They are SO2, NO2, RSPM, SPM and PM2.5.

1. Under the "type" column, the location was supposed to be categorized as an industrial, residential and sensitive area. Since multiple 
entries are given in the datasets, aggregate them and divide them into the above mentioned categories. RIRUO can be considered as a 
residential area.

2. For all the five pollutants, a number of values are missing. Predict the missing values by using the values available for the same 
location during other dates. The location may be considered as Pune and station code as 52. Consider the values on a quarterly basis. 
Wherever multiple values are available for a quarter, take the average of all the readings.
Justify the technique that you wish to use for estimating the missing values.

3. Divide the states into four categories on the basis of the SPM value. The categorization can be done on the basis of quartile values. 
Establish whether the SO2 value depends on the category of the city or not. Also check whether the SO2 value depends on the category 
of the location that was created under the first question. Discuss your conclusions.

4. The environmentalists claim that the pollution levels of all pollutants is more in industrial areas as compared to residential areas. 
Check this claim using the appropriate tool.

5. Extract the SO2 values for the industrial areas of Pune. Plot the graph depicting the variation of this pollutant and predict its value 
over the next four years. Any missing values can be estimated using appropriate methods. You may consider the values on the quarterly 
basis like in Question # 2.
