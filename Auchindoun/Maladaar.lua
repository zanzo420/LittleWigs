﻿------------------------------
--      Are you local?      --
------------------------------

local boss = BB["Exarch Maladaar"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local db = nil
local fmt = string.format

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Maladaar",

	soul = "Stolen Soul",
	soul_desc = "Warn for Stolen Souls",
	soul_message = "A soul has been stolen!",
	soul_message_new = "%s's soul stolen!",

	avatar = "Avatar of the Martyred",
	avatar_desc = "Warn for the summoning of the Avatar of the Martyred",
	avatar_message = "Avatar of the Martyred spawning!",
} end )

L:RegisterTranslations("koKR", function() return {
	soul = "잃어버린 영혼 ",
	soul_desc = "잃어버린 영혼에 대한 경고",
	soul_message = "잠시후 영혼을 훔칩니다!",

	avatar = "순교자의 화신",
	avatar_desc = "순교자의 화신 소환 경고",
	avatar_message = "순교자의 화신 소환!",
} end )

L:RegisterTranslations("zhTW", function() return {
	soul = "偷取的靈魂",
	soul_desc = "主教瑪拉達爾施放靈魂偷取時發出警報",
	soul_message = "隊友靈魂被偷取，速度擊殺!",
	soul_message_new = "%s 的靈魂被偷取!",

	avatar = "馬丁瑞德的化身",
	avatar_desc = "召喚馬丁瑞德的化身時發出警報",
	avatar_message = "馬丁瑞德的化身出現!",
} end )

L:RegisterTranslations("frFR", function() return {
	soul = "Âme volée",
	soul_desc = "Préviens quand une âme est volée.",
	soul_message = "Une âme a été volée !",

	avatar = "Avatar du martyr",
	avatar_desc = "Préviens quand l'Avatar du martyr est invoqué.",
	avatar_message = "Avatar du martyr invoqué !",
} end )

L:RegisterTranslations("zhCN", function() return {
	soul = "被偷走的灵魂",
	soul_desc = "被偷走的灵魂警报",
	soul_message = "队友灵魂被偷取! 速度击杀!!",

	avatar = "殉难者的化身",
	avatar_desc = "召唤殉难者的化身发出警报",
	avatar_message = "殉难者的化身出现! MT顶啊~~~~",
} end )

L:RegisterTranslations("deDE", function() return {
	soul = "Gestohlene Seele",
	soul_desc = "Warnt vor gestohlener Seele",
	soul_message = "Seele gestohlen!",

	avatar = "Avatar des Gemarterten",
	avatar_desc = "Warnt vor der Avatar Beschw\195\182rung",
	avatar_message = "Avatar beschworen!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.partyContent = true
mod.otherMenu = "Auchindoun"
mod.zonename = BZ["Auchenai Crypts"]
mod.enabletrigger = boss 
mod.toggleoptions = {"soul", "avatar", "bosskill"}
mod.revision = tonumber(("$Revision$"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:AddCombatListener("SPELL_AURA_APPLIED","Soul", 32346)
	--self:AddCombatListener("SPELL_CAST_START","Avatar", 32346) -- Can't find the spellId for this on wowhead
	self:AddCombatListener("UNIT_DIED", "GenericBossDeath")

	db = self.db.profile
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:Soul(player)
	if db.soul then
		self:Message(fmt(L["soul_message_new"], player), "Attention")
	end
end

function mod:Avatar()
	if db.avatar then
		self:Message(L["avatar_message"], "Attention")
	end
end
