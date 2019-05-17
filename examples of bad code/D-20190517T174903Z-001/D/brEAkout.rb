require 'gosu'
class GameWindow < Gosu::Window
def initialize (width=1920, height=1080, fullscreen=true)
super
self.caption = "brEAkout"
@background = Gosu::Image.new("m.jpg")
@hardcore = Gosu::Image.new("fire.png")
@b = BottomThing.new
@ba = Ball.new
@scored = Gosu::Font.new(60)
@music = Gosu::Song.new("o.mp3")
@music.pause
@ref = 3
@score = 0

@level = 1

@br1 = Brick.new(10, 10)
@br2 = Brick.new(310, 10)
@br3 = Brick.new(610, 10)
@br4 = Brick.new(910, 10)
@br5 = Brick.new(1210, 10)
@br6 = Brick.new(1510, 10)

@br7 = Brick.new(10, 210)
@br8 = Brick.new(310, 210)
@br9 = Brick.new(610, 210)
@br10 = Brick.new(910, 210)
@br11 = Brick.new(1210, 210)
@br12 = Brick.new(1510, 210)

@br13 = Brick.new(10, 410)
@br14 = Brick.new(310, 410)
@br15 = Brick.new(610, 410)
@br16 = Brick.new(910, 410)
@br17 = Brick.new(1210, 410)
@br18 = Brick.new(1510, 410)
end

def update

if @level == 1
if @br1.vis + @br6.vis + @br2.vis + @br3.vis + @br4.vis + @br5.vis < 1
@level += 1
@ref += 1
@br1.res
@br2.res
@br3.res
@br4.res
@br5.res
@br6.res
@ba.speed
@b.oof
end
end
if @level == 2
if @br1.vis + @br6.vis + @br2.vis + @br3.vis + @br4.vis + @br5.vis + @br7.vis + @br8.vis + @br9.vis + @br10.vis + @br11.vis + @br12.vis < 1
@level += 1
@ref += 1
@br1.res
@br2.res
@br3.res
@br4.res
@br5.res
@br6.res
@br7.res
@br8.res
@br9.res
@br10.res
@br11.res
@br12.res
@ba.speed
@b.oof
end
end
if @level > 2
if @br1.vis + @br6.vis + @br2.vis + @br3.vis + @br4.vis + @br5.vis + @br7.vis + @br8.vis + @br9.vis + @br10.vis + @br11.vis + @br12.vis + @br13.vis + @br14.vis + @br15.vis + @br16.vis + @br17.vis + @br18.vis < 1
@level += 1
@ref += 1
@br1.res
@br2.res
@br3.res
@br4.res
@br5.res
@br6.res
@br7.res
@br8.res
@br9.res
@br10.res
@br11.res
@br12.res
@br13.res
@br14.res
@br15.res
@br16.res
@br17.res
@br18.res
@ba.speed
@b.oof
end
end

if @level > 4
@music.play(true)
end
if button_down?(Gosu::KbA)
@b.left
end
if button_down?(Gosu::KbEscape)
self.close
end
if button_down?(Gosu::KbD)
@b.right
end
if button_down?(Gosu::KbSpace)
@ba.go
end
if button_down?(Gosu::KbR)
@b = BottomThing.new
@ba = Ball.new
@scored = Gosu::Font.new(60)

@score = 0
@ref = 3
@level = 1
@music.pause
@br1 = Brick.new(10, 10)
@br2 = Brick.new(310, 10)
@br3 = Brick.new(610, 10)
@br4 = Brick.new(910, 10)
@br5 = Brick.new(1210, 10)
@br6 = Brick.new(1510, 10)

@br7 = Brick.new(10, 210)
@br8 = Brick.new(310, 210)
@br9 = Brick.new(610, 210)
@br10 = Brick.new(910, 210)
@br11 = Brick.new(1210, 210)
@br12 = Brick.new(1510, 210)

@br13 = Brick.new(10, 410)
@br14 = Brick.new(310, 410)
@br15 = Brick.new(610, 410)
@br16 = Brick.new(910, 410)
@br17 = Brick.new(1210, 410)
@br18 = Brick.new(1510, 410)
end

@ba.move
@ba.test

if are_touching?(@ba, @b)
@ba.reverse
end
if are_touching?(@ba, @br1)
if @br1.vis == 1
@br1.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br2)
if @br2.vis == 1
@br2.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br3)
if @br3.vis == 1
@br3.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br4)
if @br4.vis == 1
@br4.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br5)
if @br5.vis == 1
@br5.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br6)
if @br6.vis == 1
@br6.lose
@score += 100000000
@ba.reverse
end
end

if @level > 1

if are_touching?(@ba, @br7)
if @br7.vis == 1
@br7.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br8)
if @br8.vis == 1
@br8.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br9)
if @br9.vis == 1
@br9.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br10)
if @br10.vis == 1
@br10.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br11)
if @br11.vis == 1
@br11.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br12)
if @br12.vis == 1
@br12.lose
@score += 100000000
@ba.reverse
end
end
end

