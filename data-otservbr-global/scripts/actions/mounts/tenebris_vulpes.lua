local config = {
	[49731] = { mountId = 220, message = "You are now Tenebris Vulpes!" },
}

local hazemount = Action()

function hazemount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local mount = config[item.itemid]

	if not mount then
		return true
	end

	if not player:hasMount(mount.mountId) then
		player:addMount(mount.mountId)
		player:say(mount.message, TALKTYPE_MONSTER_SAY)
		item:remove(1)
	else
		player:sendTextMessage(19, "You already have this mount")
	end
	return true
end

hazemount:id(49731)
hazemount:register()