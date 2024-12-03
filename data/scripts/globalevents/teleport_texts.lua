local effects = {
    {position = Position(31573, 32597, 8), text = 'BOSSES', effect = CONST_ME_FIREWORK_YELLOW},
    {position = Position(31577, 32597, 8), text = 'ROULETTE', effect = CONST_ME_FIREWORK_BLUE},
    {position = Position(31571, 32597, 8), text = 'HUNTS', effect = CONST_ME_FIREWORK_YELLOW},    
	{position = Position(31575, 32597, 8), text = 'NPC', effect = CONST_ME_FIREWORK_BLUE}, 
    {position = Position(31578, 32590, 8), text = 'THAIS', effect = CONST_ME_FIREWORK_YELLOW},
    {position = Position(31570, 32590, 8), text = 'TRAINERS', effect = CONST_ME_FIREWORK_YELLOW},       
	{position = Position(32369, 32244, 7), text = 'EVOLUTION CITY', effect = CONST_ME_FIREWORK_YELLOW},
    {position = Position(31573, 32590, 8), text = 'CAVE EXCLUSIVA', effect = CONST_ME_FIREWORK_YELLOW},
        {position = Position(31320, 32384, 7), text = 'EVOLUTION CITY', effect = CONST_ME_FIREWORK_YELLOW},       
	{position = Position(31323, 32379, 7), text = 'EASY', effect = CONST_ME_FIREWORK_YELLOW},
    {position = Position(31325, 32379, 7), text = 'MEDIUM', effect = CONST_ME_FIREWORK_YELLOW},
	{position = Position(31327, 32379, 7), text = 'HARD', effect = CONST_ME_FIREWORK_YELLOW},


    {position = Position(31575, 32590, 8), text = 'FORGE', effect = CONST_ME_FIREWORK_YELLOW}



}

local animatedText = GlobalEvent("AnimatedText") 
function animatedText.onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    -- Alterando a cor do texto adicionando uma cor hexadecimal (#FF0000 para vermelho, por exemplo)
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position, COLOR_BLUE)
                end
            end
            if settings.effect then
                -- Mudando o efeito mágico
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end

animatedText:interval(3500)
animatedText:register()

