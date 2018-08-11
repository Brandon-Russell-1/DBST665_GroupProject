/*Check to see how many parts with a weight of more than 20 are not being used*/
SELECT COUNT(*) FROM
(SELECT Parts_ID FROM Parts 
    WHERE Parts_Weight > 20
        MINUS
            SELECT Parts_ID FROM Work_Fact_Table);

/*Check which customers have multiple shop visits*/
SELECT Cust_ID, Count(Cust_ID) FROM Work_Fact_Table
    GROUP BY Cust_ID
        HAVING Count(Cust_ID) > 1
            ORDER BY Count(Cust_ID) DESC;

/*Reconciliation Check*/
SELECT Count(*) FROM CUSTOMERS;
SELECT Count(*) FROM WORK_FACT_TABLE;

/*Quarterly Sales for Calendar Year 2017*/
SELECT Time_Qtr, SUM(Work_Cost) AS Work_Cost_Summary FROM WORK_FACT_TABLE
    INNER JOIN Time_Table USING (Time_ID)
        WHERE Time_Year = 2017
            GROUP BY Time_Qtr
                ORDER BY Work_Cost_Summary;

/*Identify which vehicles are bringing in the most money using ROLLUP*/
SELECT Veh_ID, Count(*), Work_Cost, SUM(Work_Cost) AS Total_Profit FROM WORK_FACT_TABLE
    GROUP BY ROLLUP(Veh_ID, Work_Cost);

/*Identify which maintenance actions on which vehicles are bringing in the most money*/
SELECT Veh_ID, MaintAct_ID, Count(*), Work_Cost, SUM(Work_Cost) AS Total_Profit FROM WORK_FACT_TABLE
    GROUP BY ROLLUP(Veh_ID, MaintAct_ID, Work_Cost);

/*Identify the the amount of electrical and chassis parts that were used during December 2017, with cost.*/
SELECT Parts_Category, Work_Cost, SUM(Work_Cost), Count(Parts_Category) AS Amount_Used FROM WORK_FACT_TABLE f
    INNER JOIN TIME_TABLE t ON f.Time_ID = t.Time_ID
        INNER JOIN PARTS p ON f.Parts_ID = p.Parts_ID
            WHERE Time_MonthNum = 12 AND Time_Year = 2017 AND Parts_Category IN ('Electrical','Chassis')
                GROUP BY ROLLUP(Parts_Category, Work_Cost);
                
/*Use the CUBE to determine the number of Maintenance Actions taken, along with number of individual hours worked and a sum of all hours for each maintenance action and overall.*/
SELECT MaintAct_ID, Count(MaintAct_ID), 
        Work_NumOfActHours AS Ind_Action_Hours_Worked, SUM(Work_NumOfActHours) AS Total_Hours_Worked 
            FROM WORK_FACT_TABLE
                    GROUP BY CUBE(MaintAct_ID, Work_NumOfActHours);

