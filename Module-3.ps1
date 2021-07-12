## IF Syntax
$variable = "value"

if($variable) {
    Write-Output "The $variable check returned true"
}


## IF / ELSE Syntax
$variable = "value"

if($variable){	
    Write-Output "The $variable check returned true"
}
else{	
    Write-Output "The $variable check returned false"
}

## IF / ELSEIF / ELSE Syntax
$variableone = "value"
$variabletwo = "value"

if($variableone){	
    Write-Output "The $variableone check returned true"
}
elseif($variabletwo){	
    Write-Output "The $variabletwo check returned true"}
    
else{	
    Write-Output "The $variableone and $variabletwo check returned false"
}

## IF Comparision
$variable = "value"
$comparevariable = "value"

# Equal Comparison Operator using "-eq"
if($variable –eq $comparevariable) {
    Write-Host "$variable –eq $comparevariable"
}

# Greater Than Comparison Operator using "-gt"
if($variable –gt $comparevariable) {
    Write-Host "$variable -gt $comparevariable"
}

# Like Comparison Operator using "-like"
if($variable –like $comparevariable) {
    Write-Host "$variable –like $comparevariable"
}

# Match Comparison Operator using "-match"
if($variable –match $comparevariable) {
    Write-Host "$variable –match $comparevariable"
}

## IF Collection
$array = 1..10 
$comparevariable = 6

# If current array value is greater than compare value
if($array –gt $comparevariable) {
    Write-Host "Current collection value greater than the value"
}

# If array contains the compare value
if($array –contains $comparevariable) {
    Write-Host "Value found within Collection"
}

# If compare value is within the array
if($comparevariable –in $array) {
    Write-Host "Value found within Collection"
}

## IF Logical
$variable = "value"
$comparevariableOne = "value"
$comparevariableTwo = "value"

# Multiple Equal Comparison Operator using "-eq" and "-and"
if(($variable –eq $comparevariableOne) –and ($variable –eq $comparevariableTwo)) {
    Write-Host "Both Values Match"
}

# Multiple Equal Comparison Operator using "-eq" and "-or"
if(($variable –eq $comparevariableOne) –or ($variable –eq $comparevariableTwo)) {
    Write-Host "One of the Values Match"
}

## IF Arithmetic
$variable = "value"
$comparevariableOne = "value"
$comparevariableTwo = "value"

# Add variables and check if result is greater than variable
if(($comparevariableOne + $comparevariableTwo) –gt $variable) {
    Write-Host "Result of Addition is greater than Variable"
}

# Divide variables and check if result is less than variable
if(($comparevariableOne / $comparevariableTwo) –lt $variable) {
    Write-Host "Result of Division is greater than Variable"
}

# Multiply variables and check if result is equal to the variable
if(($comparevariableOne * $comparevariableTwo) –eq $variable) {
    Write-Host "Result of Multiplication is greater than Variable"
}

## IF Ternary
$variableOne = "1"
$variableTwo = "3"
$textVariable = $true

# Compare both variable values using "-eq" then return true / false or message
($variableOne –eq $variableTwo) ? $true : $false
($variableOne –eq $variableTwo) ? ("$variableOne is greater than $variableTwo ") : ("$variableOne is less than $variableTwo ")

# Compare text variable values using "-eq" then return true or false
($textVariable) ? "Value is true" : "Value is false"

## DO-WHILE Example
$number = 1

Do { 
    $number; 
    $number++ 
} While ($number -le 10)

## DO-UNTIL Example
$number = 1

Do {
    $number; 
    $number++ 
} Until ($number -gt 10)


## Switch Statement
$number = 3

Switch ($number) {	
    5	{ Write-Host "Number equals 5" }	
    10	{ Write-Host "Number equals 10" }	
    20	{ Write-Host "Number equals 20" }	
    Default	{ Write-Host "Number is not equal to 5, 10, or 20"}
}

## Multiple Expression Switch Statement
$number1 = 5
$number2 = 11

Switch ($number1, $number2) {	
    5	{ Write-Host "Number equals 5" }	
    10	{ Write-Host "Number equals 10" }	
    20	{ Write-Host "Number equals 20" }	
    Default	{ Write-Host "Number is not equal to 5, 10, or 20"}
}

## FOREACH Loop
$collection = 1,2,3,4,5,6,7,8,9,10 

ForEach ($item in $collection) { 	
    Write-Host "Current Number: $item"
} 

# FORACH Loop with Range Operator
$collection = 1..10 

ForEach ($item in $collection) { 	
    Write-Host "Current Number: $item"
} 

# FOREACH Loop with Test Values
$collection = 'A','B','C','D','E','F','G','H'

ForEach ($item in $collection) { 	
    Write-Host "Current Letter: $item"
} 


# FOREACH Loop FIies in Folder
$path = "C:\Documents"

ForEach ($file in Get-ChildItem $path) { 	
    Write-Host "Current Filename: $file"
}








