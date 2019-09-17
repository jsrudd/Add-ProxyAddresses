# Add-ProxyAddresses
Manages Proxy Addresses (email aliases) for Domain Synchronised Office365 users without an on-prem Exchange Management Console.

## Usage

### Using sAMAccountName
```
.\Add-ProxyAddress.ps1 -Username sAMAccountName -EmailAddress newaddress@email.org
```

### Using User Principal Name
```
.\Add-ProxyAddress.ps1 -Username User@principalname -EmailAddress newaddress@email.org
```
