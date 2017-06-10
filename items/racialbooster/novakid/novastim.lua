require "/scripts/colorutil.lua"
require "/scripts/util.lua"

bodyColors = {}


function init()
  animator.setParticleEmitterOffsetRegion("sparkles", mcontroller.boundBox())
  local holder = entity.id()
  bodyColors = extractTone(holder)
  --for k, v in ipairs(bodyColors) do sb.logInfo("%s, %s", k, v) end
  dexed = hextorgb(bodyColors[2])
  hsl = rgbtohsl(dexed)
  --hsl[2] = util.lerp(1, hsl[2], 0)
  hsl[2] = hsl[2] * 0.6
  hsl[3] = 0.45
  prepGlow = hsltorgb(hsl)
  --for k, v in ipairs(dexedGlow) do sb.logInfo("%s, %s", k, v) end
  --sb.logInfo("%s, %s, %s", dexedGlow[1], dexedGlow[2], dexedGlow[3])
--  for k, v in ipairs(dexedGlow) do
--    dexedGlow[k] = dexedGlow[k] / 1.2
--  end
end

function update(dt)
  animator.setParticleEmitterActive("sparkles", true)
  animator.setLightColor("glow", {prepGlow[1], prepGlow[2], prepGlow[3]})
  animator.setLightActive("glow", true)
  effect.setParentDirectives("fade=".. bodyColors[2] ..";0.06?border=2;".. bodyColors[3] .."30;00000000")
end

function uninit()
end
