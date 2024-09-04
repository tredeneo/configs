local frame = CreateFrame("Frame")
--frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", OnAddonLoaded)
-- Função de callback para lidar com o evento de marcação de alvo de raide
local function OnRaidTargetUpdate(self, event, ...)
    -- "unit" é a unidade que teve a marcação de alvo de raide alterada
    local playerName = UnitName("player") -- Obtém o nome do jogador
    local targetIcon = GetRaidTargetIndex("player") -- Verifica a marcação de alvo de raide do jogador
    if targetIcon then
        print("RAID_TARGET_UPDATE: O jogador", playerName, "foi marcado com o ícone", targetIcon)
        -- SetRaidTarget("Focus",math.random(1,8))
        SetRaidTarget("Player",0)
	end
end

frame:SetScript("OnEvent", function(self, event, ...)
    if event == "RAID_TARGET_UPDATE" then
        OnRaidTargetUpdate(self, event, ...)
    end
end)
frame:RegisterEvent("RAID_TARGET_UPDATE")
