# Run this after the machine reboot and check the output for errors
# tsmith91
dcdiag
Get-Service adws,kdc,netlogon,dns
Get-smbshare
