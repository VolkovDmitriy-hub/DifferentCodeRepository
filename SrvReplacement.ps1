#Current version 0.0.4

Write-Host "Выберите действие"
Write-Host "1 - Копирование данных сервера"
Write-Host "2 - Востановление данных сервера влдатутаушц"

$Action = read-host

#Функция проверки доступности пути для копирования или востоновления

#Если выбрано компирование.
if ($Action -eq 1) {
    Write-Host "Введите сетевой путь коталога в который необходимо скопировать данные сервера"
    $Destination = Read-Host
    $IsPath = Test-Path $Destination
    if ($IsPath -eq "True") {
        Write-Host "все хоршо"
    }
    else {
        Write-Host "Все плохо"
    }
}

#Если выбрано востановление.
elseif ($Action -eq 2) {
    Write-Host "Введите сетевой путь коталога из которого необходимо востановить данные весвера"
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
    Write-Host "Вам было предложено всего два варианта, Вы выбрали третий. На этом Ваш дозор окончен"
}


