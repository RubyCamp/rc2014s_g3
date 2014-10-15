class Pin < Sprite
  attr_accessor :score_p1
  def initialize(x,y,image_file)
    img = Image.load(image_file)
    super(x, y, img)
    @score_p1 = 0
  end
  def draw
    Window.draw(self.x, self.y, self.image)
  end
  def update
    
    self.x += 2 if Input.keyDown?(K_D) && self.x < (600 - self.image.width)
    self.x -= 2 if Input.keyDown?(K_A) && self.x > 200
    self.y -= 2 if Input.keyDown?(K_W) && self.y > 200
    self.y += 2 if Input.keyDown?(K_S) && self.y < (600 - self.image.height)
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
          @score_p1 += 10
        when "ebi"
          @score_p1 += 50
        when "koi"
          @score_p1 += 75
        when "shijimi"
          @score_p1 += 40
        when "shirauo"
          @score_p1 += 25
        when "suzuki"
          @score_p1 += 60
        when "unagi"
          @score_p1 += 120
        when "gomi"
          @score_p1 -= 100
      end
    end
  
end