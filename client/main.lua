--[[ ===================================================== ]]--
--[[       QBCore Job Garage Menu Script by MaDHouSe       ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local Blips = {}

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
    if job == 'police'    then icon = Config.Icons.police end
    if job == 'ambulance' then icon = Config.Icons.ambulance end
    if job == 'mechanic'  then icon = Config.Icons.mechanic end
    return icon
end

local function SetCarItemsInfo()
    local items = {}
    for k, item in pairs(Config.CarItems) do
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
    Config.CarItems = items
end

local function TakeOutVehicle(model, coords, plate)
    local coords = coords
    if coords then
        QBCore.Functions.SpawnVehicle(model, function(veh)
	    SetCarItemsInfo()
            SetVehicleNumberPlateText(veh, plate..tostring(math.random(1000, 9999)))
            SetEntityHeading(veh, coords.w)
            exports[Config.FuelScript]:SetFuel(veh, 100.0)
            SetVehicleFuelLevel(veh, 100.0)
	    DecorSetFloat(veh, "_FUEL_LEVEL", GetVehicleFuelLevel(veh))
            exports['qb-menu']:closeMenu()
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            SetVehRadioStation(veh, 'OFF')
            SetVehicleDirtLevel(veh, 0)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
            TriggerServerEvent("inventory:server:addTrunkItems", QBCore.Functions.GetPlate(veh), Config.CarItems)
            SetVehicleEngineOn(veh, true, true)
        end, coords, true)
    end
end

local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
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

RegisterNetEvent('qb-jobgaragemenu:client:vehCategories', function(coord)
    local categoryMenu = {
        {
            header = Lang:t('menu.label', {icon = GetIcone(QBCore.Functions.GetPlayerData().job.name)}),
            isMenuHeader = true
        }
    }
    for category, label in pairs(Config.Categories) do
        local found = false
        local jobname = nil
        for _, data in pairs(Config.Vehicles) do
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
                    event = 'qb-jobgaragemenu:client:openVehCats',
                    args = {
                        catName = category,
                        coords  = coord,
                        jobname = jobname,
                    }
                },
            }
        end
    end
    categoryMenu[#categoryMenu + 1] = {
        header = Lang:t('menu.close'),
        params = {
            event = 'qb-jobgaragemenu:client:homeMenu'
        }
    }
    exports['qb-menu']:openMenu(categoryMenu)
end)

RegisterNetEvent('qb-jobgaragemenu:client:openVehCats', function(data)
    local vehicleMenu = {
        {
            header = Lang:t('menu.title', {icon = GetIcone(QBCore.Functions.GetPlayerData().job.name), jobname = data.jobname}),
            isMenuHeader = true
        },
        {
            header = Lang:t('menu.back'),
            params = {
                event = 'qb-jobgaragemenu:client:vehCategories'
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
                                event = 'qb-jobgaragemenu:server:takeOutVehicle',
                                args = {
                                    vehicle = v.model,
                                    coords = data.coords,
                                    plate = Config.Vehicles[k].job,
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
            event = 'qb-jobgaragemenu:client:homeMenu'
        }
    }
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent('qb-jobgaragemenu:server:takeOutVehicle', function(data)
    TakeOutVehicle(data.vehicle, data.coords, data.plate)
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pl = GetEntityCoords(ped)
        local sleep = 2000
        if LocalPlayer.state.isLoggedIn then
            for job, garage in pairs(Config.Garages) do
                if QBCore.Functions.GetPlayerData().job.name == job then
                    for k, v in pairs(garage) do
                        if #(pl - vector3(v.coords.x, v.coords.y, v.coords.z)) < 7 then
                            sleep = 5
                            DrawMarker(2, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)                
                            if IsPedInAnyVehicle(ped, false) then
                                DrawText3D(v.coords.x, v.coords.y, v.coords.z + 0.5, Lang:t('menu.store'))
                            else
                                DrawText3D(v.coords.x, v.coords.y, v.coords.z + 0.5, Lang:t('menu.take', {jobtitle = v.name}))
                            end
                            if IsControlJustReleased(0, 38) then
                                if IsPedInAnyVehicle(ped, false) then
                                    local veh = GetVehiclePedIsIn(ped)
                                    TaskLeaveVehicle(ped, veh)
                                    Wait(1500)
                                    QBCore.Functions.DeleteVehicle(veh)
                                else
                                    TriggerEvent('qb-jobgaragemenu:client:vehCategories', v.coords)
                                end
                            end
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    if LocalPlayer.state.isLoggedIn then
        DeleteBlips()
    end
end)
