$files = Get-ChildItem -Exclude 'renamer.ps1'| Sort-Object CreationTime |Select-Object name
$timestamp = Get-Date -UFormat "%m-%d-%Y"
$count = 1
$customer_name = Read-Host "Enter a customer name for this job(no spaces, leave black and press enter for none)"

foreach($file in $files){
    if($customer_name -eq ""){
        Rename-Item -Path $file.Name -NewName "$count _$timestamp.txt"
        $count = $count + 1
    } else{
        Rename-Item -Path $file.Name -NewName "$count _$customer_name _$timestamp.txt"
        $count = $count + 1
    }

    
}
$count = 0
Read-Host
