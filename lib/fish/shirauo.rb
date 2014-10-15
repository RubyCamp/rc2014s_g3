require_relative 'fish'

class Shirauo < Fish
  def initialize(x, y, image_file)
    super(x, y, image_file)
    self.correction
  end

  def update
    self.wall
    
    case @dir
      when 1
        self.x = self.x + (rand(10) + 1)
      when -1
        self.x -= (rand(10) + 1)
    end
  end


end