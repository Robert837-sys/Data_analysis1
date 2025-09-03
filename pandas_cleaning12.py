import pandas as pd 

df=pd.read_excel('Customer Call List.xlsx')

# df.drop(columns='Not_Useful_Column',inplace=True)
# df.to_excel('Customer Call List.xlsx', index=False)
print(df['Last_Name'].str.strip())
