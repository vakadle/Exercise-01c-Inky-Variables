/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR jersey = 0
VAR time = 25
VAR shoes = ""
VAR toilet = 0  

You have a basketball game and you have {time} minutes to get ready for the court.
+ [go to the hallway] -> hallway

=== hallway ===
You're standing in the hallway.
+ [go to the locker room] -> locker_room
+ [go to the physio room] -> physio_room
+ [check the time]
    {time >0: You have {time} minute{time > 1:s}}
    {time <=0: YOU ARE LATE!!!}
    -> hallway
+ {jersey == 1 && shoes != "" } [GO TO THE GAME COURT] -> game_court

=== locker_room ===
You're in the locker room. 
{jersey == 1: You are wearing jersey with No.15.}
{shoes != "" : You have your {shoes} shoes on}{shoes == "Nike": (nice choice).}{shoes == "Adidas": (comfortable choice).}{shoes == "UA": (are you sure?).} 
* [change into your jersey (-7min)] -> jersey_on
+ [choose your shoes (-8min)] -> shoes_selection
* [use the restroom (-??min)] -> restroom
+ [check the time]
     {time >0: You have {time} minute{time > 1:s}}
    {time <=0: YOU ARE LATE!!!}
    -> locker_room
+ [go back to the hallway] -> hallway
-> END

=== physio_room ===
You're in the physio room. 
* [get taped up your ankles (-2min)] -> taped_up
* [go for a massage (-15min)] -> massage 
+ [check the time]
     {time >0: You have {time} minute{time > 1:s}}
    {time <=0: YOU ARE LATE!!!}
    -> physio_room
+ [go back to the hallway] -> hallway
-> END

=== game_court ===
{time > 0:WOOHOO, YOU MADE IT TO THE COURT ON TIME! LET'S CRUSH THEM OUT THERE}
{time <= 0:The couch is mad at you for being late, so today you'll just be sitting on the bench.}
-> END

=== jersey_on ===
~ jersey = 1
~ time = time -7 
Great, you are ready for the game!
-> locker_room
-> END

=== restroom ===
~ toilet = RANDOM(5,15) 
~ time = time - toilet
A few pounds lighter.
-> locker_room
-> END

=== taped_up ===
~ time = time -2
You're so young, but your ankles are living in their retirement years.
-> physio_room
-> END

=== massage ===
~ time = time -15
You're living your best life, but a massage right before the game? Really?
-> physio_room
-> END

=== shoes_selection ===
~ time = time -8
Choose your shoes
+ [Nike]
~ shoes = "Nike" 
-> locker_room
+ [Adidas]
~ shoes = "Adidas" 
-> locker_room
+ [UA]
~ shoes = "UA" 
-> locker_room
-> END





