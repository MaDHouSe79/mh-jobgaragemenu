## QB Job Garage Menu with category 👊😁👍
- All vehicles can be put by category.
- You can also rank vehicles so that only these players can use those vehicles.
- Garages and blips are job dependent.
- With this you have a shorter vehicle list.

## 📸 Screenshot 👊😁👍
![foto1](https://www.madirc.nl/fivem/garagemenu2.png)
![foto2](https://www.madirc.nl/fivem/garagemenu1.png)

## 💪 Dependencies
- ✅ [qb-core](https://github.com/qbcore-framework/qb-core)

## Available jobs
- Police
- Ambulance
- Mechanic

## Example Job Vehicle
```lua
['police1'] = {                 -- must be a unique name
    ['name']     = 'Police 1',  -- Vehicle label name
    ['model']    = 'police',    -- Vehicle spawn model name
    ['category'] = 'sadan',     -- Vehicle category (make sure this categorie is the same as in Config.Categories)
    ['job']      = 'police',    -- Verhicle job
    ['rank']     = {0,1,2,3,4}, -- allowed ranks (see resources/[qb]/qb-core/shared/jobs.lua) (grades)
},
```

## Install
- place the folder `qb-jobgaragemenu` in `resources/[qb]`
- restart your server

## 🐞 Any bugs issues or suggestions, let my know.

## 🙈 Youtube & Discord
- [Youtube](https://www.youtube.com/channel/UC6431XeIqHjswry5OYtim0A)
- [Discord](https://discord.gg/cEMSeE9dgS)