if @level > 2


if are_touching?(@ba, @br13)
if @br13.vis == 1
@br13.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br14)
if @br14.vis == 1
@br14.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br15)
if @br15.vis == 1
@br15.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br16)
if @br16.vis == 1
@br16.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br17)
if @br17.vis == 1
@br17.lose
@score += 100000000
@ba.reverse
end
end
if are_touching?(@ba, @br18)
if @br18.vis == 1
@br18.lose
@score += 100000000
@ba.reverse
end
end
end
def button_down(id)
if id == Gosu::KbE
if @ref > -999999
@ref -= 1
@ba.reverse
end
end

end
end

def draw

if @level > 4
@hardcore.draw(200, 130, 1)
end
@scored.draw("Score: #{@score}", 0, 0, 3)
@scored.draw("Reflects (E): #{@ref}", 1500, 1000, 3)
@scored.draw("Level: #{@level}", 1700, 0, 3)
@background.draw(0, 0, 0)
@b.draw
@ba.draw
@br1.draw
@br2.draw
@br3.draw
@br4.draw
@br5.draw
@br6.draw
if @level > 1
@br7.draw
@br8.draw
@br9.draw
@br10.draw
@br11.draw
@br12.draw
end
if @level > 2
@br13.draw
@br14.draw
@br15.draw
@br16.draw
@br17.draw
@br18.draw
end
end

def are_touching?(obj1, obj2)

obj1.x > obj2.x - obj1.w and obj1.x < obj2.x + obj2.w and obj1.y > obj2.y - obj1.h and obj1.y < obj2.y + obj2.h
end

end

class BottomThing
attr_reader :x, :y, :w, :h
def initialize
@x = 859
@y = 985
@w = 203
@h = 95
@image = Gosu::Image.new("yeah.png")
end

def draw
@image.draw(@x, @y, 1)
end

def left
@x -= 25
if @x < 0
@x = 0
end
end

def right
@x += 25
if @x > 1717
@x = 1717
end
end
def oof
@x = 859
@y = 985
end
end

class Ball
attr_reader :x, :y, :w, :h, :lives, :li, :oof
def initialize
@x = 450
@y = 500
@oof = 0
@x_velocity = 10
@y_velocity = 10
@w = 58
@h = 58
@sound_effect = Gosu::Sample.new("r.wav")
@lives = 3
@cool = 1
@life = Gosu::Image.new("baal.png")
@image = Gosu::Image.new("baal.png")
@lol = Gosu::Font.new(555)
@li = 0
@dead = Gosu::Font.new(60)
@rip = 0

end

def draw
if @oof == 0
@dead.draw("Press Space to Continue, Stay Centered",100, 800, 9)

end
if @oof == 1
if @li == 0
@image.draw(@x, @y, 1)
end
end
if @lives == 1
@life.draw(0, 1000, 2)
end
if @lives == 2
@life.draw(0, 1000, 2)
@life.draw(25, 1000, 2)
end
if @lives == 3
@life.draw(0, 1000, 2)
@life.draw(25, 1000, 2)
@life.draw(50, 1000, 2)
end

if @li > 0
@lol.draw("lol u sux", @cool, 500, 2)
@cool += 2
if @cool > 1920
@cool = -1920
end
if @rip == 0
@rip = 1
end
if @rip == 1
@dead.draw("Press R, you Skeeb", 10, 1000, 2)
@rip = 2
end
if @rip > 1
@rip += 1
end
if @rip > 20
@rip = 1
end
end
end

def test
if @lives == 0
@li = 1
@x = 5000
@y = 700
end
end
def speed
if @x_velocity < 30
@x_velocity += 1
@y_velocity += 1
@x = 900
@y = 900
@oof = 0
end
end

def go
@oof = 1
end

def move
if @oof == 1
@x = @x + @x_velocity
@y = @y + @y_velocity
if @x < 0
@x = 0
@x_velocity *= -1
end
if @x > 1862
@x = 1862
@x_velocity *= -1
end
if @y < -1
@y = 0
@y_velocity *= -1
end
if @y > 1030
@sound_effect.play
@lives -= 1
@oof = 0
@y = 900
@x = 900
end
end
end


def reverse
@y_velocity *= -1
end

end

class Brick
attr_reader :x, :y, :w, :h, :vis
def initialize(x, y)
@x = x
@y = y
@w = 300
@h = 200
@image = Gosu::Image.new("EA.png")
@vis = 1
end
def draw
if @vis == 1
@image.draw(@x, @y, 2)
end
end

def lose
if @vis == 1
@vis = 0
end
end

def res
@vis = 1
end
end

window = GameWindow.new
window.show