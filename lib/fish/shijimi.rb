require_relative 'fish'

class Shijimi < Fish
  def initialize(x, y, image_file)
    super(x, y, image_file)
    self.correction
    if self.x < 200
      self.x = 200 + rand(60)
    elsif self.x > (Window.width - 200)
      self.x = (Window.width - 200) - rand(60)
    end
  end

  def update
    self.y += 1.5 if self.y < 570
  end

end