#Current version 0.0.4

Write-Host "�������� ��������"
Write-Host "1 - ����������� ������ �������"
Write-Host "2 - ������������� ������ ������� �����������"

$Action = read-host

#������� �������� ����������� ���� ��� ����������� ��� �������������

#���� ������� ������������.
if ($Action -eq 1) {
    Write-Host "������� ������� ���� �������� � ������� ���������� ����������� ������ �������"
    $Destination = Read-Host
    $IsPath = Test-Path $Destination
    if ($IsPath -eq "True") {
        Write-Host "��� �����"
    }
    else {
        Write-Host "��� �����"
    }
}

#���� ������� �������������.
elseif ($Action -eq 2) {
    Write-Host "������� ������� ���� �������� �� �������� ���������� ����������� ������ �������"
    $Destination = Read-Host
    $IsPath = Test-Path $Destination
    if ($IsPath -eq "True") {
        Write-Host "��� �����"
    }
    else {
        Write-Host "��� �����"
    }
}

#���� ������ ������� ������� �� ������������.
else {
    Write-Host "��� ���� ���������� ����� ��� ��������, �� ������� ������. �� ���� ��� ����� �������"
}


