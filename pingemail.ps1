$EmailFrom = "kumar.prapul@gmail.com"
$SMTPServer = "smtp.gmail.com"
$SMTPServer1 = "smtp-mail.outlook.com"
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("kumar.prapul@gmail.com" ,"Prapul@guitar246");
$hash = Get-Content -raw C:\Users\PK078323\Desktop\hosts.txt | ConvertFrom-StringData #to convert values form text to hash table format
$hash

foreach($key in $hash.keys)
{   
    $p = Test-Connection -ComputerName $key -Count 1 -ea silentlycontinue #ea=error action
if($p) 
    {  
     write-host "Available host ---> "$key -BackgroundColor Green -ForegroundColor White 
     $EmailTo = $hash[$key]
     $Body = "Available host ---> $key"
     $SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
    } 
else 
    { 
     write-host "Unavailable host ------------> "$key -BackgroundColor Magenta -ForegroundColor White 
    } 
}
