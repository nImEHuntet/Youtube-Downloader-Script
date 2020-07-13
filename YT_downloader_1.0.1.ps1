Write-Host "Youtube-Dl auto best content downloader and merger"
Write-Host "Script by Ayushmaan Karmokar"
Write-Host "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
Write-Host "Enter Youtube [URL] below eg. https://www.youtube.com/watch?v=rprhfOBVgf8"
Write-Host "Entering Nothing will run the default youtube-link"
$link = Read-Host

Write-Host "Hey! What kind of download do you want? ((BEST or CUSTOM or MUSIC))"
Write-Host "Please input (exact) keyword! ((BEST or CUSTOM or MUSIC))"
$setting = Read-Host

if ($setting -eq "BEST")
{
    Write-Host "FOR BEST"
    if($link -eq ""){
       ./youtube-dl.exe --ffmpeg-location 'ffmpeg.exe' -f bestvideo+bestaudio/best 'https://www.youtube.com/watch?v=rprhfOBVgf8'
    }else {
       ./youtube-dl.exe --ffmpeg-location 'ffmpeg.exe' -f bestvideo+bestaudio/best $link
    }
}
elseif ($setting -eq "CUSTOM")
{
    Write-Host "FOR CUSTOM"
    Write-Host "Fetching Available Download Options, see below."
    if($link -eq ""){
	    ./youtube-dl.exe --ffmpeg-location 'ffmpeg.exe' -F 'https://www.youtube.com/watch?v=rprhfOBVgf8'
    }else {
	    ./youtube-dl.exe -F $link
    }
    Write-Host "Enter (number) for video codec. eg 307"
    $vido = Read-Host
    Write-Host "Enter (number) for audio codec. eg 107"
    $audo = Read-Host

    Write-Host ""
    Write-Host "Data Recieved! Downloading Data and Making you your video!" 
    if($link -eq ""){
	    ./youtube-dl.exe --ffmpeg-location 'ffmpeg.exe' -f $vido"+"$audo 'https://www.youtube.com/watch?v=rprhfOBVgf8'
    }else {
	    ./youtube-dl.exe --ffmpeg-location 'ffmpeg.exe' -f $vido"+"$audo  $link
    }
    }

elseif($setting -eq "MUSIC")
{
    Write-Host "Fetching Available Download Options, see below."
    if($link -eq ""){
       ./youtube-dl.exe --ffmpeg-location 'ffmpeg.exe' -f bestaudio 'https://www.youtube.com/watch?v=rprhfOBVgf8'
    }else {
       ./youtube-dl.exe --ffmpeg-location 'ffmpeg.exe' -f bestaudio $link
    }
}

else 
{
    Write "NONSENSE-COMMANDS, ENDING PROGRAM"
}

Read-host "Enter to Exit”
