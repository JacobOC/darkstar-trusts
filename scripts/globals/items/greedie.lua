-----------------------------------------
-- ID: 4500
-- Item: greedie
-- Food Effect: 5Min, Mithra only
-----------------------------------------
-- Dexterity 1
-- Mind -3
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
	if (target:getRace() ~= 7) then
		result = 247;
	end
	if (target:getMod(MOD_EAT_RAW_FISH) == 1) then
		result = 0;
	end
	if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,300,4500);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_DEX, 1);
	target:addMod(MOD_MND, -3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_DEX, 1);
	target:delMod(MOD_MND, -3);
end;
