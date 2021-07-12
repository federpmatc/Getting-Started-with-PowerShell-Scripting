## Generating and Handling Errors

# Generate an Error using "Throw"
Function New-Error{	
    Throw "This is an Error"
}

# Use Write-Error with "-ErrorAction" to Generate Error
Write-Error -Message "This in an Error" -ErrorAction Stop

# Generate an Error using "Throw"
Function New-Error{	
    $number = 0;	
    for ($i = 1; $i -le 10; $i++) { 		
        Write-Host "The current number is: $i"		
        Throw "This in an Error";		
        $number += $i	
    }
}

# Generate Error using "-ErrorAction"
New-Error -ErrorAction Stop

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

# Use Try/Finally to Capture the Error and Continue Code Execution
try {	 
    New-Message
} finally {	
    Write-Output "Continue Execution"
}

# Use Try/Catch to Capture the Error and raise an Exception
try {	 
    New-Message
} catch {	
    Write-Output "An Exception was Generated"
} finally {	
    Write-Output "Continue Execution"
}

## Handling Typed Exceptions
$path = "C:\Documents\Code"
try { 	
    New-Error -Path $path -ErrorAction Stop 
} catch [System.IO.DirectoryNotFoundException],[System.IO.FileNotFoundException]{ 
    Write-Output "The Path or File was not found: [$path]" 
} catch [System.IO.IOException]{ 	
    Write-Output "Error within the selected File: [$path]"
}







