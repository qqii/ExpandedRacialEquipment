function init()
  animator.setParticleEmitterOffsetRegion("sparkles", mcontroller.boundBox())
end

function update(dt)
  animator.setParticleEmitterActive("sparkles", true)
  animator.setLightActive("glow", true)
  effect.setParentDirectives("fade=FFFFCC;0.03?border=2;FFFFCC20;00000000")
end

function uninit()
end
