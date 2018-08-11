LOAD DATA
APPEND

INTO TABLE Time_Table
FIELDS TERMINATED BY ","
(Time_ID date 'MM/DD/YYYY', Time_Name, Time_Day, Time_Month_Year, Time_Month, Time_MonthNum, Time_Year, Time_DayOfWeek, Time_Qtr, Time_Julian)
