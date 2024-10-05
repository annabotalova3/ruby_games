require 'ruby2d'

set title: "Whack a ruby", background: "black"

@score = 0

@ruby = Sprite.new(
    'images/ruby-sprite.png',
    clip_width: 234,
    time: 30,
    height:  192,
    width:  234,
    loop: false
)

@score_text = Text.new("Score: #{@score}", size: 50)

tick = 0

on :mouse_down do |event|
    if @ruby && @ruby.contains?(event.x,event.y)
        increase_score
    end
end

update do
    if @score >= 15
       finish_game
    else
      if tick % 6 == 0
        @ruby.x = Random.rand(Window.width - @ruby.width)
        @ruby.y = Random.rand(Window.height - @ruby.height)
    end
    tick += 1
  end
end

def increase_score
    @score += 1
    @score_text.text = "Score: #{@score}"
    @ruby.play
end

def finish_game
    @ruby.remove
    Text.new('Game over! You won!')
end

show