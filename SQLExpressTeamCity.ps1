$SQLSYSADMINACCOUNT=$env:COMPUTERNAME+"\Administrators"
$installArgs='''/SECURITYMODE=Sql /SAPWD="P@ssw0rd" /INSTANCENAME="SQLTeamCity" /SQLSYSADMINACCOUNTS="' + $SQLSYSADMINACCOUNT +'"'''


choco install sqlserver2014express -installargs $installArgs -y -force
choco upgrade mssqlservermanagementstudio2014express -y -force

