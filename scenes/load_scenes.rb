require_relative 'start/director'
require_relative 'fishing/director'
require_relative 'result/director'
pin = Pin.new(300,300 , "images/pin.png")
pin2 = Pin2.new(500,300 , "images/pin.png")
Scene.add_scene(Start::Director.new(pin, pin2), :start)
Scene.add_scene(Fishing::Director.new(pin, pin2), :fishing)
Scene.add_scene(Result::Director.new(pin, pin2), :result)