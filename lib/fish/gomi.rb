require_relative 'fish'

class Gomi < Fish
  def initialize(x, y, image_file)
    super(x, y, image_file)
    self.correction
  end

  def update
    dir = rand(3) - 1
    if self.x < 200
      self.x = 200
      dir = 98
    end
    
    if self.x > 570
      self.x = 570
      dir = 98
    end
    
    case dir
      when 0..1
        self.x += (rand +1)
      when -1
        self.x -= (rand + 1)
      else
        self.y += 1
    end
    
    self.correction
    
    if Input.mousePush?(M_LBUTTON)
      self.hit(self)
    end
    
  end
  
end