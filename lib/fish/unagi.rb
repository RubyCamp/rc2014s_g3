require_relative 'fish'

class Unagi < Fish
  def initialize(x, y, image_file)
    super(x, y, image_file)
    self.correction
  end

  def update
    self.wall
    
    case @dir
      when 1
        self.x += (rand(3) + rand(3)+ 3)
      when -1
        self.x -= (rand(4) + rand(4)+ 1)
    end
    self.y += Math.sin(self.x / 30) * 2
    self.correction
    self.y = 200 if self.y < 200
  end

end