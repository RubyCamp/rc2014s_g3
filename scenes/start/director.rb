module Start
  class Director
    def initialize(pin, pin2)
      @pin = pin
      @pin2 = pin2
      @bg_img = Image.load("images/start.png")
    end

    def play
      Window.draw(0, 0, @bg_img)
      Scene.set_current_scene(:fishing) if Input.keyPush?(K_SPACE)
      @pin.score_p1 = 0
      @pin2.score_p2 = 0
    end
  end
end