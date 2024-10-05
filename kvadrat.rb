require 'ruby2d'

set title: "Hello Kvadrat"

# Assign the square to an instance variable so it can be accessed later
square = Square.new(
  x: 100, y: 200,
  size: 125,
  color: 'blue',
  z: 10
)

@x_speed = 0
@y_speed = 0

# Specific key down event listener
on :key_down do |event|
  # Check which key is pressed and change the square's color accordingly
  if event.key == "q"
    square.color = "red"
  elsif event.key == "l"
    square.color = "purple"
  elsif event.key == "y"
    square.color = "green"
  elsif event.key == "a"
    @x_speed = -2
    @y_speed = 0
  elsif event.key == "d"
    @x_speed = 2
    @y_speed = 0
  elsif event.key == "space"
    @x_speed = 0
    @y_speed = 0
  elsif event.key == "w"
    @x_speed = 0
    @y_speed = -2
  elsif event.key == "s"
    @x_speed = 0
    @y_speed = 2
  end
end

update do
    square.x += @x_speed
    square.y += @y_speed
  end

set title: "Hello Triangle"

Triangle.new(
  x1: 320, y1:  50,
  x2: 540, y2: 430,
  x3: 100, y3: 430,
  color: ['red', 'green', 'blue']
)

tick = 0

update do
    square.x += @x_speed
    square.y += @y_speed
  if tick % 60 == 0
    set background: 'random'
  end
  tick += 1
end

show

# Start the Ruby2D window
show
