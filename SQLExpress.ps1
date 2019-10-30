$SQLSYSADMINACCOUNT=$env:COMPUTERNAME+"\Administrators"
$installArgs='''/SECURITYMODE=Sql /SAPWD="P@ssw0rd" /INSTANCENAME="SQLExpress" /SQLSYSADMINACCOUNTS="' + $SQLSYSADMINACCOUNT +'"'''

#Test
choco install sqlserver2008r2express-engine -installargs $installArgs -y -force
choco install sqlserver2008r2express-managementstudio -y -force

