import pandas as pd 
df=pd.read_excel('Customer Call List.xlsx')
df.drop(columns="Not_Useful_Column",inplace=True)
df.drop_duplicates(inplace=True)
df["Last_Name"]=df["Last_Name"].str.strip("123._/")

df['Phone_Number']=df['Phone_Number'].astype(str)
df['Phone_Number']=df['Phone_Number'].str.replace('[^0-9]','',regex=True)

def format_phone(x):
  if len(x)==10:
    return f"{x[0:3]}-{x[3:6]}-{x[6:10]}"
  else:
    return ''
df['Phone_Number']=df['Phone_Number'].apply(format_phone)
df['Address'].str.split(',',n=2,expand=True)
df[["street_Address","State","Zip_Code"]]=df['Address'].str.split(',',n=2,expand=True)
df['Paying Customer'] = df['Paying Customer'].str.replace('Yes', 'Y', regex=True)
df['Paying Customer'] = df['Paying Customer'].str.replace('No', 'N', regex=True)
df['Do_Not_Contact'] = df['Do_Not_Contact'].str.replace('Yes', 'Y', regex=True)
df['Do_Not_Contact'] = df['Do_Not_Contact'].str.replace('No', 'N', regex=True)
df.replace('N/a', '', regex=True, inplace=True)
df.fillna('', inplace=True)

for x in df.index:
  if df.loc[x,"Do_Not_Contact"]=='Y':
    df.drop(x,inplace=True)
for x in df.index:
  if df.loc[x,"Phone_Number"]=='':
    df.drop(x,inplace=True)

df.reset_index(drop=True, inplace=True)
# drop=True prevents old column from being added to the dataframe
print(df.to_string())