local Translations = {
    menu = {
        label     = '👔 Werk Garage',
        title     = '%{icon} %{jobname} Voertuigen',
        close     = '⬅ Sluit Menu',
        back      = '⬅ Ga Terug',
        take      = '[~g~E~s~] - %{jobtitle} ',
        store     = '[~g~E~s~] - Parkeer Voertuig',
        polGarage = "Politie Garage",
        ambGarage = "Ambulance Garage",
        mecGarage = "Monteur Garage",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})