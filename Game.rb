require 'ruby2d'
require './Duck.rb'
require './Crosshair.rb'

class Game
    def initialize()
        @timer_start = Time.now
        @duck_list = [Duck.new]
        @crosshair = Crosshair.new
    end

    def mainLoop()
        @duck_list.each do |duck|
            duck.move
            if (duck.escape == 0)
                @duck_list.delete(duck)
            end
        end
        addDuckList
    end

    def addDuckList()
        if (Time.now - @timer_start > 2)
            @duck_list.push(Duck.new)
            @timer_start = Time.now
        end
    end

    def inputHeld(event)
        if (event.key == "down" && @crosshair.pos_y < 720)
            @crosshair.move(0, 7)
        elsif (event.key == "up" && @crosshair.pos_y > 0)
            @crosshair.move(0, -7)
        elsif (event.key == "right" && @crosshair.pos_x < 1280)
            @crosshair.move(7, 0)
        elsif (event.key == "left" && @crosshair.pos_x > 0)
            @crosshair.move(-7, 0)
        end
    end

    def inputDown(event)
        if (event.key == "space")
            @duck_list = @crosshair.shot(@duck_list)
        end
    end
end