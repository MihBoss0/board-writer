local BoardWriter, super = Class(Object)

function BoardWriter:init(text, x, y, width, height, options)
    
    super.init(self, x, y, width, height)
    self:setParallax(0, 0)

    options = options or {}

    self.useTween = options["useTween"] or false
    self.auto = options["auto"] or false

    if options["useFX"] == true then self:addFX(BoardFX(1)) end

    self.text = DialogueText("[voice:txt_board]" .. text, 10, 10, width - 20, height - 20, { font = "8bit" })
    self.text.can_advance = true
    self.text.should_advance = true

    if self.auto then self.text.skippable = false else self.text.skippable = true end

    self.arrow = Sprite("ui/flat_arrow_down", width - 32, height - 26)
    self.arrow:setScale(2, 2)

    self.arrow.visible = false

    if self.useTween then
        
        Assets.playSound("board_lift")

        self.box = Rectangle(0, 144, width, height)
        self.box:setColor({0, 0, 0})

        self:addChild(self.box)

        Game.world.timer:tween(1/2, self.box, { y = 0 }, "linear", function () self.box.y = 0 end)

        Game.world.timer:after(1/3, function ()

            self.box:addChild(self.text)
            self.box:addChild(self.arrow)

        end)

    else

        self.box = Rectangle(0, 0, width, height)
        self.box:setColor({0, 0, 0})

        self:addChild(self.box)

        self.box:addChild(self.text)
        self.box:addChild(self.arrow)

    end

    self.done = false
    self.shownArrow = false
    self.startedTimer = false

end

function BoardWriter:update()
    
    super.update(self)

    if not self.arrow.visible and not self.shownArrow then
        
        if not self.text:isTyping() then
            
            if not self.auto then
                
                self.arrow.visible = true
                self.shownArrow = true
                Assets.playSound("board_end")

            end

        end

    end

    if not self.text:isTyping() and not self.startedTimer then

        if not self.auto then
            
            Game.world.timer:every(1, function () self.arrow.visible = not self.arrow.visible end)
            self.startedTimer = true

        end

    end

    if not self.text:isTyping() then
        
        if not self.auto then
            
            if Input.pressed("confirm") or Input.down("menu") then
            
                self.done = true

            end

        else

            self.done = true
            
        end

    end

end

function BoardWriter:isDone() return self.done end

return BoardWriter