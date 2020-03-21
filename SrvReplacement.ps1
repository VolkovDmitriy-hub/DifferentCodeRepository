#Current version 0.0.1

Write-Host "Выберите действие"
Write-Host "1 - Копирование данных сервера"
Write-Host "2 - Востановление данных сервера"

$Action = read-host

#Глобальные переменные
$DesPath = "\\w-it3\backup\"

#Функция проверки доступности пути для копирования или востоновления
function IsPath {
    $IsPath = Test-Path $DesPath$KassNum
    if ($IsPath -eq "True") 
    { Write-Host "Путь найден" }
    else {
        Write-Host "Путь не найден"
    }
}

#Если выбрано компирование.
if ($Action -eq 1) {
    Write-Host "Введите номер кассы на которую нужно скопировать данные"
    $KassNum = Read-Host
    IsPath
    
}

#Если выбрано востановление.
elseif ($Action -eq 2) {
    Write-Host "Введите номер кассы с которой нужно востановить данные "
    $KassNum = Read-Host
    IsPath
}

#Если выбран вариант отлиный от предложанных.
else {
    Write-Host "Вам было предложено всего два варианта, Вы выбрали третий. На этом Ваш дозор окончен"
}


