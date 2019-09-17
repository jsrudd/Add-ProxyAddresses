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

## Issues

* Verificaiton of users existance is not yet implemented. It just fails if the user doesn't exist
* No confirmation that the right user is selected; it's assumed the username is known and correct
* No validation on the email address provided to ensure it's a valid email address
