local outfits = {
    -- Config
    dollID = 44816, -- Change this to your dolls or items, item ID

    -- Main Window Messages (The first window the player sees)
    mainTitle = "Choose an outfit",
    mainMsg = "You will receive both addons as well as the outfit you choose.",

    -- Already Owned Window (The window that appears when the player already owns the addon)
    ownedTitle = "Whoops!",
    ownedMsg = "You already have this addon. Please choose another.",

    -- No Doll in Backpack (The window that appears when the player doesn't have the doll in their backpack)
    dollTitle = "Whoops!",
    dollMsg = "The addon doll must be in your backpack.",
    -- End Config

    -- Outfit Table
    [1] = {name = "Citizen", male = 128, female = 136},
    [2] = {name = "Hunter", male = 129, female = 137},
    [3] = {name = "Knight", male = 131, female = 139},
    [4] = {name = "Noble", male = 132, female = 140},
    [5] = {name = "Summoner", male = 133, female = 141},
    [6] = {name = "Barbarian", male = 143, female = 147},
    [7] = {name = "Wizard", male = 145, female = 149},
    [8] = {name = "Oriental", male = 146, female = 150},
    [9] = {name = "Pirate", male = 151, female = 155},
    [10] = {name = "Beggar", male = 153, female = 157},
    [11] = {name = "Shaman", male = 154, female = 158},
    [12] = {name = "Norse", male = 251, female = 252},
    [13] = {name = "Nightmare", male = 268, female = 269},
    [14] = {name = "Jester", male = 273, female = 270},
    [15] = {name = "Brotherhood", male = 278, female = 279},
    [16] = {name = "Demonhunter", male = 289, female = 288},
    [17] = {name = "Yalaharian", male = 325, female = 324},
    [18] = {name = "Warmaster", male = 335, female = 336},
    [19] = {name = "Wayfarer", male = 367, female = 366},
    [20] = {name = "Afflicted", male = 430, female = 431},
    [21] = {name = "Elementalist", male = 432, female = 433},
    [22] = {name = "Deepling", male = 463, female = 464},
    [23] = {name = "Insectoid", male = 465, female = 466},
    [24] = {name = "Entrepreneur", male = 472, female = 471},
    [25] = {name = "Crystal Warlord", male = 512, female = 513},
    [26] = {name = "Soil Guardian", male = 516, female = 514},
    [27] = {name = "Demon", male = 541, female = 542},
    [28] = {name = "Cave Explorer", male = 574, female = 575},
    [29] = {name = "Dream Warden", male = 577, female = 578},
    [30] = {name = "Champion", male = 633, female = 632},
    [31] = {name = "Conjurer", male = 634, female = 635},
    [32] = {name = "Beastmaster", male = 637, female = 636},
    [33] = {name = "Chaos Acolyte", male = 665, female = 664},
    [34] = {name = "Death Herald", male = 667, female = 666},
    [35] = {name = "Ranger", male = 684, female = 683},
    [36] = {name = "Ceremonial Garb", male = 695, female = 694},
    [37] = {name = "Puppeteer", male = 697, female = 696},
    [38] = {name = "Spirit Caller", male = 699, female = 698},
    [39] = {name = "Evoker", male = 725, female = 724},
    [40] = {name = "Seaweaver", male = 733, female = 732},
    [41] = {name = "Recruiter", male = 746, female = 745},
    [42] = {name = "Sea Dog", male = 750, female = 749},
    [43] = {name = "Royal Pumpkin", male = 760, female = 759},
}

local addonsDollModal = TalkAction("!addondoll")

function addonsDollModal.onSay(player, words, param)
    player:sendAddonWindow(outfits)
    return true
end

addonsDollModal:separator(" ")
addonsDollModal:groupType("normal")
addonsDollModal:register()
