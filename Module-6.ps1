## Create Reusable PowerShell Scripts

# Commenting Code
# Single Line Commenting
# This function returns a simple string

#Author didn't discuss regions
#region
function Invoke-Message() { Write-Host "Some Text" }
#endregion  this is my first region


# Block Comments / Multiline Comments
<#	
This function returns a simple string
The string will be displayed in red
#>
function Invoke-Message() { Write-Host "Some Text" -ForegroundColor Red }

# Commenting-out Existing Code
#function Invoke-Message() { Write-Host "Some Text" -ForegroundColor Red }


## Creating Self-signed Digital Certificate
# Set the PowerShell Script Path
$script = "C:\Users\Administrator\Documents\Hello.ps1"
Get-Content $script

# Create Self-signed Code Signing Certificate
New-SelfSignedCertificate -DNSName "script.company.com" -CertStoreLocation Cert:\CurrentUser\My -Type CodeSigningCert -Subject "PowerShell Code Signing Certificate"

# Retrieve the Code Signing Certificate
$certificate = (Get-ChildItem Cert:\CurrentUser\My -CodeSigningCert)[0]
$certificate 

# Set the Code Signing Certificate for the PowerShell Script
Set-AuthenticodeSignature $script -Certificate $certificate

# Validate the Code Signing Certificate
Get-AuthenticodeSignature $script | Format-Table -AutoSize
$script

#Use MMC to copy and paste certificate into cert. store

# Create a Basic Function
Function Get-Answer(){	
    $question = Read-Host "What is the Capital City in Australia?"

    if($question -eq "Canberra")
    {
        Write-Host "Correct!! You entered $question" -ForegroundColor Green
    }
    else
    {
        Write-Host "Incorrect!! You entered $question which incorrect, please try again" -ForegroundColor Green        
    }
}

Get-Answer

# Create a Function using Arguments
Function Get-Answer(){	
    $question = Read-Host "Hi $($args[0]), What is the Capital City in Australia?"	
    if($question -eq "Canberra")	{		
        Write-Host "Correct!! You entered $question" -ForegroundColor Green	
    }	else	{		
        Write-Host "Incorrect!! You entered $question" -ForegroundColor Green	
    }
}

Get-Answer "Pat"

# Create a Function using Variables
Function Get-Answer($name){	
    $question = Read-Host "Hi $name, What is the Capital City in Australia?"	
    if($question -eq "Canberra")	{		
        Write-Host "Correct!! You entered $question" -ForegroundColor Green	
    }	else	{		
        Write-Host "Incorrect!! You entered $question" -ForegroundColor Green	
    }
}

Get-Answer "Pat"

# Create a Function with Parameters
# So city needs to be one of 4 values, otherwise we get an error.
Function Test-WhatIsCapitalCityofAustralia(){	
    Param(		
        [Parameter(Mandatory=$true)]		
        [ValidateSet("Canberra","Melbourne","Brisbane","Perth")]		
        [string]$city	
    )	
    
    if($city -eq "Canberra")	{		
        Write-Host "Correct!! You entered $city" -ForegroundColor Green	
    }	else	{		
        Write-Host "Incorrect!! You entered $city" -ForegroundColor Green	
    }
}

Test-WhatIsCapitalCityofAustralia Perth

Function Get-Answer($name){	
    $question = Read-Host "Hi $name, What is the Capital City in Australia?"
    if($question -eq "Canberra")	{		
        Write-Host "Correct!! You entered $question" -ForegroundColor Green	
    }	else	{		
        Write-Host "Incorrect!! You entered $question" -ForegroundColor Green	
    }
}

Get-Answer
