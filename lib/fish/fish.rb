class Fish < Sprite
  attr_accessor :score

  def initialize(x, y, image_file)
    img = Image.load(image_file)
    img.set_color_key([0, 0, 0])
    @dir = 1
    super(x, y, img)
  end

  def wall
    if self.x < 200
      self.x = 200
      @dir = 1
    end
    
    if self.x > (Window.width-self.image.width-200)
      self.x = (Window.width-self.image.width-200)
      @dir = -1
    end
  end

  def hit(obj)
    p "hit: #{self.class}"
    self.vanish
  end
  def shot(obj)
   p "shot: #{self.class}"
  end
  def draw
    Window.draw(self.x, self.y, self.image)
  end
  
  def correction
    self.y = (Window.height - self.image.height) if self.y > (Window.height - self.image.height)
  end
  
end