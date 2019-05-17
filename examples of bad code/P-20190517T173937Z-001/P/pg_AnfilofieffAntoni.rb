require 'gosu'
system("cls")
class GameWindow < Gosu::Window
def initialize
super(1280, 720)
self.caption = "PONG"
@background = Gosu::Image.new("bg.jpg")
@music = Gosu::Song.new("bgm.mp3")
@music.play(true)
@message = Gosu::Font.new(30)
@sound_effect = Gosu::Sample.new("j.wav")
@taunt1 = Gosu::Sample.new("o.wav")
@taunt2 = Gosu::Sample.new("s.wav")
@taunt3 = Gosu::Sample.new("i.wav")
@ball = Ball.new
@paddleR = Paddle.new(1180, 400)
@paddleL = Paddle.new(100, 400)
end

def update
@ball.move
if button_down?(Gosu::KbW)
@paddleL.up
end
if button_down?(Gosu::KbS)
@paddleL.down
end
if button_down?(Gosu::KbUp)
@paddleR.up
end
if button_down?(Gosu::KbDown)
@paddleR.down
end
if are_touching?(@ball, @paddleL)
@ball.reverse
@sound_effect.play
end
if are_touching?(@ball, @paddleR)
@ball.reverse
@sound_effect.play
end

end

def draw
@message.draw("Esc to Exit   TAUNTS: T1: Q  T2: Space  T3: 0  UNPAUSE MUSIC: E",1, 1, 2)
@ball.draw
@paddleR.draw
@paddleL.draw
@background.draw(0, 0, 0)
end

def button_down(id)
if id == Gosu::KbSpace
@music.pause
@taunt1.play
end
if id == Gosu::KbQ
@music.pause
@taunt2.play
end
if id == Gosu::Kb0
@music.pause
@taunt3.play
end
if id == Gosu::KbE
@music.play
end
if id == Gosu::KbEscape
self.close
end	
end
		

def are_touching?(obj1, obj2)
obj1.x > obj2.x - obj1.width and obj1.x < obj2.x + obj2.width and obj1.y > obj2.y - obj1.height and obj1.y < obj2.y + obj2.height
end


end

class Paddle
attr_reader :x, :y, :width, :height
def initialize(x, y)
@x = x
@y = y
@y_velocity = 0
@width = 25
@height = 279
@image = Gosu::Image.new("pp.png")
end

def draw
@image.draw(@x, @y, 1)
end


def up
@y -= 10
if @y < 0
@y = 0
end
end

def down
@y += 10
if @y > 501
@y = 501
end
end

end

class Ball
attr_reader :x, :y, :width, :height
def initialize
@x = 100
@y = 500
@x_velocity = 15
@y_velocity = 15
@width = 196
@height = 196
@stop = 0
@image = Gosu::Image.new("bb.png")
@point = Gosu::Sample.new("l.wav")
@sfx = Gosu::Sample.new("m.wav")
@scoreL = Gosu::Font.new(60)
@scoreR = Gosu::Font.new(60)
@score1 = 0
@score2 = 0

end

def draw
@image.draw(@x, @y, 1)
@scoreL.draw("P1: #{@score1}",50, 50, 2)
@scoreR.draw("P2: #{@score2}",1070, 50, 2)
if @score1 == 20
@scoreL.draw("Player 1 wins!",50, 100, 1)
end

if @score2 == 20
@scoreR.draw("Player 2 wins!",50, 100, 1)
end

if @score1 > 1000
@scoreL.draw("Player 1 ATCUALLY wins!",50, 100, 1)
if @stop == 0
@stop = 1
@sfx.play
end
end

if @score2 > 1000
@scoreR.draw("Player 2 ACTUALLY wins!",50, 100, 1)
if @stop == 0
@stop = 1
@sfx.play
end
end

end


def move
if @stop == 0
@x = @x + @x_velocity
@y = @y + @y_velocity



if @y > 720
@y_velocity *= -1
end

if @x > 1180
@x_velocity *= -1
@x = 550
@y = 350
@score1 += 1

@point.play
if @x_velocity < 0
@x_velocity -= 1
end
if @y_velocity < 0
@y_velocity -= 1
end
if @x_velocity > 0
@x_velocity += 1
end
if @y_velocity > 0
@y_velocity += 1
end
end

if @y < 0
@y_velocity *= -1
end

if @x < 0
@x_velocity *= -1
@x = 550
@y = 350
@score2 += 1
@point.play
if @x_velocity < 0
@x_velocity -= 1
end
if @y_velocity < 0
@y_velocity -= 1
end
if @x_velocity > 0
@x_velocity += 1
end
if @y_velocity > 0
@y_velocity += 1
end
end
end
end

def reverse
@x_velocity *= -1
end

end

window = GameWindow.new
window.show
