require_relative '../../lib/pin/pin'
require_relative '../../lib/pin/pin2'
module Result
  class Director
    def initialize(pin, pin2)
      @bg_img = Image.load("images/result.png")
      @font = Font.new(80) 
      @pin = pin
      @pin2 = pin2
    end

    def play
      Window.draw(0, 0, @bg_img)
      if @pin.score_p1 < @pin2.score_p2
       Window.draw_font(50, 0, "LOSER", @font)
       Window.draw_font(490, 0, "WINNER", @font) 
       elsif @pin.score_p1 > @pin2.score_p2
        Window.draw_font(50, 0, "WINNER", @font)
        Window.draw_font(490, 0, "LOSER", @font)
       else
        Window.draw_font(50, 0, "DRAW", @font)
        Window.draw_font(490, 0, "DRAW", @font)
      end 
      Window.draw_font(90, 450, "#{@pin.score_p1}", @font) 
      Window.draw_font(520, 450, "#{@pin2.score_p2}", @font) 
      Scene.set_current_scene(:start) if Input.keyPush?(K_SPACE)
    end
  end
end