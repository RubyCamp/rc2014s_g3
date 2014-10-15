class Pin2 < Sprite
  attr_accessor :score_p2
  def initialize(x,y,image_file)
    img = Image.load(image_file)
    super(x, y, img)
    @score_p2 = 0
  end
  def draw
    Window.draw(self.x, self.y, self.image)
  end
  def update
    case Input.x
      when 1
        self.x = self.x + 2 if self.x < (600 - self.image.width)
      when -1
        self.x = self.x - 2 if self.x > 200
    end

    case Input.y
      when 1
        self.y = self.y + 2 if self.y < (600 - self.image.height)
      when -1
        self.y = self.y - 2 if self.y > 200
    end
  end
  def shot(obj)
    p "Shot"
    self. point(obj.class.name)
  end

  def hit(obj)
  p "hit"
  end

  def point(r_fish)
      @got_fish = r_fish.downcase
      case @got_fish
        when "amasagi"
          @score_p2 += 10
        when "ebi"
          @score_p2 += 50
        when "koi"
          @score_p2 += 75
        when "shijimi"
          @score_p2 += 40
        when "shirauo"
          @score_p2 += 25
        when "suzuki"
          @score_p2 += 60
        when "unagi"
          @score_p2 += 120
        when "gomi"
          @score_p2 -= 100
      end
    end


end