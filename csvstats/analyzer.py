
import pandas as pd
def analyze_column(file_path, column_name):
    try:
        dict={}
        df=pd.read_csv(file_path)
        if column_name in df.columns:
            mean=df[column_name].mean()
            median=df[column_name].median()
            sd=df[column_name].std()
            dict['mean']=mean
            dict['median']=median
            dict['std_dev']=sd
            return dict
        else:
            return f"column: {column_name} does not exist in the file"

    except FileNotFoundError:
        return "File does not exist"
    
    except Exception as e:
        return f"Unexpected error: {e}"