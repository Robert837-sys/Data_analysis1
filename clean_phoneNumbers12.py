import pandas as pd 
df=pd.read_excel('Customer Call List.xlsx')
df.drop(columns="Not_Useful_Column",inplace=True)

df['Phone_Number']=df['Phone_Number'].astype(str)
df['Phone_Number']=df['Phone_Number'].str.replace('[^0-9]','',regex=True)

def format_phone(x):
  if len(x)==10:
    return f"{x[0:3]}-{x[3:6]}-{x[6:10]}"
  else:
    return ''
df['Phone_Number']=df['Phone_Number'].apply(format_phone)
print(df['Address'].str.split(',',n=2,expand=True))
df[["street_Address","State","Zip_Code"]]=df['Address'].str.split(',',n=2,expand=True)
print(df.to_string())