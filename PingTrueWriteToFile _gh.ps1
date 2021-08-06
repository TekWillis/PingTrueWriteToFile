<#
PURPOSE: 
    The purpose of this script is to ping each computer in a file located in C:\ldoc titled laptops.txt

OUTPUT:
    Pingable hosts will be written to C:\ldoc\pingable.txt
    Non-Pingable host will be written to C:\ldoc\NOping.txt

USAGE:
    

WARNING:
    The Contents of pingable.txt & NOping.txt will be cleared with each new run of this script. 


#>

$computers = Get-Content C:\ldoc\laptops.txt

 
# Clearing previous content of files:
# Pingable.txt = C:\ldoc\pingable.txt
# NOping.txt = C:\ldoc\NOping.txt


Clear-Content C:\ldoc\PingTrueWriteToFile_Pingable.txt
Write-Host "Cleared file contents of PingTrueWriteToFile_Pingable.txt " -ForegroundColor Yellow # C:\ldoc\PingTrueWriteToFile_Pingable
Clear-Content C:\ldoc\PingTrueWriteToFile_NOping.txt
Write-Host "Cleared file contents of PingTrueWriteToFile_NOping.txt " -ForegroundColor Yellow # C:\ldoc\PingTrueWriteToFile_NOping

# WRITE LOCATIONS
$if = "C:\ldoc\PingTrueWriteToFile_NOping.txt"
$else = "C:\ldoc\PingTrueWriteToFile_Pingable.txt"

foreach ($computer in $computers){
    if (!(Test-Connection -ComputerName $computer -BufferSize 16 -Count 1 -ea 0 -quiet))
    {
    Write-Host "Can not reach $computer" -ForegroundColor Red
    Add-Content $if $computer}

    else{
    Test-Connection -ComputerName $computer -Count 4
    Add-Content $else $computer 
    }
}

