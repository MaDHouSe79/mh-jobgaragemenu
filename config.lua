--[[ ===================================================== ]]--
--[[       QBCore Job Garage Menu Script by MaDHouSe       ]]--
--[[ ===================================================== ]]--

Config = {}

Config.FuelScript = "LegacyFuel"


Config.Icons = {
    police    = "🚓",
    ambulance = "🚑",
    mechanic  = "🚗",
}

Config.Categories = {
    ['sedans']      = 'Sedans',
    ['coupes']      = 'Coupes',
    ['suvs']        = 'Suvs',
    ['offroad']     = 'Offroad',
    ['muscle']      = 'Muscle',
    ['compacts']    = 'Compacts',
    ['motorcycles'] = 'Motorcycles',
    ['vans']        = 'Vans',
    ['cycles']      = 'Cycles',
}


Config.Garages = {
    

    -- police job garage
    ['police'] = {
        [0] =  {
            name     = Lang:t('menu.polGarage'),              -- blip name
            job      = "police",                              -- job
            showBlip = true,                                  -- show blip
            blip     = 50,                                    -- blip icon
            coords   = vector4(436.21, -1017.3, 28.8, 85.96), -- map blip
            ped      = vector4(441.16, -1013.25, 28.62, 161.62),
        },
    },



    --ambulance job garage
    ['ambulance'] = {
        [0] =  {
            name     = Lang:t('menu.ambGarage'),               -- blip name
            job      = "ambulance",                            -- job
            showBlip = true,                                   -- show blip
            blip     = 50,                                     -- blip icon
            coords   = vector4(287.16, -593.4, 43.14, 336.17), -- map blip
        },
    },


    --mechanic job garage
    ['mechanic'] = {
        [0] =  {
            name     = Lang:t('menu.mecGarage'),                       -- blip name
            job      = "mechanic",                              -- job
            showBlip = true,                                    -- show blip
            blip     = 50,                                      -- blip icon
            coords   = vector4(-395.25, -111.6, 38.68, 215.19), -- map blip
        },
    },   -- you can add more garage locations here
}



Config.Vehicles = {

    -- police
    ['polmotor'] = {                      -- must be a unique name
        ['name']     = 'Police motor cycles', -- Vehicle label name
        ['model']    = 'polmotor',        -- Vehicle spawn model name
        ['category'] = 'motorcycles',     -- Vehicle category
        ['job']      = 'police',          -- Verhicle job
        ['rank']     = {0,1,2,3,4},       -- allowed ranks
    },
    ['police2'] = {
        ['name']     = 'Police Vehicle 2',
        ['model']    = 'police2',
        ['category'] = 'compacts',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['police3'] = {
        ['name']     = 'Police Vehicle 3',
        ['model']    = 'police3',
        ['category'] = 'compacts',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['police4'] = {
        ['name']     = 'Police Vehicle 4',
        ['model']    = 'police4',
        ['category'] = 'sedans',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['ov3'] = {
        ['name']     = 'Police Vehicle 5',
        ['model']    = 'ov3',
        ['category'] = 'sedans',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    }, 
    ['polaudi2'] = {
        ['name']     = 'Police Vehicle 6',
        ['model']    = 'polaudi2',
        ['category'] = 'sedans',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    }, 
    ['polfiets'] = {
        ['name']     = 'Police cycle',
        ['model']    = 'polfiets',
        ['category'] = 'cycles',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    

    --ambulance
    ['ambubmw'] = {
        ['name']     = 'Ambulance 1',
        ['model']    = 'ambubmw',
        ['category'] = 'compacts',
        ['job']      = 'ambulance',
        ['rank']     = {0,1,2,3,4},
    },


    --mechanic
    ['flatbed'] = {
        ['name']     = 'Vehicle Ambulance',
        ['model']    = 'flatbed',
        ['category'] = 'compacts',
        ['job']      = 'mechanic',
        ['rank']     = {0,1,2,3,4},
    },

    -- you can add more vehicle jobs here 
}



Config.CarItems = {
    [1] = {
        name = "heavyarmor",
        amount = 2,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "empty_evidence_bag",
        amount = 10,
        info = {},
        type = "item",
        slot = 2,
    },
    [3] = {
        name = "police_stormram",
        amount = 1,
        info = {},
        type = "item",
        slot = 3,
    },
}
