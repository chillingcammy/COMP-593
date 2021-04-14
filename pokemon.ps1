Function Get-Pokemon{
    Param(
        $Pokemon = 'charmander'
    )
    $Path = "./cache/$Pokemon.JSON"
    # Write-Output "Checking $Path"
    if (Test-Path -Path $Path){
    #get that json, read that json (from cache)
    $JSON = Get-Content -Path $Path -Raw
    # Write-Output "Found $Path"
    } else {
        # Write-Output "Creating $Path"
        $URI = "http://pokeapi.co/api/v2/pokemon/$Pokemon/"
        $REQUEST = Invoke-WebRequest $URI
        $JSON = $Request.Content
        $JSON | Out-File -FilePath $Path
    #get that json, read that json (from the web)
    #write json to cache
    }
    $OBJ = $JSON | ConvertFrom-Json
    #$OBJ | Get-Member
    $Name = $OBJ.name
    $Name = $Name.substring(0,1).ToUpper()+$Name.substring(1)
    $Output = "You have selected the Pokémon, $Name! $Name is a "
    
    $Type_count = 0
    ForEach ($Type in $OBJ.types){
        if ($Type_count -eq 1){
            $Output += "-"
        }
        $poke_type = $Type.type.name
        $Output += $poke_type
        $Type_count = 1
    

    }
    

    $Weight = $OBJ.weight
    $Output += " type Pokémon and weighs $Weight kilograms."
    

    Write-Output $Output

        #output json to terminal
}


    $Input = Read-Host -Prompt 'Hello! Please enter the name of your favorite Pokémon'
    $Pokemon = $Input.substring(0,1).ToUpper()+$Input.substring(1)


Get-Pokemon -Pokemon $Pokemon.ToLower()
