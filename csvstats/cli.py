import argparse
from .analyzer import analyze_column

def main():
    parser=argparse.ArgumentParser(description="Simple CLI for input")

    parser.add_argument("--file",type=str,required=True,help="Path to the CSV file")
    parser.add_argument("--column",type=str,required=True,help="Name of the column to analyze")

    args=parser.parse_args()

    
    try:
            # Call the core logic function
            results = analyze_column(args.file, args.column)

            # Print results in a user-friendly format
            print(f"Statistics for column '{args.column}':")
            print(f"  Mean   : {results['mean']}")
            print(f"  Median : {results['median']}")
            print(f"  Std Dev: {results['std_dev']}")

    except FileNotFoundError:
        print(f"Error: File '{args.file}' not found.")
    except KeyError:
        print(f"Error: Column '{args.column}' not found in the CSV file.")
    except ValueError as e:
        print(f"Error: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")



if __name__=='main':
    main()


