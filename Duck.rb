require 'ruby2d'

class Duck
    def initialize()
        @sprite = Sprite.new(
            "res/duck.png",
            clip_width: 60,
            time: 300,
            loop: true
        )
        @pos_x = 0
        @pos_y = Random.rand(500)
        @sprite.x = @pos_x
        @sprite.y = @pos_y
        @speed = Random.rand(6) + 2
        @sprite.play
    end

    def move()
        @pos_x += @speed
        @sprite.x = @pos_x
    end

    def escape()
        if (@pos_x > 1340)
            @sprite.remove
            return 0
        end
        return 1
    end

    def touch(x, y)
        if (x > @pos_x - 25 && x < @pos_x + 25 && y > @pos_y - 25 && @pos_y + 25)
            @sprite.remove
            return 0
        end
        return 1
    end
end