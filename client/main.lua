--[[ ===================================================== ]]--
--[[       QBCore Job Garage Menu Script by MaDHouSe       ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local Blips = {}
local isInside = false

local function CreateJobBlips()
    Blips = {}
    for _, garage in pairs(Config.Garages) do 
        for k, v in pairs(garage) do
            if QBCore.Functions.GetPlayerData().job.name == v.job then
                if v.showBlip then                    
                    local Garage = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
                    SetBlipSprite (Garage, v.blip)
                    SetBlipDisplay(Garage, 4)
                    SetBlipScale  (Garage, 0.75)
                    SetBlipAsShortRange(Garage, true)
                    SetBlipColour(Garage, 3)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentSubstringPlayerName(v.name)
                    EndTextCommandSetBlipName(Garage)
                    Blips[#Blips+1] = Garage
                end
            end
        end
    end
end

local function DeleteBlips()
    if #Blips > 0 then
        for _, blip in pairs(Blips) do
            RemoveBlip(blip)
        end
    end
    CreateJobBlips()
end

local function GetIcone(job)
    local icon = nil
    if job == 'police' then icon = Config.Icons.police end
    if job == 'ambulance' then icon = Config.Icons.ambulance end
    if job == 'mechanic' then icon = Config.Icons.mechanic end
    return icon
end

local function SetCarItemsInfo(job)
    local items = {}
    for k, item in pairs(Config.CarItems[job]) do
        local itemInfo = QBCore.Shared.Items[item.name:lower()]
        items[item.slot] = {
            name = itemInfo["name"],
            amount = tonumber(item.amount),
            info = item.info,
            label = itemInfo["label"],
            description = itemInfo["description"] and itemInfo["description"] or "",
            weight = itemInfo["weight"],
            type = itemInfo["type"],
            unique = itemInfo["unique"],
            useable = itemInfo["useable"],
            image = itemInfo["image"],
            slot = item.slot,
        }
    end
    Config.CarItems[job] = items
end

local function TakeOutVehicle(data)
    local coords = data.coords
    local spawnPoint = vector4(coords.x, coords.y, coords.z, coords.h)
    if coords then
        QBCore.Functions.SpawnVehicle(data.vehicle, function(veh)
            SetCarItemsInfo(data.job)
            SetVehicleNumberPlateText(veh, data.plate..tostring(math.random(1000, 9999)))
            exports[Config.FuelScript]:SetFuel(veh, 100.0)
            SetVehicleFuelLevel(veh, 100.0)
            DecorSetFloat(veh, "_FUEL_LEVEL", GetVehicleFuelLevel(veh))
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            SetVehicleOnGroundProperly(veh)
            SetVehicleEngineHealth(veh, 1000.0)
            SetVehicleBodyHealth(veh, 1000.0)
            SetVehiclePetrolTankHealth(veh, 1000.0)
            SetEntityHeading(veh, coords.h)
            SetVehRadioStation(veh, 'OFF')
            SetVehicleDirtLevel(veh, 0)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
            TriggerServerEvent("inventory:server:addTrunkItems", QBCore.Functions.GetPlate(veh), Config.CarItems[data.job])
            SetVehicleEngineOn(veh, true, true)
            exports['qb-menu']:closeMenu()
        end, vector4(coords.x, coords.y, coords.z, coords.h), true)
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    DeleteBlips()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerData.job = job
    DeleteBlips()
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(data)
    PlayerData = data
end)

RegisterNetEvent('mh-jobgaragemenu:client:vehCategories', function(coords)
    local categoryMenu = {
        {
            header = Lang:t('menu.label', {icon = GetIcone(QBCore.Functions.GetPlayerData().job.name)}),
            isMenuHeader = true
        }
    }
    for category, label in pairs(Config.Categories) do
        local found = false
        local jobname = nil
        local spawnpoint = nil
        for _, data in pairs(Config.Vehicles) do
            if Config.Garages[data.job] then
                for _, v in pairs(Config.Garages[data.job]) do
                    local distance = #(GetEntityCoords(PlayerPedId()) - vector3(v.coords.x, v.coords.y, v.coords.z))
                    if distance < 2.5 then
                        spawnpoint = v.coords
                    end
                end
            end
            if category == data.category then
                for _,rank in pairs(data.rank) do 
                    if QBCore.Functions.GetPlayerData().job.name == data.job then
                        if QBCore.Functions.GetPlayerData().job.grade.level == rank then
                            jobname = QBCore.Functions.GetPlayerData().job.grade.name
                            found = true
                        end
                    end
                end
            end
        end
        if found then            
            categoryMenu[#categoryMenu + 1] = {
                header = label,
                params = {
                    event = 'mh-jobgaragemenu:client:openVehCats',
                    args = {
                        catName = category,
                        coords  = spawnpoint,
                        jobname = jobname,
                    }
                },
            }
        end
    end
    categoryMenu[#categoryMenu + 1] = {
        header = Lang:t('menu.close'),
        params = {
            event = 'mh-jobgaragemenu:client:homeMenu'
        }
    }
    exports['qb-menu']:openMenu(categoryMenu)
end)

RegisterNetEvent('mh-jobgaragemenu:client:openVehCats', function(data)
    local vehicleMenu = {
        {
            header = Lang:t('menu.title', {jobname = data.jobname}),
            isMenuHeader = true
        },
        {
            header = Lang:t('menu.back'),
            params = {
                event = 'mh-jobgaragemenu:client:vehCategories'
            }
        }
    }
    for k,v in pairs(Config.Vehicles) do 
        if Config.Vehicles[k]["category"] == data.catName then
            for _,rank in pairs(Config.Vehicles[k]['rank']) do
                if QBCore.Functions.GetPlayerData().job.name == Config.Vehicles[k].job then
                    if QBCore.Functions.GetPlayerData().job.grade.level == rank then
                        vehicleMenu[#vehicleMenu + 1] = {
                            header = v.name,
                            txt = data.catName,
                            params = {
                                event = 'mh-jobgaragemenu:client:takeOutVehicle',
                                args = {
                                    vehicle = v.model,
                                    coords = data.coords,
                                    plate = Config.Vehicles[k].job,
                                    job = Config.Vehicles[k].job,
                                }
                            }
                        }
                    end
                end
            end
        end
    end
    vehicleMenu[#vehicleMenu + 1] = {
        header = Lang:t('menu.close'),
        params = {
            event = 'mh-jobgaragemenu:client:homeMenu'
        }
    }
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent('mh-jobgaragemenu:client:takeOutVehicle', function(data)
    TakeOutVehicle(data)
end)


local zones = {}
for k, v in pairs(Config.Garages) do
    for _, garage in pairs(v) do
        zones[#zones + 1] = PolyZone:Create({table.unpack(garage.zones)}, {
            name = garage.name,
            minZ = garage.minZ,
            maxZ = garage.maxZ,
        })
    end
end
garageCombo = ComboZone:Create(zones, { name = "GarageCombo", debugPoly = Config.DebugPoly  })

CreateThread(function()
    while true do
        if IsControlJustReleased(0, 38) and isInside then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(PlayerPedId())
            if IsPedInAnyVehicle(ped, false) then
                local veh = GetVehiclePedIsIn(ped)
                TaskLeaveVehicle(ped, veh)
                Wait(1500)
                QBCore.Functions.DeleteVehicle(veh)
            else
                TriggerEvent('mh-jobgaragemenu:client:vehCategories', pos)
            end
        end
        Wait(10)
    end
end)

CreateThread(function()
    Wait(1000)
    while true do
        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local isPointInside = garageCombo:isPointInside(pos)
            if isPointInside then
                if IsPedInAnyVehicle(ped, false) then
                    exports['qb-core']:DrawText("[E] - Parkeer voertuig")
                else
                    exports['qb-core']:DrawText("[E] - Open Werk Garage")
                end
                isInside = true
            else
                if isInside then
                    exports['qb-core']:HideText()
                end
                isInside = false
            end
        end
        Wait(1000)
    end
end)


CreateThread(function()
    if LocalPlayer.state.isLoggedIn then
        DeleteBlips()
    end
end)
