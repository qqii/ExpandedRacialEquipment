function init()
  isRace = nil
  isPlayer = true
  subject = entity.id()

  race = effect.getParameter("race")
  goodEffect = effect.getParameter("goodEffect")
  goodLength = effect.getParameter("goodLength")
  badEffect = effect.getParameter("badEffect")
  badLength = effect.getParameter("badLength")

  if world.isMonster(subject) then
    isPlayer = false
    sb.logWarn("Racial Stim %s was applied to a monster with id %s of type %s at pos %s by %s, this effect is player-only",
      effect.getParameter("name"), subject, world.monsterType(subject), entity.position(), effect.sourceEntity())
  elseif world.isNpc(subject) then
    isPlayer = false
    sb.logWarn("Racial Stim %s was applied to an NPC with id %s of type %s at pos %s by %s, this effect is player-only",
      effect.getParameter("name"), subject, world.npcType(subject), entity.position(), effect.sourceEntity())
  end

  if world.entitySpecies(subject) == race then
    isRace = true
  end

  if isRace then
    raceEffect()
  else
    punishEffect()
  end
end

function update(dt)
end

function raceEffect()
  status.addEphemeralEffect(goodEffect, goodLength)
end

function punishEffect()
  status.addEphemeralEffect(badEffect, badLength)
end

function uninit()
end
