# Run this after the machine reboot and check the output for errors
# tsmith91

# Check the that the DNS server IP address on the NIC is set to our non-loopback IP and set it if needed 
$nicname = Get-NetAdapter  | select -ExpandProperty "name" 
$ipaddress = Get-NetIPAddress -InterfaceAlias $nicname -AddressFamily IPv4 | select -ExpandProperty "IPAddress" 
if ((Get-DnsClientServerAddress -InterfaceAlias $nicname -AddressFamily IPv4 | select -ExpandProperty "ServerAddresses") -ne $ipaddress)  
{ 
Set-DnsClientServerAddress -InterfaceAlias $nicname -ServerAddresses ($ipaddress) -Validate 
}    

dcdiag
Get-Service adws,kdc,netlogon,dns
Get-smbshare
