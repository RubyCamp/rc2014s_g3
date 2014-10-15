require_relative 'fish'

class Koi < Fish
  def initialize(x, y, image_file)
    super(x, y, image_file)
    self.correction
  end

  def update
    self.wall
    
    case @dir
      when 1
        self.x += (rand(3) + rand(3)+ 2)
      when -1
        self.x -= (rand(4) + rand(4)+ 2)
    end
    self.y += Math.sin(self.x / 38) * 6
    self.y = 200 if self.y < 200
    self.correction
  end

end