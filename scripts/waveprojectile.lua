require "/scripts/vec2.lua"

function init()
  self.wavePeriod = config.getParameter("wavePeriod") / (2 * math.pi)
  self.waveAmplitude = config.getParameter("waveAmplitude")

  -- change this to make them start at a better place (see graph)
  self.timer = self.wavePeriod * 0.25
  local vel = mcontroller.velocity()
  if vel[1] < 0 then
    self.waveAmplitude = -self.waveAmplitude
  end
  self.lastAngle = 0
end

function update(dt)
  self.timer = self.timer + dt
  -- square wave like
  -- local newAngle = self.waveAmplitude * math.sin(self.timer / self.wavePeriod) ^ 3 
  
  -- go in circle (rotate anticlockwise, minus numbers for clockwise), larger value = smaller circle
  -- local newAngle = self.lastAngle + 0.1

  -- change size, power of a small number makes it grow and power of a large number makes it shrink (without turning back)
  -- local newAngle = self.waveAmplitude * math.sin((self.timer ^ 0.5) / self.wavePeriod)
  
  -- squgly 8, multiplyer on the seccond waveAmp controls speed (smaller is faster, less sqigly), the divide is how swlighy (higher is more sqigly, but also slows it down)
  -- local newAngle = self.waveAmplitude * math.sin(self.timer / self.wavePeriod) + (self.waveAmplitude * 0.8) * math.sin((self.timer / self.wavePeriod) + (math.pi/4))
  
  -- more than swigly, really not sure about this one, had to add math.pi to reverse it's direction...
  -- local newAngle = self.waveAmplitude * math.sin(self.timer / self.wavePeriod) + (self.waveAmplitude * 0.9) * math.sin((self.timer / self.wavePeriod) + (math.pi/4)) + (self.waveAmplitude * 0.8) * math.sin((self.timer / self.wavePeriod) + (math.pi/5)) + math.pi
  
  -- god knows that happened?
  -- local newAngle = ((self.lastAngle % (math.pi * 2)) + self.waveAmplitude) * math.sin(self.timer / self.wavePeriod) 
  
  -- also not sure, but looks pretty cool...
  local newAngle = self.waveAmplitude * math.sin((self.lastAngle % math.pi) + self.timer / self.wavePeriod) + (self.lastAngle % math.pi) + math.pi/2 + math.pi
  
  mcontroller.setVelocity(vec2.rotate(mcontroller.velocity(), newAngle - self.lastAngle))

  self.lastAngle = newAngle
end
