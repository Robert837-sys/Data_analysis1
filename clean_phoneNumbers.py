import pandas as pd 
df=pd.read_excel('Customer Call List.xlsx')
df.drop(columns="Not_Useful_Column",inplace=True)
# df['Phone_Number'].str.replace('[^a-zA-z0-9]','')
df['Phone_Number']=df['Phone_Number'].str.replace('[^a-zA-Z0-9]','',regex=True)
# df['Phone_Number'].apply(lambda x: x.replace('[^a-zA-Z0-9]',''))
# df['Phone_Number'].apply(lambda x: x[0:3] + '-' + x[3:6] + '-' + x[6:10])

df["Phone_Number"]=df["Phone_Number"].apply(lambda x: str(x))
df["Phone_Number"]=df['Phone_Number'].apply(lambda x: x[0:3] + '-' + x[3:6] + '-' + x[6:10])
df['Phone_Number'].str.replace('nan--','',regex=True)
print(df.to_string())

