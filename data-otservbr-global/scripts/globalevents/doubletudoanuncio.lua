local doubletudoanuncio = GlobalEvent("doubletudoanuncio")
function doubletudoanuncio.onThink(interval, lastExecution)
    local messages = {
	"[DOUBLE TUDO OFF]: Todo sabado e domingo tem double exp, double skill e rapid respawn",
	--"EVENTO DOUBLE ONLINE TOKEN (ON)",
	"EVENTO DOUBLE BESTIARY (ON)",
	--"EVENTO RAPID RESPAWN (ON)",
	--"EVENTO FAST EXERCISE (ON)",
}

    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_EVENT_ADVANCE)
    return true
end

doubletudoanuncio:interval(900000) --15 minutes
doubletudoanuncio:register()