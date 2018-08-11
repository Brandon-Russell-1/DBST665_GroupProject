LOAD DATA
APPEND

INTO TABLE Work_Fact_Table
FIELDS TERMINATED BY ","
(Work_OdoReading, Work_Cost, Work_NumOfActHours, Cust_ID, Parts_ID, MaintAct_ID, Veh_ID, Time_ID date 'MM/DD/YYYY')
