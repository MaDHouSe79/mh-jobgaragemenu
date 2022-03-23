local Translations = {
    menu = {
        label     = '👔 Job Garage',
        title     = '%{icon} %{jobname} Vehicles',
        close     = '⬅ Close Menu',
        back      = '⬅ Go Back',
        take      = '[~g~E~s~] - %{jobtitle}',
        store     = '[~g~E~s~] - Store Vehicle',
        polGarage = "Police Garage",
        ambGarage = "Ambulance Garage",
        mecGarage = "Mechanic Garage",
    }, 
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})