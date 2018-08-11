DROP TABLE Work_Fact_Table;
DROP TABLE Parts;
DROP TABLE Customers;
DROP TABLE Maintenance_Actions;
DROP TABLE Time_Table;
DROP TABLE Vehicles;

CREATE TABLE Parts (
    Parts_ID NUMBER NOT NULL,
	Parts_Name VARCHAR(50) NOT NULL,
	Parts_Description VARCHAR(100) NOT NULL,
	Parts_Category VARCHAR(50) NOT NULL,
	Parts_Brand VARCHAR(50) NOT NULL, 
	Parts_Weight NUMBER NOT NULL,
	Parts_UnitOfIssue NUMBER NOT NULL,
	CONSTRAINT pk_parts PRIMARY KEY (Parts_ID)
);

CREATE TABLE Customers (
    Cust_ID NUMBER NOT NULL,
    Cust_FName VARCHAR(50) NOT NULL,
    Cust_LName VARCHAR(50) NOT NULL,
    Cust_Address VARCHAR(100) NOT NULL,
    Cust_City VARCHAR(50) NOT NULL,
    Cust_Country VARCHAR(50) NOT NULL,
    Cust_State VARCHAR(50) NOT NULL,
    Cust_Zip VARCHAR(50) NOT NULL,
    Cust_PhoneNum VARCHAR(50) NOT NULL,
    CONSTRAINT pk_customers PRIMARY KEY (Cust_ID)
);

CREATE TABLE Maintenance_Actions (
    MaintAct_ID NUMBER NOT NULL,
    MaintAct_Name VARCHAR(50) NOT NULL,
    MaintAct_Description VARCHAR(100) NOT NULL,
    MaintAct_Category VARCHAR(100) NOT NULL,
    MaintAct_NumOfHours NUMBER NOT NULL,
    MaintAct_TeamSize NUMBER NOT NULL,
    CONSTRAINT pk_maintenance_actions PRIMARY KEY (MaintAct_ID)
);

CREATE TABLE Time_Table (
    Time_ID DATE NOT NULL,
    Time_Name VARCHAR(50)NOT NULL,
    Time_Day NUMBER NOT NULL,
    Time_Month_Year VARCHAR(50)NOT NULL,
    Time_Month  VARCHAR(50) NOT NULL,
    Time_MonthNum NUMBER NOT NULL,
    Time_Year NUMBER(4,0) NOT NULL,
    Time_DayOfWeek VARCHAR(50) NOT NULL,
    Time_Qtr VARCHAR(50) NOT NULL,
    Time_Julian NUMBER NOT NULL,
    CONSTRAINT pk_time PRIMARY KEY (Time_ID)
);

CREATE TABLE Vehicles (
    Veh_ID NUMBER NOT NULL,
    Veh_Make VARCHAR(50) NOT NULL,
    Veh_Model VARCHAR(50) NOT NULL,
    Veh_Year NUMBER(4,0) NOT NULL,
    Veh_Color VARCHAR(50) NOT NULL,
    Veh_BodyType VARCHAR(50) NOT NULL,
    Veh_NumOfAxles NUMBER NOT NULL,
    Veh_FuelType VARCHAR(50) NOT NULL,
    Veh_NumOfCyl NUMBER NOT NULL,
    Veh_Weight NUMBER NOT NULL,
    CONSTRAINT pk_vehicles PRIMARY KEY (Veh_ID)
);

CREATE TABLE Work_Fact_Table (
    Work_OdoReading NUMBER NOT NULL,
    Work_Cost NUMBER(*, 2) NOT NULL,
    Work_NumOfActHours NUMBER NOT NULL,
    Cust_ID NUMBER NOT NULL,
    Parts_ID NUMBER NOT NULL,
    MaintAct_ID NUMBER NOT NULL,
    Veh_ID NUMBER NOT NULL,
    Time_ID DATE NOT NULL,
    CONSTRAINT pk_work_fact_table PRIMARY KEY (Cust_ID,Parts_ID,MaintAct_ID,Veh_ID,Time_ID),
    CONSTRAINT fk_customers FOREIGN KEY (Cust_ID)
        REFERENCES Customers ON DELETE CASCADE,
    CONSTRAINT fk_maintenance_actions FOREIGN KEY (MaintAct_ID)
        REFERENCES Maintenance_Actions ON DELETE CASCADE,
    CONSTRAINT fk_time_table FOREIGN KEY (Time_ID)
        REFERENCES Time_Table ON DELETE CASCADE,
    CONSTRAINT fk_vehicles FOREIGN KEY (Veh_ID)
        REFERENCES Vehicles ON DELETE CASCADE,
    CONSTRAINT fk_parts FOREIGN KEY (Parts_ID)
        REFERENCES Parts ON DELETE CASCADE
);

CREATE INDEX fk_customers on Work_Fact_Table(Cust_ID);
CREATE INDEX fk_maintenance_actions on Work_Fact_Table(MaintAct_ID);
CREATE INDEX fk_time_table on Work_Fact_Table(Time_ID);
CREATE INDEX fk_vehicles on Work_Fact_Table(Veh_ID);
CREATE INDEX fk_parts on Work_Fact_Table(Parts_ID);


