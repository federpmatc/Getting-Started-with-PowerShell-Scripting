# Create a basic variable
$variable1 = 1, 2, 3
$variable2 = "C:\Documents\"

# Create a typed variable
[Int]$variable1 = 10
[DateTime]$variable2 = "January 1, 2021" 

# Variables
$variable1 = "1"
$variable2 = 9

# Converting Variables
$variable1.GetType().Name
$variable1
$variable1 + $variable2
[Int]$variable1 + $variable2 

# Casting Variables and Values
$variable1 = "1"
$variable2 = "01/01/2021"

# Converting String Variable to Integer
[Int]$variable1

# Converting String Variable to Date
[DateTime]$variable2

# Converting False Value to Integer
[int]$false

## Casting Using the –AS Operator
$variable1 = "1"
$variable2 = "01/01/2021"

# Cast String Variable to Integer
$variable1 –as [Int]

# Cast String Variable to Date
$variable2 –as [DateTime]

# Cast False Value to Integer
$false –as [Int]

## Using the -Replace Operator
$variable1 = "The class instructor asked for a volunteer for a demonstration"
$variable2 = "Jones Tom" 

# Read Variable and Replace Value
$variable -replace "instructor","teacher"

# Read Variable, Replace Value and Load into New Variable
$replacevariable = $variable -replace "instructor","teacher"

# Using Replace and RegEx to Swap Names
$variable2 = $variable2 -replace "([a-z]+)\s([a-z]+)",'$2, $1'

# Using Replace and RegEx to Remove Spaces
$variable1 -replace '[^a-z]'

## Using the -SPLIT Operator
# Split String Value using Default Delimiter
-split "January February March April May June"

# Split String Value using Comma Delimiter
"January,February,March,April,May,June" -split ","

# Split String Value into three using Comma Delimiter
"January,February,March,April,May,June" -split ",",3

# Split Variable Value using Comma Delimiter
$variable = "January,February,March,April,May,June"
$variable -split ","

# Split Variable Value using Comma Delimiter
$variable = "January,February,March,April,May,June"
$variable.Split(',')

# Nested Split Variable Value using Comma Delimiter
$variable = "January,February,March,April;May;June"
$variable.Split(','). Split(';')

## String Padding
# Padding the Left of a Value
$variable = "Demonstration"
$variable.PadLeft(14,'A')

# Padding the Right of a Value
$variable = "Demonstration"
$variable.PadRight(14,'B')

## Creating Arrays
# Create Empty Array
$variable = @()

# Create Array with Text Values
$variable = @('January','February','March','April','May','June')

# Create Array with Text Values not using "@()"
$variable = 'January','February','March','April','May','June'

# Create Array with Text Values not using "@()"
$variable = Write-Output January February March April May June

# Access Array Item using Offset
$variable[0]

# Access Array Items using Multiple Offsets
$variable[0,1,4]

# Access Array Items using Range Operator as Offset
$variable[2..5]

# Create Array with Text Values
$variable = @('January','February','March','April','May','June')

# Access Array Items using Pipeline with ForEach-Object Loop
$variable | ForEach-Object {"The month is: $PSItem"}

# Access Array Items using a ForEach Loop
foreach ($item in $variable) {"The month is: $item"}

# Access Array Items using the ForEach Method
$variable.ForEach({"The month is: $PSItem"})

# Access Array Items using For Loop
for ($item = 0; $item -lt $variable.count; $item++) {	
    "The month is: {0}" -f $variable[$item];	
    Write-Host "Current Position: $item"
}

# Create an Empty Hashtable
$variable = @{}

# Create a Hashtable with Keys and Values
$variable = @{ Month = 5; Name = "May"; Season = "Spring" }

# Create an Ordered Hashtable with Keys and Values
$variable = [ordered]@{ Month = 5; Name = "May"; Season = "Spring" }

# Create a Country Population Hashtable
$variable = @{ 	
    Chine = 1439323776;	
    India = 1380004385;	
    America = 331002651;	
    Spain = 46754778
}

# Iterate all Keys and Values using ForEach-Object Loop
$variable.keys | ForEach-Object{ 	
    $output = '{0} has a population of {1}' -f $_, $variable[$_];	
    Write-Output $output 
}

# Iterate all Keys and Values using For Loop
foreach($key in $variable.keys) {	
    $output = '{0} has a population of {1}' -f $key, $variable[$key];	
    Write-Output $output 
}

# Create an Empty PSCustomObject
$variable = [PSCustomObject]@{ }

# Create an Empty PSCustomObject
$variable = New-Object -TypeName PSObject

# Create and Populate a PSCustomObject
$variable = [PSCustomObject]@{	
    'China' = '1439323776';	
    'India' = '1380004385';	
    'America' = '331002651';	
    'Spain' = '46754778';
}

# Add Items to PSCustomObject
$variable | Add-Member -MemberType NoteProperty -Name 'Russia' -Value '145934462'
$variable | Add-Member -MemberType NoteProperty -Name 'Norway' -Value '5421241'

# Create and Populate a PSCustomObject
$variable = [PSCustomObject]@{	
    'China' = '1439323776';	
    'India' = '1380004385';	
    'America' = '331002651';	
    'Spain' = '46754778';
}

# Return all PSCustomObject Key/Value Pairs
$variable

# Return Spain PSCustomObject
$variable.Spain

# Testing PSCustomObject Type using -IS and -ISNOT Operator
$variable1 = 2021
$variable2 = "2021"
$variable1 -is [Int]
$variable1 -is $variable2.GetType()
$variable1 -isnot [Int]
$variable1 -isnot $variable2.GetType()


$xml.Countries.Country | Where-Object Validated -eq 'True' | `
ForEach-Object {		[
    PSCustomObject]@{ 			
        Name = $_.Name			
        Population = $_.Population			
        Checked = $_.Validated		
    }
}

## Import, Export and Test JSON
# Variables
$path = "C:\Documents\Data\Countries.json"

# Import JSON File
$json = Get-Content -Path $path | ConvertFrom-JSON

# Export JSON File
$json | ConvertTo-JSON | Out-File $path

# Test JSON File
Get-Content -Path $path -Raw | Test-JSON

## Iterating and Retrieving JSON Data
# Variables
$path = "C:\Documents\Data\Countries.json"

# Load JSON File
$json = (Get-Content -Path $path) | ConvertFrom-JSON
$json.Countries

# Loop JSON Data
Foreach ($item in $json){	
    $item.Countries.Country | Select-Object Name, Population
}

# Loop JSON Data using Expand
Foreach ($item in $json){	
    $item.Countries | Select-Object –ExpandProperty Country | `
    Select-Object Name, Population
}

# Retreiving JSON from Restful API
# Variables
$uri = "https://swapi.dev/api/people/"

# Load JSON File
$json = Invoke-RestMethod –Uri $uri 

# Loop JSON Data
Foreach ($item in $json.results){	
    $item | Select-Object Name,Height, Gender
}




























