pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
--tic-tac-toe
--shinkarom

function _init() menu_init() end

function _update() update() end

function _draw() draw() end
-->8
--main menu

function menu_init()
 update=menu_update
 draw=menu_draw
end

function menu_update()
 if btnp(4) then game_init() end
end

function menu_draw()
 cls()
 print("red",30,30, 8)
 print("vs",40,40,6)
 print("blue",50,50,12)
 print("tic-tac-toe",25,60,6)
 
 print("press z to start game", 10, 100,6)
end
-->8
--game screen

function game_init()
 update=game_update
 draw=game_draw
end

function game_update()
end

function draw_grid()
 for i=1,3 do
  for j=1,3 do
   local x0=40+20*(i-1)
   local y0=40+20*(j-1)
   local c=cell(i,j)
   if c==red_player then
    col=red_color
   elseif c==blue_player then
    col=blue_color
   else
    col=empty_color
   end
   rectfill(x0,y0,x0+10,y0+10,col)
  end
 end
end

function draw_player()
 if player_to_move==red_player then
  col=red_color
  s="red"
 elseif player_to_move==blue_player then
  col=blue_color
  s="blue"
 else 
  col=empty_color
 end
 print("you are playing "..s,30,20,col)
end

function game_draw()
 cls()
 draw_grid()
 draw_player()
end
-->8
--game logic
empty=0
red_player=1
blue_player=2
empty_color=6
red_color=8
blue_color=12

player_to_move=red_player
grid={ empty,empty,empty,
 empty,empty,empty,
 empty,empty,empty }
 
function cell(x,y)
 return grid[3*(y-1)+x]
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
