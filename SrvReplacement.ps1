#Current version 0.0.4

Write-Host "Выберите действие"
Write-Host "1 - Копирование данных сервера"
Write-Host "2 - Востановление данных сервера"
$Action = read-host

#Глобальные переменные
$Service1cName = AmmyyAdmin
$SqlServer = "apteka"
$SqlLogin = "sa"
$SqlBakPath = D:\backup
$CurrentDate = Get-Date -Format _dd_MM_yyyy
$SqlBackupName = $SqlBase+$CurrentDate

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

#Если выбрано компирование.
if ($Action -eq 1) {
    Write-Host "Введите сетевой путь коталога в который необходимо скопировать данные сервера"
    $Destination = Read-Host
    $IsPath = Test-Path $Destination
    if ($IsPath -eq "True") {
        New-Item -Path $Destination\SrvReplacement -ItemType Directory
        Stop-Service $Service1cName
        Write-Host "Введите имя бызы данных SQL"
        $SqlBase = Read-Host
        Write-Host "Введите пароль SQL сервера"
        $SqlPassw = Read-Host
        SqlBackup
    }
    else {
        Write-Host "Указанный путь не найден или недостаточно прав для записи."
    }
}

#Если выбрано востановление.
elseif ($Action -eq 2) {
    Write-Host "Введите сетевой путь коталога из которого необходимо востановить данные сервера"
    $Destination = Read-Host
    $IsPath = Test-Path $Destination
    if ($IsPath -eq "True") {
        Write-Host "все хоршо"
    }
    else {
        Write-Host "Все плохо"
    }
}

#Если выбран вариант отлиный от предложанных.
else {
    Write-Host "Предложено варианта два было вам, выбрали третий Вы. Дозор на этом закончен Ваш."
}


