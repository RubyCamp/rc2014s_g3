﻿require_relative 'fish'

class Ebi < Fish
  def initialize(x, y, image_file)
    super(x, y, image_file)
    self.correction
    @switch = 1
  end

  def update
    self.wall
    
    case @dir
      when 1
        self.x += 3
        self.y -= 1 if @switch == 1
        self.y += 1 if @switch == -1
      when -1
        self.x -= 3
        self.y -= 1 if @switch == 1
        self.y += 1 if @switch == -1
    end
    @switch = -1 if self.y < 200
    @switch = 1 if self.y > (Window.height - self.image.height)
  end
end