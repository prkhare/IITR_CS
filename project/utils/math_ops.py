def get_average(numbers):
    """Returns the average of a list of numbers. Returns 0 if list is empty."""
    if len(numbers)==0:
        return 0
    else:
        sum=0
        for num in numbers:
            sum+=num
        return(sum/len(numbers))
    
