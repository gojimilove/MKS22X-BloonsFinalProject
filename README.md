# MKS22X-BloonsFinalProject

### Project Summary
We are making a tower defense game modeled off of Bloons Tower Defense. A player tries to defend a certain place by building towers/monkeys that attack incoming enemies (balloons). There are different types of towers with different attack modes, as well as different types of enemies (some have more lives, some are faster, etc.). Killing enemies will earn you coins, which you can use to build/unlock more towers, but you also gain coins slowly as time passes. You also have a set number of lives, and every time an enemy reaches their objective, you lose a life. If you lose all of your lives, you die.

### How to Play
stuff

### Jionghao Wu
5/20/19: worked in class to make Tile and Map classes, Map fills the board with Tiles (squares) \
5/21/19: made map.txt and tried to use Scanner to read in the file and display a path, not completely working \
5/22/19: worked together to try to display the map with BufferedReader, at home hard coded the board as a backup \
5/23/19: added accessor methods to tile and map to be able to display the path tiles on the screen (worked on the same computer) \
5/24/19: worked on movement of enemy class, making sure it moves along the path \
5/25/19: worked on the same computer to figure out the movement of the enemy class once a while gets a weird error \
5/28/19: worked on learning the vectors stuff in order to figure out the shooting part of the game need to update distances between stuff every time, also added png files and fixed spawn rates for enemy \
5/29/19: created dart class and the towers shoot something, not correctly but shoots \
5/30/19: worked on shooting (together), continued working on darts since it caused a lot of lag, had many errors and exceptions \
5/31/19: shooting now pops some enemies lagging is still a problem but continue to troubleshoot \
6/3/19: figured out how to reduce the lag cause by the darts, yet there is still lag as the game proceeds\
6/4/19: adding rounds to the game, fixing the lag from oversized arraylists,adding water, adding go button, fixing spawning problems. Most towers work as they are supposed to but in the end could not fix the dart tower to shoot one dart 



### Jessica Kim
5/20/19: added interfaces Displayable and Detectable (commented out), added abstract class Thing, added classes Tile and Map, map display fills the board with tiles that have assigned colors, sizes (50x50), and direction (wasd, will do something with direction later) \
5/21/19: started writing enemy class, simple display and move methods \
5/22/19: tried using BufferedReader instead of Scanner in class (worked on the same computer), fixed it at home \
5/23/19: added accessor methods to tile and map to be able to display the path tiles on the screen (worked on the same computer), began spawning enemies that travel from tile to tile (jump) \
5/24/19: an enemy can move smoothly between tiles, a few weird errors but it can travel the entire path and is removed when it reaches the end, speed can be changed \
5/25/19: fixed errors with enemy movement, can spawn multiple but no more than 20 \
5/28/19: started working on Tower class, towers (originally black squares, now images of the monkey dart tower) spawn on the map when the player clicks on the screen, centered, and cannot be placed on the path \
5/29/19: display different kinds of towers on the side
5/30/19: worked on shooting (together), made tackTower class and variable mode that allows the player to select which tower to place \
