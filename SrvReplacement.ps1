#Current version 0.0.1

Write-Host "�������� ��������"
Write-Host "1 - ����������� ������ �������"
Write-Host "2 - ������������� ������ �������"

$Action = read-host

#���������� ����������
$DesPath = "\\w-it3\backup\"

#������� �������� ����������� ���� ��� ����������� ��� �������������
function IsPath {
    $IsPath = Test-Path $DesPath$KassNum
    if ($IsPath -eq "True") 
    { Write-Host "���� ������" }
    else {
        Write-Host "���� �� ������"
    }
}

#���� ������� ������������.
if ($Action -eq 1) {
    Write-Host "������� ����� ����� �� ������� ����� ����������� ������"
    $KassNum = Read-Host
    IsPath
    
}

#���� ������� �������������.
elseif ($Action -eq 2) {
    Write-Host "������� ����� ����� � ������� ����� ����������� ������ "
    $KassNum = Read-Host
    IsPath
}

#���� ������ ������� ������� �� ������������.
else {
    Write-Host "��� ���� ���������� ����� ��� ��������, �� ������� ������. �� ���� ��� ����� �������"
}


