
def calculate_simple_interest(principal,rate,time):
    
    """
    Calculates simple interest based on the given principal, rate, and time.

    Parameters:
        principal (float or str): The principal amount.
        rate (float or str): The annual interest rate (in decimal, e.g., 0.05 for 5%).
        time (int or str): The time period in years.

    Returns:
        float: The calculated simple interest.
        None: If any input is invalid and cannot be converted to the required type.
    """

    try:
        p=float(principal)
        r=float(rate)
        t=int(time)
        return (p*r*t)
    except ValueError:
        return None
    
    
def calculate_coumpound_interest(principal,rate,time,n=1):
    
    """
    Calculates compound interest based on the given principal, rate, time, and compounding frequency.

    Parameters:
        principal (float or str): The principal amount.
        rate (float or str): The annual interest rate (in decimal, e.g., 0.05 for 5%).
        time (int or str): The time period in years.
        n (int, optional): Number of times interest is compounded per year. Default is 1.

    Returns:
        str: The total amount after interest, formatted to two decimal places.
        None: If any input is invalid and cannot be converted to the required type.
    """

    try:
        p=float(principal)
        r=float(rate)
        t=int(time)
        A = p*(1+r/n)**(n*t)
        return f"{A:.2f}"
    except ValueError:
        return None