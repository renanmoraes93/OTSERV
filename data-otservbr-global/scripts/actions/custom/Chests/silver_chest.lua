local silverChest = Action()

function silverChest.onUse(player, item, fromPosition, target, toPosition, isHotkey)


	local inbox = player:getStoreInbox()
	local inboxItems = inbox:getItems()
	if not inbox or #inboxItems > inbox:getMaxCapacity() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You do not have enough space in your store inbox.')
		return false
	end
	
	player:addTransferableCoins(12500)
	player:addTibiaCoins(12500)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received 12500 Tibia Coins.')

	inbox:addItem(45248, 30)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received 30 Roullete Tokens.')

	inbox:addItem(45192, 3)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received 3 Payhunt Key 24 hours.')

	inbox:addItem(34331, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received a Golden Magic Longsword.') 
	

	player:addOutfitAddon(1729,1) -- male
	player:addOutfitAddon(1729,2) -- male
	player:addOutfitAddon(1730,1) -- female
	player:addOutfitAddon(1730,2) -- female
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations you received the Archangel Addon.")

	player:addMount(239)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations you received the Gaviao Mount.")
				
	item:remove(1)

	return true
end

silverChest:id(44874)
silverChest:register()