/*Scenario 1*/
SELECT p.Parts_Id, p.Parts_Name, m.MaintAct_Id, m.MaintAct_Name
    FROM Work_Fact_Table w
        INNER JOIN Parts p ON w.Parts_ID=p.Parts_ID
            INNER JOIN Maintenance_Actions m ON w.MaintAct_ID=m.MaintAct_ID
                WHERE w.MaintAct_ID IN (SELECT MaintAct_ID FROM 
                    (SELECT MaintAct_ID, COUNT(MaintAct_ID) AS Maint_Count 
                        FROM Work_Fact_Table 
                            GROUP BY MaintAct_ID 
                                ORDER BY Maint_Count DESC) 
                                    WHERE Maint_Count >= 5)
                                        ORDER BY m.MaintAct_ID;


/*Scenario 2*/
SELECT Time_Month, Time_Qtr, SUM(Work_Cost) AS Cost_Summary
    FROM Work_Fact_Table w
        INNER JOIN Time_Table t ON w.Time_ID=t.Time_ID
            WHERE Time_Year = 2017
                GROUP BY CUBE(Time_Month, Time_Qtr)
                    ORDER BY Time_Qtr, Time_Month;

/*Scenario 3*/

SELECT c.Cust_ID, c.Cust_FName, c.Cust_LName, m.MaintAct_ID, m.MaintAct_Name
    FROM Work_Fact_Table w
        INNER JOIN Maintenance_Actions m ON w.MaintAct_ID = m.MaintAct_ID
            INNER JOIN Customers c ON w.Cust_ID=c.Cust_ID 
                WHERE m.MaintAct_ID IN (
                    SELECT MaintAct_ID FROM (
                        SELECT c.Cust_ID, m.MaintAct_ID, COUNT(w.MaintAct_ID) AS Maint_Count
                            FROM Work_Fact_Table w
                                INNER JOIN Maintenance_Actions m ON w.MaintAct_ID = m.MaintAct_ID
                                    INNER JOIN Customers c ON w.Cust_ID=c.Cust_ID 
                                        GROUP BY c.Cust_ID, w.MaintAct_ID, m.MaintAct_ID
                                            ORDER BY Maint_Count DESC)
                                                WHERE ROWNUM =1);



/*Scenario 4*/
SELECT w.MaintAct_ID, m.MaintAct_Name, SUM(w.Work_Cost)
    FROM Work_Fact_Table w
        INNER JOIN Maintenance_Actions m ON w.MaintAct_ID=m.MaintAct_ID
            GROUP BY w.MaintAct_ID, m.MaintAct_Name
                ORDER BY SUM(Work_Cost) ASC;
