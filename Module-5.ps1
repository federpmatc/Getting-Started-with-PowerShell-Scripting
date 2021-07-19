## Generating and Handling Errors

# Generate an Error using "Throw"
Function New-Error{	
    Throw "This is an Error"
  
}

New-Error
Write-Host "hello"


# Use Write-Error with "-ErrorAction" to Generate Error
#The error action can stop, continue, etc.
Write-Error -Message "This in an Error" -ErrorAction Stop


# Generate an Error using "Throw"
#Write-error has diffrent error actions that effect the flow of program
Function New-Error{	
    $number = 0;	
    for ($i = 1; $i -le 10; $i++) { 		
        Write-Host "The current number is: $i"		
        Write-Error "This in an Error" -ErrorAction Stop	
        $number += $i	
    }
}

# Generate an Error using "Throw"
Function New-Error{	
    Throw "This is an Error"
}

# Use Try/Catch to Capture the Error and raise an Exception
try {	 
    New-Error
} catch {	
    Write-Output "An Exception was Generated"
}

# Use Try/Finally to Continue Code Execution
try {	 
    New-Error
} finally {	
    Write-Output "Continue Execution"
}
Write "Hello"

# Use Try/Catch to Capture the Error and raise an Exception
#the catch allows us to address the error & continue operation
try {	 
    New-Error
    #Write-Host Hello
} catch {	
    Write-Output "An Exception was Generated"
} finally {	
    Write-Output "Continue Execution"
}
Write hello

## Handling Typed Exceptions
$path = "C:\Documents\Code"
try { 	
    New-Error -Path $path -ErrorAction Stop 
} catch [System.IO.DirectoryNotFoundException],[System.IO.FileNotFoundException]{ 
    Write-Output "The Path or File was not found: [$path]" 
} catch [System.IO.IOException]{ 	
    Write-Output "Error within the selected File: [$path]"
}







