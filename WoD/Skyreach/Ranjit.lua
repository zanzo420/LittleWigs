
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Ranjit", 1209, 965)
if not mod then return end
mod:RegisterEnableMob(75964)
mod.engageId = 1698
mod.respawnTime = 15

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		156793, -- Four Winds
		153315, -- Windwall
		165731, -- Piercing Rush
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "FourWinds", 156793)
	self:Log("SPELL_CAST_START", "Windwall", 153315)
	self:Log("SPELL_CAST_SUCCESS", "PiercingRush", 165731)
end

function mod:OnEngage()
	self:Bar(156793, 36) -- Four Winds
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:FourWinds(args)
	self:Message(args.spellId, "orange", "Warning")
	self:Bar(args.spellId, 36)
end

function mod:Windwall(args)
	self:Message(args.spellId, "red")
end

function mod:PiercingRush(args)
	self:TargetMessage(args.spellId, args.destName, "yellow", "Alarm")
end
