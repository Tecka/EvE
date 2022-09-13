import requests
from azure.data.tables import TableServiceClient
from datetime import datetime

connection_string = "DefaultEndpointsProtocol=https;AccountName=staeve3v9kj02p;AccountKey=QhmWCrbXAs4HB/Xp4FLpN8ehb31/7wFDJ5KP/SvQ3U+gjQn2ZRK/w6rGL19XrhUo4YpCNP2XcF+B+ASt9LX1tA==;EndpointSuffix=core.windows.net"
service = TableServiceClient.from_connection_string(conn_str=connection_string)
# service = TableServiceClient(endpoint="https://staeverzi8o02p.table.core.windows.net/", credential=credential)
table_name = "tableX"


def delete_table(table):
    table_1 = service.delete_table(table_name=table)
    return "Table " + table + " deleted."


def create_table(table):
    table_1 = service.create_table(table_name=table)
    return "Table " + table + " created."


def load_regions():
    data = requests.get('https://esi.evetech.net/latest/universe/regions/').text



    regions = str(data[1:-1]).split(",")

    for idx, region in enumerate(regions):
        print(region)

        my_entity = {
            u'PartitionKey': str(idx),
            u'RowKey': region
        }
        entity = table_1.create_entity(entity=my_entity)




    #if table already exists and did not have to be previously created with create_table
    #table_1 = service.get_table_client(table_name=table_name)

    # entity as a dictionnary