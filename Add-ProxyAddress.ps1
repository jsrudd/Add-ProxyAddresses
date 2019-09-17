Param(
    [string]$Username = $(throw "-Username is required."),
    [string]$EmailAddress = $(throw "-EmailAddress is required.")
)

Import-Module ActiveDirectory
$Matched=$False
$ADUser = Get-ADUser -Identity $Username -Properties SamAccountName, ProxyAddresses, Mail
"Found User $($ADUser.Name)"
$ProxyAddresses = $ADUser.ProxyAddresses
$Mail = $ADUser.Mail
$Mail
$NewAddress = $EmailAddress.ToLower().Trim()

Foreach ($Address in $ProxyAddresses) {
	$CheckAddress = $Address.Split(":")[1].ToLower()
    "Checking $CheckAddress for $NewAddress"
	If ($CheckAddress -eq $NewAddress) {
		$Matched = $True
		Break
	}
} 

If ($Matched) {
	"Alias already present. No action required."
	} Else {
	If ($ProxyAddresses.Count -eq 0) {
		"No aliases present, adding Primary Alias ($Mail)"
		Set-ADUser -Identity $Username -Add @{Proxyaddresses="SMTP:" + $Mail}
	}
	"Alias not found. Adding ($NewAddress)..."
	Set-ADUser -Identity $Username -Add @{Proxyaddresses="smtp:" + $NewAddress}
}
""
