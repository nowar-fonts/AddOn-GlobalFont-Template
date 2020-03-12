local LSM3 = LibStub("LibSharedMedia-3.0", true)

function GlobalFont.SharedMediaRegister(this, event, ...)
	if not LSM3 then
		LSM3 = LibStub("LibSharedMedia-3.0", true)
	end
	if LSM3 then
		langMask = LSM3.LOCALE_BIT_western + LSM3.LOCALE_BIT_koKR + LSM3.LOCALE_BIT_zhCN + LSM3.LOCALE_BIT_zhTW + LSM3.LOCALE_BIT_ruRU
		LSM3:Register("font", "Global Font - Default", GlobalFont.DefaultFont, langMask)
		LSM3:Register("font", "Global Font - Chat", GlobalFont.ChatFont, langMask)
	end
end

GlobalFont.SharedMediaHandler = CreateFrame("Frame")
GlobalFont.SharedMediaHandler:SetScript("OnEvent", GlobalFont.SharedMediaRegister)
GlobalFont.SharedMediaHandler:RegisterEvent("ADDON_LOADED")
