local bronzeChest = Action()

function bronzeChest.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local inbox = player:getStoreInbox()
	local inboxItems = inbox:getItems()
	if not inbox or #inboxItems > inbox:getMaxCapacity() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You do not have enough space in your store inbox.')
		return false
	end
	
	player:addTransferableCoins(6125)
	player:addTibiaCoins(6125)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received 6125 Tibia Coins.')

	inbox:addItem(45248, 20)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received 20 Roullete Tokens.')

	inbox:addItem(45192, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received 1 Payhunt Key 24 hours.')

	player:addOutfitAddon(1756,1) -- male
	player:addOutfitAddon(1756,2) -- male
	player:addOutfitAddon(1757,1) -- female
	player:addOutfitAddon(1757,2) -- female
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations you received the Merywalker Addon.")

	player:addMount(243) -- White Mount
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations you received the White Mount.")
				
	item:remove(1)

	return true
end

bronzeChest:id(44875)
bronzeChest:register()