require 'ruby2d'

class Crosshair
    attr_accessor :pos_y, :pos_x

    def initialize
        @image = Image.new(
            "res/crosshair.png",
            width: 60, height: 60
        )
        @pos_x = 640
        @pos_y = 360
        @image.x = @pos_x
        @image.y = @pos_y
    end

    def move(x, y)
        @pos_x += x
        @pos_y += y
        @image.x = @pos_x
        @image.y = @pos_y
    end

    def reloadGun()

    end

    def shot(duck_list)
        duck_list.each do |duck|
            if (duck.touch(@pos_x, @pos_y) == 0)
                duck_list.delete(duck)
            end
        end
        return duck_list
    end
end