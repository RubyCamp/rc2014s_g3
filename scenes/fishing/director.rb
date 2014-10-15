require_relative "../../lib/fish/fish"
require_relative "../../lib/fish/koi"
require_relative "../../lib/fish/unagi"
require_relative "../../lib/fish/suzuki"
require_relative "../../lib/fish/ebi"
require_relative "../../lib/fish/amasagi"
require_relative "../../lib/fish/shirauo"
require_relative "../../lib/fish/shijimi"
require_relative "../../lib/fish/gomi"
require_relative "../../lib/pin/pin"
require_relative "../../lib/pin/pin2"

module Fishing
  class Director
    attr_reader :canvas, :score

    def initialize(pin, pin2)
      @canvs = RenderTarget.new(400, 400)
      @offset_x = 100
      @offset_y = 200
      @bg_img = Image.load("images/bg_img.png")
      @pin = pin
      @pin2 = pin2
      @fish_array = [Koi, Unagi, Suzuki, Ebi, Amasagi, Shirauo, Shijimi,Gomi]
      @chars = []
      5.times do
       @random_fish = @fish_array.sample
       @chars << @random_fish.new(rand(400) + 101,rand(400) + 201 , "images/" + @random_fish.to_s.downcase + ".png")
      end
      #@chars << @pin
      @font = Font.new(32, "MSゴシック", weight: true)
      @font_score = Font.new(16, "MSゴシック",weight: false)
      @timer = 60 * 30
    end

    def play
      Window.draw(0, 0, @bg_img)
      Sprite.update(@chars)
      Sprite.draw(@chars)
      @pin.update
      @pin.draw
      @pin2.update
      @pin2.draw
      Sprite.check(@pin, @chars)
      Sprite.check(@pin2, @chars)
      Sprite.clean(@chars)
      @timer -= 1
      Window.draw_font(350, 40, "TIME　#{(@timer/60).floor}", @font) 
      Window.draw_font(100,330,"点：#{@pin.score_p1}",@font_score)
      Window.draw_font(610,330,"点：#{@pin2.score_p2}",@font_score)
      if @chars.size < 5
        @random_fish = @fish_array.sample
        @chars << @random_fish.new(rand(400) + 101,rand(400) + 201 , "images/" + @random_fish.to_s.downcase + ".png")
      end
      if @timer <= 0
        Scene.set_current_scene(:result)
        @pin.x = 300
        @pin.y = 300
        @pin2.x = 500
        @pin2.y = 300
        @timer = 60 * 30
        @chars.clear
        10.times do
          @random_fish = @fish_array.sample
          @chars << @random_fish.new(rand(400) + 101,rand(400) + 201 , "images/" + @random_fish.to_s.downcase + ".png")
        end
      end
    end
    
    
  end
end