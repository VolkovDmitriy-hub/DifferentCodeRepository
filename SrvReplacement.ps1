#Current version 0.0.5

Write-Host "Выбирите действие"
Write-Host "1 - Копирование данных сервера"
Write-Host "2 - Востановление данных сервера"
$Action = read-host

#Глобальные переменные
$Service1cName = "1C:Server"
$SqlServer = "apteka"
$SqlLogin = "sa"
$CurrentDate = Get-Date -Format _dd_MM_yyyy

#Функции
function SqlBackup {
    $SqlConnection = New-Object System.Data.SqlClient.SqlConnection
        $SqlConnection.ConnectionString = "Server=$SqlServer; Database=$SqlBase; User ID=$SqlLogin; Password=$SqlPassw;"
        $SqlConnection.Open()
        $SqlCmd = $SqlConnection.CreateCommand()
        $SqlCmd.CommandText = "BACKUP DATABASE $SqlBase to disk = '$SqlBakPath$SqlBackupName.bac'"
        $objReader = $SqlCmd.ExecuteReader()
        while ($objReader.read()) {
  Write-Output $objReader.GetValue(0)
        }
        $objReader.close()

}
#Если выбрано копирование.
if ($Action -eq 1) {
    Write-Host "Введите путь до каталога в который необходимо скопировать данные с сервера."
    $Destination = Read-Host
    $IsPath = Test-Path $Destination
    if ($IsPath -eq "True") {
        New-Item -Path $Destination\SrvReplacement -ItemType Directory
        $SqlBakPath = "$Destination\SrvReplacement\"
        Stop-Service $Service1cName
        Write-Host "Введите имя базы SQL"
        $SqlBase = Read-Host
        Write-Host "Введите пароль SQL сервера"
        $SqlPassw = Read-Host
        $SqlBackupName = $SqlBase+$CurrentDate
        SqlBackup
        Copy-Item D:\mail $Destination\SrvReplacement\mail -Recurse -Container
        Copy-Item C:\Users\Пользователь\AppData\Roaming\Psi+\profiles\default\history $Destination\SrvReplacement\history -Recurse -Container
    }
    else {
        Write-Host "Не найден указаный каталог, либо нет доступа."
    }
}

#Если выбрано востановление.
elseif ($Action -eq 2) {
    Write-Host "Введите путь до каталога с которого необходимо востановить данные сервера."
    $Destination = Read-Host
    $IsPath = Test-Path $Destination
    if ($IsPath -eq "True") {
        Write-Host "Все хорошо"
    }
    else {
        Write-Host "Все плохо"
    }
}

#Если выбран другой вариант.
else {
    Write-Host "Вам было предложено 2 варианта, Вы выбрали третий. На этом Ваш дозор окончен."
}


