from tabulate import tabulate

def generate_weather_report(data):
    try:
        header=data[0].keys()
        table_data=[]
        for dict in data:
            row=[]
            for key in header:
                row.append(dict[key])
            #print(row)
            table_data.append(row)
        #print(table_data)
        print(tabulate(table_data, headers=header))
    except IndexError:
        return None
    


if __name__ == "__main__":
    weather_data = [
        {'city': 'New York', 'temperature': 15, 'condition': 'Cloudy'},
        {'city': 'Los Angeles', 'temperature': 28, 'condition': 'Sunny'},
        {'city': 'Chicago', 'temperature': 12, 'condition': 'Windy'},
        {'city': 'Houston', 'temperature': 31, 'condition': 'Humid'}
    ]

    weather_data1=[]
    generate_weather_report(weather_data)
    print("\nfor empty list:")
    generate_weather_report(weather_data1)