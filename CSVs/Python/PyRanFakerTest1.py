import csv
import sys
import random
from datetime import datetime

f=open("TImeTable1_IDs.txt","r")

g=open("1.csv","a")
w=csv.writer(g, lineterminator='\n')
w.writerow(('Work_OdoReading','Work_Cost','Work_NumOfActHours','Cust_ID','Parts_ID','MaintAct_ID','Veh_ID','Time_ID'))
for i in range(1000):

    w.writerow((random.randrange(500,100000,6),random.uniform(100.1,10000.9),random.randrange(5,100,5),random.randrange(1,1000,1),random.randrange(1,1000,1),random.randrange(1,1000,1),random.randrange(1,1000,1),f.readline().rstrip('\n')))

f.close()
g.close()

