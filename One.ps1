# import active directory module for running AD cmdlet
# Author: Alex Rockwood

Import-Module ActiveDirectory

# Store the daata from the .csv file into the varible
$Users = Import-Csv C:\Users\AROCKWOOD\Documents\Code\Powershell\test.csv

#Loop throught each row contaning user detials in the CSV file
foreach ($User in $Users){
    # Read user data from each field in each row
    # the username is used more often, so to prevent typing save that in a variable
        #Write-Output $User
        # create a hashtable for splatting the prams
        $userProps = @{
            # Path                        = $User.Path
            Name                        = $User.First[0] + $User.Last
            GivenName                   = $User.First
            Surname                     = $User.Last
            Initials                    = $User.First[0]+$User.Last[0]
            DisplayName                 = $User.First + " " + $User.Last
            SamAccountName              = $User.First[0] + $User.Last
            AccountPassword             = (ConvertTo-SecureString -String '1qaz@WSX' -AsPlainText -Force)
            Enabled                     = $true
            ChangePasswordAtLogon       = $true
        } #end Userprops
        #Write-Output @userProps
        New-ADUser @userProps
        #Write-Output @userProps
        #Write-Output ($userProps.First) 
}