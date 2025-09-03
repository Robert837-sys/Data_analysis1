import pandas as pd 
import matplotlib.pyplot as plt 
import numpy as np

df = pd.read_excel('sales.xlsx',engine='openpyxl', nrows=10)
# This data lacks Retails and wholesale columns but in case they were there, this is the formulae to calculate total using pandas in python
# df['Total'] = df['Retails'] + df['Wholesale']


# let's say you are given Actual date column and you want to extract say month, this can be done by the following formulae
# df['Month']=df['Actual Date'].dt.month

# to extract month and year at the same time use the following formulae
# df['Month_ear']=df['Actual Date'].dt.strftime('%b %y')

# formulae to extract day
# df['Day']=df['Actual Date'].dt.day

# formulae to extract dayName
# df['Day_Name']=df['Actual Date'].dt.strftime('%A')

# to extract year
# df['Year']=df['Actual Date'].dt.year

print(df.head())
