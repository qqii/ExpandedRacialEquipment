function extractTone(pid)
    directives = ""
    bodyColors = {}

    local portrait = world.entityPortrait(pid, "full")
    for k, v in pairs(portrait) do
        if string.find(portrait[k].image, "body.png") then
            local body_image =  portrait[k].image
            local directive_location = string.find(body_image, "replace")
            directives = string.sub(body_image,directive_location)
        end
    end

    --bodyColor1 = string.sub(directives, 16 ,21 )
    --bodyColor2 = string.sub(directives, 30 ,35 )
    --bodyColor3 = string.sub(directives, 44 ,49 )
    --bodyColor4 = string.sub(directives, 58 ,63 )
    --sb.logInfo("%s, %s, %s, %s", bodyColor1, bodyColor2, bodyColor3, bodyColor4)

    for i = 1, 4 do
        table.insert(bodyColors, i, string.sub(directives, (16 + (14 * (i - 1))), 21 + (14 * (i - 1))))
    end
    --for k, v in ipairs(bodyColors) do sb.logInfo("%s, %s", k, v) end
    return bodyColors
end

--replace;806319=0d500f;f6b919=17dc0d;fde03f=63f574;fff8b5=c7ffdc?replace;951500=417356;be1b00=6bb383;f32200=daffe5;dc1f00=97ecb0
--Body1=BodyColor1; Body2=BodyColor2; Body3=BodyColor3; Body4=BodyColor4; Hair1=HairColor1
--len = 127
--

function hextorgb (hex)
    if string.len(hex) ~= 6 then
        sb.logWarn("Invalid Hexadecimal! @colorutil.lua")
        return
    else
        hex1 = string.sub(hex, 1, 2)
        hex2 = string.sub(hex, 3, 4)
        hex3 = string.sub(hex, 5, 6)

        redChannel = tonumber(chan1, 16)
        greenChannel = tonumber(chan2, 16)
        blueChannel = tonumber(chan3, 16)

    end
end