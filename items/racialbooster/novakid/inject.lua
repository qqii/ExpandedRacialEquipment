function init()
  isNova = nil
  if world.entitySpecies(entity.id()) == "novakid" then
    isNova = true
  end

  if isNova then
    novakidEffect()
  else
    burnEffect()
  end
end

function update(dt)
end

function novakidEffect()
  status.addEphemeralEffect("novastim", 5)
end

function burnEffect()
  status.addEphemeralEffect("burning", 5)
end

function uninit()
end
