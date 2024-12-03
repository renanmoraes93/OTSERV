local goldenChest = Action()

function goldenChest.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local inbox = player:getStoreInbox()
	local inboxItems = inbox:getItems()
	if not inbox or #inboxItems > inbox:getMaxCapacity() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You do not have enough space in your store inbox.')
		return false
	end
	
	player:addTransferableCoins(18750)
	player:addTibiaCoins(18750)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received 18750 Tibia Coins.')

	inbox:addItem(45248, 40)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received 40 Roullete Tokens.')

	inbox:addItem(45192, 15)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received 15 Payhunt Key 24 hours.')

	inbox:addItem(32925, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received a Golden Crown.') 
	
	player:addOutfitAddon(1735,1) -- male
	player:addOutfitAddon(1735,2) -- male
	player:addOutfitAddon(1734,1) -- female
	player:addOutfitAddon(1734,2) -- female
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations you received the Power Abuser Addon.")
	
	player:addMount(242) -- Divine Mount
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations you received the Divine Mount.")
				
	item:remove(1)

	return true
end

goldenChest:id(44873)
goldenChest:register()