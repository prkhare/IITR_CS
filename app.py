import finance_utils as f

Principal= 100  
Rate= 0.05   
Time= 2   
n=4

si=f.calculate_simple_interest(Principal,Rate,Time)
ci=f.calculate_coumpound_interest(Principal,Rate,Time,n)


print(f"Simple Interest Earned: {si}\nAmount with Compound Interest: {ci}")
