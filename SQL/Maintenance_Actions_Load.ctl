LOAD DATA
APPEND

INTO TABLE Maintenance_Actions
FIELDS TERMINATED BY ","
(MaintAct_Id, MaintAct_Name, MaintAct_Description, MaintAct_Category, MaintAct_NumOfHours, MaintAct_TeamSize)
