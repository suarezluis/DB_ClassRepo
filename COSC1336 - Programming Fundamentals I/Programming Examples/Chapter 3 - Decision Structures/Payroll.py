hoursWorked = float(input("Please enter your hours worked: "))
payRate = float(input('Please enter your pay rate: '))

if hoursWorked > 40:
   overtimePay = (hoursWorked - 40) * payRate * 1.5
   grossPay    = (40 * payRate) + overtimePay
else:
   grossPay   = hoursWorked * payRate
    
print("Gross pay = $", format(grossPay, ',.2f'), sep = '')

