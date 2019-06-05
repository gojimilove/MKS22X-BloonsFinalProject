# MKS22X-BloonsFinalProject

### Project Summary
Welcome to our tower defense game! Our game is modeled off of Bloons Tower Defense. A player (you) tries to defend a certain place by building towers/monkeys that attack incoming enemies (balloons). There are different types of towers with different abilities. Killing enemies will earn you coins, which you can use to build more towers, but you also gain coins slowly as time passes. You have 5 lives, and every time an enemy reaches the end, you lose a life. If you lose all your lives, you die and the game ends.

### How to Play
You start with $500. The three different types of towers are displayed on the right hand side of the board. Click on each tower to learn more about them- price, selling price, range, etc. If a tower turns red, that means you do not have enough money to purchase it, but don't worry- you gain money as time passes. \
\
Towers:\
Dart Monkey- shoots darts individually at all enemies within its range.\
Tack Tower- shoots 8 darts at once. \
Ice Monkey- temporarily freezes enemies in its range.\
\
Click on a tower to select it, then click a square on the board where you want to place it. You cannot place towers on the path or in the pond. When you have placed all the towers you want, press GO to start the game. You will see the enemies approaching from the top left side of the map. As you kill more enemies and make more money, you can buy more towers. If you want, you can also sell your towers by right clicking on them, and you'll get 75% of the money you spent back.\
Be careful not to let the enemies reach the end of the path, because if you lose all 5 of your lives, the game ends. When you've killed all the enemies for one round, you can press GO again to begin the next round. There are 10 total rounds- if you make it to the end, you win!\
Good luck!\

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
5/29/19: displays the different kinds of towers on the side of the map \
5/30/19: display for towers also draws ellipses showing the ranges of the towers, changed mouseClicked so that left click builds and right click removes a tower, tried to remove darts when they’re out of range but it doesn’t work very well \
5/31/19: added class TackTowers, doesn’t do anything but display for now, but you can select different towers by clicking on them in the space to the right, a red rectangle indicates which tower is currently selected \
6/3/19: tried to fix enemies dying, still work in progress, added classes IceTower and SniperTower with the same display method (some issues with sniper bc of size of the image). Added global variable lives, # of lives you have is displayed on the screen and goes down if enemies reach the end. If lives reaches 0, the game ends. Worked on shoot for the ice tower, enemies freeze (turn blue and stop moving) if they are in range and tower shoots, but they don’t keep moving afterwards. \
6/4/19: worked on shoot for tack tower, shoots in 8 directions when enemies are in range and pops any balloons it comes into contact with. Also fixed shooting for ice tower, enemies unfreeze after some time. Added money variable, displayed on the top left. You start with $500, and placing towers costs money, while killing enemies, finishing rounds, and selling towers gives you money. You can’t buy a tower if it is too expensive. When selecting a tower, a short description pops up.
