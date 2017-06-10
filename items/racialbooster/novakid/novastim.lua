require "/scripts/colorutil.lua"

bodyColors = {}

function init()
  animator.setParticleEmitterOffsetRegion("sparkles", mcontroller.boundBox())
  local holder = entity.id()
  bodyColors = extractTone(holder)
  --for k, v in ipairs(bodyColors) do sb.logInfo("%s, %s", k, v) end
end

function update(dt)
  animator.setParticleEmitterActive("sparkles", true)
  animator.setLightColor("glow", {99,245,11})
  animator.setLightActive("glow", true)
  effect.setParentDirectives("fade=".. bodyColors[2] ..";0.06?border=2;".. bodyColors[3] .."30;00000000") --"fade=FFFFCC;0.03?border=2;FFFFCC20;00000000"
end

function uninit()
end
