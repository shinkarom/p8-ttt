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

cursor_x = 1
cursor_y = 1
cursor_color = 3
cursor_width = 2

function game_update()
 if btnp(⬆️) then
  cursor_y = (cursor_y-1)%3
 elseif btnp(⬇️) then
  cursor_y = (cursor_y+1)%3
 elseif btnp(⬅️) then
  cursor_x = (cursor_x-1)%3
 elseif btnp(➡️) then
  cursor_x = (cursor_x+1)%3
 elseif btnp(🅾️) then
  if grid[xy(cursor_x, cursor_y)]==empty then
   make_move(xy(cursor_x, cursor_y))
  end 
 end
end

function draw_grid()
 for i=0,2 do
  for j=0,2 do
   local x0=40+20*i
   local y0=40+20*j
   local c=grid[xy(i,j)]
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
 if human_player==red_player then
  col=red_color
  s="red"
 elseif human_player==blue_player then
  col=blue_color
  s="blue"
 else 
  col=empty_color
 end
 print("you are playing "..s,30,20,col)
end

function draw_cursor()
 local tlx = 40+20*cursor_x
 local tly = 40+20*cursor_y
 local trx = tlx+10
 local try = tly
 local blx = tlx
 local bly = tly+10
 local brx = blx+10
 local bry = bly
 --top
 rectfill(tlx-cursor_width, tly-cursor_width,
  trx+cursor_width, try, cursor_color) 
 --left
 rectfill(tlx-cursor_width ,tly,
  blx, bly+cursor_width, cursor_color)
 --bottom
 rectfill(blx, bly, brx+cursor_width, 
  bry+cursor_width, cursor_color)
 --right
 rectfill(trx, try, 
  brx+cursor_width, bry, cursor_color)
end

function game_draw()
 cls()
 draw_grid()
 draw_cursor()
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

human_player=red_player
ai_player=blue_player
player_to_move=red_player
grid={ empty,empty,empty,
 empty,empty,empty,
 empty,empty,empty }
 
function xy(x,y)
 return 3*y+x+1
end

function make_move(coord)
 grid[coord] = player_to_move
 next_player()
 if player_to_move == ai_player then
  make_move(select_ai_move())
 end
end

function next_player()
 player_to_move = (player_to_move==red_player) and
  blue_player or red_player
end

function get_empties()
 local ops = {}
 for i=1,9 do
  if grid[i]==empty then
   add(ops,i)
  end
 end
 return ops
end

function select_ai_move()
 return rnd(get_empties())
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
