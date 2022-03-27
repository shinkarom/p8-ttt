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

function game_draw()
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
