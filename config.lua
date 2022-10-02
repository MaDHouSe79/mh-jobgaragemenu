--[[ ===================================================== ]]--
--[[       QBCore Job Garage Menu Script by MaDHouSe       ]]--
--[[ ===================================================== ]]--

Config = {}

Config.FuelScript = "LegacyFuel"

Config.DebugPoly = false

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
    ['muscle']      = 'Kracht',
    ['compacts']    = 'Compacts',
    ['motorcycles'] = 'Motorfietsen',
    ['vans']        = 'Bussen',
    ['cycles']      = 'Fietsen',
}


Config.Garages = {
    -- police job garage
    ['police'] = {
        [0] =  {
            name = Lang:t('menu.polGarage'),                           -- blip name
            job = "police",                                            -- job
            showBlip = true,                                          -- show blip
            blip  = 50,                                                -- blip icon
            coords = {x = -1119.0516, y = -859.0349, z = 13.1287, h = 35.633346557617}, -- map blip
            zones = {                                                  -- garage zone
                vector2(-1119.7330, -854.4460),
                vector2(-1115.2875, -860.4772),
                vector2(-1118.6687, -863.2036),
                vector2(-1123.2350, -857.2308),
                vector2(-1119.7330, -854.4460), 
            },
            minZ = 12.0,
            maxZ = 15.0,
        }, -- you can add jog garage more here
    },-- you can add more job garages here



    --ambulance job garage
    ['ambulance'] = {
        [0] =  {
            name     = Lang:t('menu.ambGarage'),               -- blip name
            job      = "ambulance",                            -- job
            showBlip = true,                                   -- show blip
            blip     = 50,                                     -- blip icon
            coords   = {x = 320.9399, y = -565.3134, z = 28.3846, h = 248.9135}, -- map blip
            zones    = {
                vector2(323.8319, -568.7247),
                vector2(316.3100, -566.1139),
                vector2(317.8909, -562.0846),
                vector2(325.2442, -564.5560),
                vector2(323.8319, -568.7247),
            },
            minZ = 25.0,
            maxZ = 30.0,
        },
    },

--[[
    --mechanic job garage
    ['mechanic'] = {
        [0] =  {
            name     = Lang:t('menu.mecGarage'),                       -- blip name
            job      = "mechanic",                              -- job
            showBlip = true,                                    -- show blip
            blip     = 50,                                      -- blip icon
            coords   = vector4(-395.25, -111.6, 38.68, 215.19), -- map blip
            zones    = {
                vector2(-1119.7330, -854.4460),
                vector2(-1115.2875, -860.4772),
                vector2(-1118.6687, -863.2036),
                vector2(-1123.2350, -857.2308),
                vector2(-1119.7330, -854.4460), 
            },
        },
    },   -- you can add more garage locations here
]]--
}


