#Current version 0.0.5

Write-Host "�������� ��������"
Write-Host "1 - ����������� ������ �������"
Write-Host "2 - ������������� ������ �������"
$Action = read-host

#���������� ����������
$Service1cName = "1C:Server"
$SqlServer = "apteka"
$SqlLogin = "sa"
$CurrentDate = Get-Date -Format _dd_MM_yyyy

#�������
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
#���� ������� �����������.
if ($Action -eq 1) {
    Write-Host "������� ���� �� �������� � ������� ���������� ����������� ������ � �������."
    $Destination = Read-Host
    $IsPath = Test-Path $Destination
    if ($IsPath -eq "True") {
        New-Item -Path $Destination\SrvReplacement -ItemType Directory
        $SqlBakPath = "$Destination\SrvReplacement\"
        Stop-Service $Service1cName
        Write-Host "������� ��� ���� SQL"
        $SqlBase = Read-Host
        Write-Host "������� ������ SQL �������"
        $SqlPassw = Read-Host
        $SqlBackupName = $SqlBase+$CurrentDate
        SqlBackup
        Copy-Item D:\mail $Destination\SrvReplacement\mail -Recurse -Container
        Copy-Item C:\Users\������������\AppData\Roaming\Psi+\profiles\default\history $Destination\SrvReplacement\history -Recurse -Container
    }
    else {
        Write-Host "�� ������ �������� �������, ���� ��� �������."
    }
}

#���� ������� �������������.
elseif ($Action -eq 2) {
    Write-Host "������� ���� �� �������� � �������� ���������� ����������� ������ �������."
    $Destination = Read-Host
    $IsPath = Test-Path $Destination
    if ($IsPath -eq "True") {
        Write-Host "��� ������"
    }
    else {
        Write-Host "��� �����"
    }
}

#���� ������ ������ �������.
else {
    Write-Host "��� ���� ���������� 2 ��������, �� ������� ������. �� ���� ��� ����� �������."
}


