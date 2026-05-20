import pandas as pd
from sqlalchemy import create_engine

df = pd.read_csv(r"C:\Users\Admin\Desktop\Retail_Sales_Analytics_Project\Data\SuperStoreOrders.csv")

df.rename(columns={
    'state': 'State_name',
    'year': 'order_year'
}, inplace=True)

df['sales'] = pd.to_numeric(df['sales'], errors='coerce')
df['profit'] = pd.to_numeric(df['profit'], errors='coerce')
df['discount'] = pd.to_numeric(df['discount'], errors='coerce')
df['shipping_cost'] = pd.to_numeric(df['shipping_cost'], errors='coerce')
df['order_date'] = pd.to_datetime(df['order_date'], dayfirst=True, errors='coerce')
df['ship_date'] = pd.to_datetime(df['ship_date'], dayfirst=True, errors='coerce')

engine = create_engine(
    r"mssql+pyodbc://@DESKTOP-6N4K81O\SWAMINATHSQL/RetailSalesDB?driver=ODBC+Driver+17+for+SQL+Server&trusted_connection=yes"
)

print(df[['sales','profit','discount','shipping_cost']].dtypes)
df.to_sql(
    name='Retail_Sales',
    con=engine,
    if_exists='append',
    index=False
)

print("Data loaded successfully")