Config.Vehicles = {
    
    -- police
    ['politie10'] = {                       -- must be a unique name
        ['name']     = 'Mercedes B-Klasse', -- Vehicle label name
        ['model']    = 'politie10',         -- Vehicle spawn model name
        ['category'] = 'compacts',          -- Vehicle category
        ['job']      = 'police',            -- Verhicle job
        ['rank']     = {0,1,2,3,4},         -- allowed ranks
    },
    ['poltouran2009'] = {
        ['name']     = 'Volkswagen Touran 2009',
        ['model']    = 'poltouran2009',
        ['category'] = 'compacts',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['poltouran2016'] = {
        ['name']     = 'Volkswagen Touran 2016',
        ['model']    = 'poltouran2016',
        ['category'] = 'compacts',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['poltransporter5'] = {
        ['name']     = 'Volkswagen T5',
        ['model']    = 'poltransporter5',
        ['category'] = 'vans',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['poltransporter6'] = {
        ['name']     = 'Volkswagen T6 K-9',
        ['model']    = 'poltransporter6',
        ['category'] = 'vans',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    }, 
    ['poltoyota'] = {
        ['name']     = 'Toyota Landcruiser',
        ['model']    = 'poltoyota',
        ['category'] = 'suvs',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    }, 
    ['Politie14'] = {
        ['name']     = 'Volkswagen Passat',
        ['model']    = 'Politie14',
        ['category'] = 'sedans',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['polaudi'] = {
        ['name']     = 'Audi A6',
        ['model']    = 'polaudi',
        ['category'] = 'sedans',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['polaudipit'] = {
        ['name']     = 'Audi A6 PIT',
        ['model']    = 'polaudipit',
        ['category'] = 'sedans',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['polvolvo70'] = {
        ['name']     = 'Volvo V70',
        ['model']    = 'polvolvo70',
        ['category'] = 'sedans',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['polmotor2'] = {
        ['name']     = 'Motor BMW Offroad',
        ['model']    = 'polmotor2',
        ['category'] = 'motorcycles',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['polmotor3'] = {
        ['name']     = 'Motor Yamaha',
        ['model']    = 'polmotor3',
        ['category'] = 'motorcycles',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['astra'] = {
        ['name']     = 'Motor Yamaha',
        ['model']    = 'astra',
        ['category'] = 'coupes',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['polaudiat'] = {
        ['name']     = 'Audi RS6',
        ['model']    = 'polaudiat',
        ['category'] = 'coupes',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['polpolo'] = {
        ['name']     = 'Volkswagen Polo Unmarked',
        ['model']    = 'polpolo',
        ['category'] = 'coupes',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['Polskoda'] = {
        ['name']     = 'Skoda RS Unmarked',
        ['model']    = 'Polskoda',
        ['category'] = 'coupes',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['polmercedes'] = {
        ['name']     = 'Mercedes Benz Unmarked',
        ['model']    = 'polmercedes',
        ['category'] = 'coupes',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },
    ['politie34'] = {
        ['name']     = 'Volkswagen Amarok',
        ['model']    = 'polmercedes',
        ['category'] = 'coupes',
        ['job']      = 'police',
        ['rank']     = {0,1,2,3,4},
    },

    
    
    --ambulance
    ['asprinter'] = {
        ['name']     = 'Mercedes Sprinter',
        ['model']    = 'asprinter',
        ['category'] = 'vans',
        ['job']      = 'ambulance',
        ['rank']     = {0,1,2,3,4},
    },
    ['aeklasse'] = {
        ['name']     = 'Mercedes E-Klasse',
        ['model']    = 'aeklasse',
        ['category'] = 'vans',
        ['job']      = 'ambulance',
        ['rank']     = {0,1,2,3,4},
    },
    ['ambuamarok'] = {
        ['name']     = 'Volkswagen Amarok',
        ['model']    = 'ambuamarok',
        ['category'] = 'sedans',
        ['job']      = 'ambulance',
        ['rank']     = {0,1,2,3,4},
    },
    ['ambumotor'] = {
        ['name']     = 'BMW Motor',
        ['model']    = 'ambumotor',
        ['category'] = 'motorcycles',
        ['job']      = 'ambulance',
        ['rank']     = {0,1,2,3,4},
    },
    ['ambuq7'] = {
        ['name']     = 'Audi Q7',
        ['model']    = 'ambuq7',
        ['category'] = 'sedans',
        ['job']      = 'ambulance',
        ['rank']     = {0,1,2,3,4},
    },
    ['ambutouran'] = {
        ['name']     = 'Volkswagen Touran',
        ['model']    = 'ambutouran',
        ['category'] = 'vans',
        ['job']      = 'ambulance',
        ['rank']     = {0,1,2,3,4},
    },
    ['ambuvolvo'] = {
        ['name']     = 'Volvo T6 AWD',
        ['model']    = 'ambuvolvo',
        ['category'] = 'suvs',
        ['job']      = 'ambulance',
        ['rank']     = {0,1,2,3,4},
    },
    ['sprinterambu'] = {
        ['name']     = 'Mercedes Sprinter Groot',
        ['model']    = 'sprinterambu',
        ['category'] = 'vans',
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
    
    ['ambulance'] = {
        [1] = {
            name = "bandage",
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "firstaid",
            amount = 10,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_flashlight",
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
        },
    },
    
    ['police'] = {
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
}
