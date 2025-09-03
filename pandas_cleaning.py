import pandas as pd 

# Load Excel file
df = pd.read_excel('Customer Call List.xlsx')

# Remove duplicates directly
# df.drop_duplicates(inplace=True)

# Save back to the same Excel file
# df.to_excel('Customer Call List.xlsx', index=False)

# print("Duplicates removed and file saved successfully!")
print(df.drop(columns='Not_Useful_Column'))
df["Last_Name"].str.strip()