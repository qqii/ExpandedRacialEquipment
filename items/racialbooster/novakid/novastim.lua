require "/scripts/colorutil.lua"
require "/scripts/util.lua"

bodyColors = {}


function init()
  animator.setParticleEmitterOffsetRegion("sparkles", mcontroller.boundBox())
  local holder = entity.id()
  bodyColors = extractTone(holder)
  --for k, v in ipairs(bodyColors) do sb.logInfo("%s, %s", k, v) end
  dexedGlow = hextorgb(bodyColors[2])
  --for k, v in ipairs(dexedGlow) do sb.logInfo("%s, %s", k, v) end
  --sb.logInfo("%s, %s, %s", dexedGlow[1], dexedGlow[2], dexedGlow[3])
--  for k, v in ipairs(dexedGlow) do
--    dexedGlow[k] = dexedGlow[k] / 1.2
--  end
end

-- determine largest of R, G, B
-- largest - second = LSdiff
-- largest - third = LTdiff
-- determine largest diff
-- largest diff - smaller diff = ratio of diff
-- LSdiff / (2 - ratio)  = LSsplitdiff
-- LTdiff / (2 - raito) = LTsplitdiff


function update(dt)
  animator.setParticleEmitterActive("sparkles", true)
  animator.setLightColor("glow", {dexedGlow[1], dexedGlow[2], dexedGlow[3]})
  animator.setLightActive("glow", true)
  effect.setParentDirectives("fade=".. bodyColors[2] ..";0.06?border=2;".. bodyColors[3] .."30;00000000") --"fade=FFFFCC;0.03?border=2;FFFFCC20;00000000"
end

function uninit()
end
