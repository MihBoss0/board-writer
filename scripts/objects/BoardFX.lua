local BoardFX, Super = Class(FXBase)

Kristal.Shaders["RGBSeparate"] = love.graphics.newShader [[
    // jangsy5 code
    extern number shift = 20;
    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords)
        {
        vec2 tc = texture_coords;
        vec2 scale = vec2(1.0/800.0, 1.0/600.0);
        vec4 r = Texel(texture, vec2(tc.x - shift * scale.x, tc.y));
        vec4 g = Texel(texture, vec2(tc.x, tc.y));
        vec4 b = Texel(texture, vec2(tc.x + shift * scale.x, tc.y));
        number a = r.a+g.a+b.a / 3.0;

        return vec4(r.r, g.g, b.b, a);
    }
]]

function BoardFX:init(Shift, Priority)
    
    Super.init(self, Priority or 0)
    self.shift = Shift or 4

end

function BoardFX:draw(Texture)
    
    local LastShader = love.graphics.getShader()
    local Shader = Kristal.Shaders["RGBSeparate"]

    love.graphics.setShader(Shader)
    Shader:send("shift", self.shift)

    Draw.drawCanvas(Texture)

    love.graphics.setShader(LastShader)

end

return BoardFX