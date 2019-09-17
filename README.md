# Add-ProxyAddresses
Manages Proxy Addresses (email aliases) for Domain Synchronised Office365 users without an on-prem Exchange Management Console.

## Usage

### Using sAMAccountName
```
.\Add-ProxyAddress.ps1 -Username sAMAccountName -EmailAddress newaddress@email.org
```

### Using UserPrincipalName (UPN)
```
.\Add-ProxyAddress.ps1 -Username user@principalname.com -EmailAddress newaddress@email.org
```

## Expected Output

### Output when proxy addresses are present, but not the one requested.
```
Found User UserPrincipal
user@principalname.com
Checking user@principalname.com for newaddress@email.org
Checking useralias1@principalname.com for newaddress@email.org
Alias not found. Adding (newaddress@email.org)...
```

### Output when no proxy addresses are present.
```
Found User UserPrincipal
user@principalname.com
No aliases present, adding Primary Alias (user@principalname.com)
Alias not found. Adding (newaddress@email.org)...
```

## Issues

* Verificaiton of users existence is only rudamentarily implemented. Will generate an error, but won't change anything.
* No confirmation that the right user is selected; it's assumed the username is known and correct
* No validation on the email address provided to ensure it's a valid email address
* No validation checking on the existence of a primary email address field (mail)
* Needs to be able to update the Primary SMTP: ProxyAddress without a specified email address
