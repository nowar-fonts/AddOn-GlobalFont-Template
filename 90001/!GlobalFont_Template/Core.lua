local _, GlobalFont = ...
GlobalFont.Locale = GetLocale()

-- define font files here
GlobalFont.DefaultFont = [[Interface\AddOns\!GlobalFont_Template\SampleFont.ttf]]
GlobalFont.ChatFont = [[Interface\AddOns\!GlobalFont_Template\SampleChat.ttf]]

-- you can change how to determine font size here
function GlobalFont.CalculateFontSize(sizeWestern, sizeChinese)
	if GlobalFont.Locale == "zhCN" or GlobalFont.Locale == "zhTW" then
		if sizeWestern >= sizeChinese then
			-- sometimes it’s too small to read
			-- i.e. the item list in new auction house frame
			return sizeWestern
		else
			-- sometimes it’s too large to display
			-- i.e. player lvl in who list frame
			return (sizeWestern + sizeChinese) / 2
		end
	else
		return sizeWestern
	end
end

function GlobalFont.Register(this, event, ...)
	STANDARD_TEXT_FONT = GlobalFont.DefaultFont
	UNIT_NAME_FONT = GlobalFont.DefaultFont
	DAMAGE_TEXT_FONT = GlobalFont.DefaultFont

	-- don’t ask me where they’re applied. these codes were automatically generated from xml files.
	if SystemFont_Tiny2 then SystemFont_Tiny2:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(8, 8)) end
	if SystemFont_Tiny then SystemFont_Tiny:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(9, 9)) end
	if SystemFont_Shadow_Small then SystemFont_Shadow_Small:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(10, 15)) end
	if Game10Font_o1 then Game10Font_o1:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(10, 12), "OUTLINE") end
	if SystemFont_Small then SystemFont_Small:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(10, 12)) end
	if SystemFont_Small2 then SystemFont_Small2:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(11, 13)) end
	if SystemFont_Shadow_Small2 then SystemFont_Shadow_Small2:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(11, 13)) end
	if SystemFont_Shadow_Med1_Outline then SystemFont_Shadow_Med1_Outline:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(12, 15), "OUTLINE") end
	if SystemFont_Shadow_Med1 then SystemFont_Shadow_Med1:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(12, 15)) end
	if SystemFont_Med2 then SystemFont_Med2:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(13, 14)) end
	if SystemFont_Med3 then SystemFont_Med3:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(14, 13)) end
	if SystemFont_Shadow_Med3 then SystemFont_Shadow_Med3:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(14, 14)) end
	if SystemFont_Shadow_Med3_Outline then SystemFont_Shadow_Med3_Outline:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(14, 14), "OUTLINE") end
	if QuestFont_Large then QuestFont_Large:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(15, 15)) end
	if QuestFont_Huge then QuestFont_Huge:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(18, 17)) end
	if SystemFont_Large then SystemFont_Large:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(16, 13)) end
	if SystemFont_Shadow_Large_Outline then SystemFont_Shadow_Large_Outline:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(16, 17), "OUTLINE") end
	if SystemFont_Shadow_Med2 then SystemFont_Shadow_Med2:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(14, 16)) end
	if SystemFont_Shadow_Large then SystemFont_Shadow_Large:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(16, 17)) end
	if SystemFont_Shadow_Large2 then SystemFont_Shadow_Large2:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(18, 19)) end
	if SystemFont_Shadow_Huge1 then SystemFont_Shadow_Huge1:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(20, 20)) end
	if SystemFont_Huge2 then SystemFont_Huge2:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(24, 24)) end
	if SystemFont_Shadow_Huge2 then SystemFont_Shadow_Huge2:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(24, 24), "OUTLINE") end
	if SystemFont_Shadow_Huge3 then SystemFont_Shadow_Huge3:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(25, 25)) end
	if SystemFont_Shadow_Outline_Huge3 then SystemFont_Shadow_Outline_Huge3:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(25, 25), "OUTLINE") end
	if SystemFont_Shadow_Huge4 then SystemFont_Shadow_Huge4:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(27, 27)) end
	if SystemFont_Shadow_Outline_Huge4 then SystemFont_Shadow_Outline_Huge4:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(27, 27), "OUTLINE") end
	if SystemFont_Outline_Huge2 then SystemFont_Outline_Huge2:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(22, 22), "OUTLINE") end
	if SystemFont_Shadow_Outline_Huge2 then SystemFont_Shadow_Outline_Huge2:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(22, 22), "OUTLINE") end
	if SystemFont_Med1 then SystemFont_Med1:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(12, 13)) end
	if SystemFont_WTF2 then SystemFont_WTF2:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(36, 64)) end
	if SystemFont_Outline_WTF2 then SystemFont_Outline_WTF2:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(36, 64), "OUTLINE") end
	if GameTooltipHeader then GameTooltipHeader:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(14, 16)) end
	if System_IME then System_IME:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(16, 16)) end
	if NumberFont_Shadow_Tiny then NumberFont_Shadow_Tiny:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(10, 10)) end
	if NumberFont_Shadow_Small then NumberFont_Shadow_Small:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(12, 12)) end
	if NumberFont_Shadow_Med then NumberFont_Shadow_Med:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(14, 14)) end
	if NumberFont_Shadow_Large then NumberFont_Shadow_Large:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(20, 20)) end
	if Tooltip_Med then Tooltip_Med:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(12, 13)) end
	if Tooltip_Small then Tooltip_Small:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(10, 12)) end
	if Game30Font then Game30Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(30, 30)) end
	if Game72Font then Game72Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(72, 72)) end
	if Game72Font_Shadow then Game72Font_Shadow:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(72, 72)) end
	if SystemFont_Outline_Small then SystemFont_Outline_Small:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(10, 12), "OUTLINE") end
	if SystemFont_Outline then SystemFont_Outline:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(13, 15), "OUTLINE") end
	if SystemFont_InverseShadow_Small then SystemFont_InverseShadow_Small:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(10, 10)) end
	if SystemFont_Huge1 then SystemFont_Huge1:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(20, 20)) end
	if SystemFont_Huge1_Outline then SystemFont_Huge1_Outline:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(20, 20), "OUTLINE") end
	if SystemFont_OutlineThick_Huge2 then SystemFont_OutlineThick_Huge2:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(22, 22), "THICKOUTLINE") end
	if SystemFont_OutlineThick_Huge4 then SystemFont_OutlineThick_Huge4:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(26, 26), "THICKOUTLINE") end
	if SystemFont_OutlineThick_WTF then SystemFont_OutlineThick_WTF:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(32, 32), "THICKOUTLINE") end
	if NumberFont_GameNormal then NumberFont_GameNormal:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(10, 12)) end
	if NumberFont_OutlineThick_Mono_Small then NumberFont_OutlineThick_Mono_Small:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(12, 11), "THICKOUTLINE,MONOCHROME") end
	if Number12Font_o1 then Number12Font_o1:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(12, 11), "OUTLINE") end
	if NumberFont_Small then NumberFont_Small:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(12, 11)) end
	if Number11Font then Number11Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(11, 10)) end
	if Number12Font then Number12Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(12, 11)) end
	if Number13Font then Number13Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(13, 12)) end
	if PriceFont then PriceFont:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(14, 14)) end
	if Number15Font then Number15Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(15, 14)) end
	if Number18Font then Number18Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(18, 17)) end
	if NumberFont_Normal_Med then NumberFont_Normal_Med:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(14, 12)) end
	if NumberFont_Outline_Med then NumberFont_Outline_Med:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(14, 12), "OUTLINE") end
	if NumberFont_Outline_Large then NumberFont_Outline_Large:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(16, 14), "OUTLINE") end
	if NumberFont_Outline_Huge then NumberFont_Outline_Huge:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(30, 20), "OUTLINE") end
	if Fancy22Font then Fancy22Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(22, 20)) end
	if QuestFont_Outline_Huge then QuestFont_Outline_Huge:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(18, 17), "OUTLINE") end
	if QuestFont_Super_Huge then QuestFont_Super_Huge:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(24, 22)) end
	if QuestFont_Super_Huge_Outline then QuestFont_Super_Huge_Outline:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(24, 22), "OUTLINE") end
	if SplashHeaderFont then SplashHeaderFont:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(24, 24)) end
	if Game11Font then Game11Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(11, 11)) end
	if Game12Font then Game12Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(12, 12)) end
	if Game13Font then Game13Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(13, 13)) end
	if Game13FontShadow then Game13FontShadow:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(13, 13)) end
	if Game15Font then Game15Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(15, 15)) end
	if Game16Font then Game16Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(16, 16)) end
	if Game18Font then Game18Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(18, 18)) end
	if Game20Font then Game20Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(20, 20)) end
	if Game24Font then Game24Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(24, 24)) end
	if Game27Font then Game27Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(27, 27)) end
	if Game32Font then Game32Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(32, 32)) end
	if Game36Font then Game36Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(36, 36)) end
	if Game42Font then Game42Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(42, 42)) end
	if Game46Font then Game46Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(46, 46)) end
	if Game48Font then Game48Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(48, 48)) end
	if Game48FontShadow then Game48FontShadow:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(48, 48)) end
	if Game60Font then Game60Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(60, 60)) end
	if Game120Font then Game120Font:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(120, 120)) end
	if Game11Font_o1 then Game11Font_o1:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(11, 11), "OUTLINE") end
	if Game12Font_o1 then Game12Font_o1:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(12, 12), "OUTLINE") end
	if Game13Font_o1 then Game13Font_o1:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(13, 13), "OUTLINE") end
	if Game15Font_o1 then Game15Font_o1:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(15, 15), "OUTLINE") end
	if QuestFont_Enormous then QuestFont_Enormous:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(30, 30)) end
	if DestinyFontMed then DestinyFontMed:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(14, 14)) end
	if DestinyFontLarge then DestinyFontLarge:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(18, 18)) end
	if CoreAbilityFont then CoreAbilityFont:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(32, 32)) end
	if DestinyFontHuge then DestinyFontHuge:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(32, 32)) end
	if QuestFont_Shadow_Small then QuestFont_Shadow_Small:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(14, 13)) end
	if MailFont_Large then MailFont_Large:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(15, 15)) end
	if SpellFont_Small then SpellFont_Small:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(10, 12)) end
	if InvoiceFont_Med then InvoiceFont_Med:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(12, 12)) end
	if InvoiceFont_Small then InvoiceFont_Small:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(10, 10)) end
	if AchievementFont_Small then AchievementFont_Small:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(10, 10)) end
	if ReputationDetailFont then ReputationDetailFont:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(10, 12)) end
	if FriendsFont_Normal then FriendsFont_Normal:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(12, 15)) end
	if FriendsFont_11 then FriendsFont_11:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(11, 14)) end
	if FriendsFont_Small then FriendsFont_Small:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(10, 13)) end
	if FriendsFont_Large then FriendsFont_Large:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(14, 17)) end
	if FriendsFont_UserText then FriendsFont_UserText:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(11, 11)) end
	if GameFont_Gigantic then GameFont_Gigantic:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(32, 38)) end
	if ChatBubbleFont then ChatBubbleFont:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(13, 15)) end
	if Fancy12Font then Fancy12Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(12, 12)) end
	if Fancy14Font then Fancy14Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(14, 14)) end
	if Fancy16Font then Fancy16Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(16, 16)) end
	if Fancy18Font then Fancy18Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(18, 18)) end
	if Fancy20Font then Fancy20Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(20, 20)) end
	if Fancy24Font then Fancy24Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(24, 24)) end
	if Fancy27Font then Fancy27Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(27, 27)) end
	if Fancy30Font then Fancy30Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(30, 30)) end
	if Fancy32Font then Fancy32Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(32, 32)) end
	if Fancy48Font then Fancy48Font:SetFont(GlobalFont.ChatFont, GlobalFont.CalculateFontSize(48, 48)) end
	if SystemFont_NamePlate then SystemFont_NamePlate:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(9, 9)) end
	if SystemFont_LargeNamePlate then SystemFont_LargeNamePlate:SetFont(GlobalFont.DefaultFont, GlobalFont.CalculateFontSize(12, 12)) end
end

GlobalFont.EventHandler = CreateFrame("Frame")
GlobalFont.EventHandler:SetScript("OnEvent", GlobalFont.Register)
GlobalFont.EventHandler:RegisterEvent("ADDON_LOADED")
