New-Item -ItemType Directory -Force -Path C:\dbbackups

$downloads = @{
    "https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak" = "c:\dbbackups\WideWorldImporters-Full.bak"
    "https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImportersDW-Full.bak" = "c:\dbbackups\WideWorldImportersDW-Full.bak"
}
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

ForEach($key in $downloads.Keys) {
    (New-Object System.Net.WebClient).DownloadFile($key, $downloads[$key])
}

(sqlcmd -S . -Q "RESTORE DATABASE [WideWorldImporters] FROM  DISK = N'C:\dbbackups\WideWorldImporters-Full.bak' WITH  FILE = 1,  NOUNLOAD,  REPLACE,  STATS = 5")
(sqlcmd -S . -Q "RESTORE DATABASE [WideWorldImportersDW] FROM  DISK = N'C:\dbbackups\WideWorldImportersDW-Full.bak' WITH  FILE = 1, NOUNLOAD,  REPLACE,  STATS = 5")