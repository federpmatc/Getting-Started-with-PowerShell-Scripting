

$path = "C:\Temp\Documents"
$outputPath = "C:\Temp\Output"

# Iterate Files Function
Function Get-Files{	
    Param(		
        [Parameter(Mandatory=$true)]			
        [string]$FileType	
    )
    
    Get-ChildItem -Path "$path\*.$FileType" -Recurse -Force
}

# Create Class for Autocomplete Values
class Cities : System.Management.Automation.IValidateSetValuesGenerator{	
    [string[]] GetValidValues()	{		
        $Cities = @('1.4 Million','750 Thousand','2 Million','500 Thousand')		
        return $Cities	
    }
}

Function Test-PopulationOfHawaii{	

    [CmdLetBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet([Cities])]
        [string] $Answer
    )

    if($Answer -eq "1.4 Million")	{		
        Write-Host "Correct!!" -ForegroundColor Green	
    }	else	{		
        Write-Host "Incorrect!!" -ForegroundColor Green	
    }
}


Function Get-MathAnswer{
	param(		
        [int] $numberOne,		
        [int] $numberTwo,
        [ValidateSet("Add", "Subtract", "Multiply", "Divide")]		
        [string] $mathoperator	
    )
    
    [int]$answer = ""

    Write-Host "Math Operator = $mathoperator"

    if($mathoperator –eq "Add") {
        $answer = Invoke-AddNumbers $numberOne $numberTwo
    }elseif($mathoperator –eq "Substract") {
        $answer = Invoke-SubstractNumbers $numberOne $numberTwo
    }elseif($mathoperator –eq "Multiply") {
        $answer = Invoke-MultiplyNumbers $numberOne $numberTwo
    }elseif($mathoperator –eq "Divide") {}else{
        $answer = Invoke-DivideNumbers $numberOne $numberTwo
    }

    return $answer
}

Function Invoke-AddNumbers([int]$number1,[int]$number2) {
    return $number1 + $number2
}

Function Invoke-SubtractNumbers([int]$number1,[int]$number2) {
    return $number1 - $number2
}

Function Invoke-MultiplyNumbers([int]$number1,[int]$number2) {
    return $number1 * $number2
}

Function Invoke-DivideNumbers([int]$number1,[int]$number2) {
    return $number1 / $number2
}







