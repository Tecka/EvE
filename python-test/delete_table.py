import requests
from azure.data.tables import TableServiceClient
from datetime import datetime

connection_string = "DefaultEndpointsProtocol=https;AccountName=staeve3v9kj02p;AccountKey=QhmWCrbXAs4HB/Xp4FLpN8ehb31/7wFDJ5KP/SvQ3U+gjQn2ZRK/w6rGL19XrhUo4YpCNP2XcF+B+ASt9LX1tA==;EndpointSuffix=core.windows.net"
service = TableServiceClient.from_connection_string(conn_str=connection_string)
# service = TableServiceClient(endpoint="https://staeverzi8o02p.table.core.windows.net/", credential=credential)



table_name = "regions"
table_1 = service.delete_table(table_name=table_name)
