VAR time_reversed = false
VAR survival_points = 3
VAR survivors_saved_count = 0
VAR reactor_status = "unstable"
VAR guilt_level = 0
VAR keycard_found = false
VAR experiment_known = false
VAR weapon_found = false
VAR creature_encountered = false
VAR creature_health = 3
VAR reactor_stabilized = false


The lab is crumbling. The dim emergency lights flicker, casting erratic shadows on the walls. Sirens blare, and a computerized voice drones: **"Reactor core unstable. Evacuate immediately."**

You clutch a battered journal, its torn pages hinting at forbidden experiments. Around you, the sterile lab is a battlefield—overturned desks, shattered glass, and the acrid stench of smoke. Blood smears the tiles, but no bodies remain.  

What do you do first?
+ [Search the lab for supplies.] -> search_area
+ [Head toward the control room.] -> head_control_room_intro
+ [Ignore everything and run for the exit.] -> hallway_intro_exit
+ [Look for survivors.] -> hallway_intro_survivors

=== search_area ===
You scavenge the lab for anything that could help. The shelves are mostly empty, their contents looted or destroyed in the chaos.  

{weapon_found == false:
    Among the wreckage, you spot a **metal pipe**. It’s not much, but it’s better than nothing.  
    Do you take it?
    + [Yes, take it.] -> found_weapon
    + [No, leave it.] -> leave_weapon
-else:
    You already found a metal pipe earlier. Its weight is reassuring in your hands.  
    -> choice_after_search
}

=== found_weapon ===
*You grab the pipe and grip it tightly, feeling a little safer.*  
~ weapon_found = true  
-> choice_after_search

=== leave_weapon ===
*You decide to leave it behind, trusting speed over strength.*  
-> choice_after_search

=== choice_after_search ===
A loud crash echoes down the hall, followed by an inhuman screech.  

Where do you go next?
+ [Head toward the control room.] -> head_control_room_intro
+ [Search for survivors.] -> hallway_intro_survivors
+ [Run for the exit.] -> hallway_intro_exit

=== head_control_room_intro ===
The corridor to the control room stretches ahead, lit only by flickering red lights. The floor is littered with scattered papers, empty shell casings, and streaks of blood leading to nowhere.  

The distant sound of machinery groans ominously, and a faint chemical smell clogs your nostrils.  

Do you proceed cautiously or rush toward the room?  
+ [Proceed cautiously.] -> hallway_detailed_control
+ [Rush forward.] -> hallway_quick_control

=== hallway_detailed_control ===
You tread carefully, each step echoing in the empty hallway. Your eyes dart to every shadow, half-expecting something to leap out.  
Eventually, you reach the control room door. It’s ajar, and the flickering lights inside reveal a room in chaos.

-> control_room_enter

=== hallway_quick_control ===
Your hurried footsteps seem deafening in the silence. The oppressive air presses against your chest, but nothing stops your advance.  
Ahead, the control room door looms open, its interior lit by emergency monitors.  

-> control_room_enter

=== control_room_enter ===
The control room is in chaos. Consoles blink with warnings: **"Reactor Core Critical."**  

On a nearby desk, a **keycard** gleams faintly under the red emergency lights.  

{keycard_found == false:
    Do you take the keycard?  
    + [Yes, take it.] -> found_keycard
    + [No, leave it.] -> leave_keycard
-else:
    You already picked up the keycard earlier. Its reassuring weight reminds you of your slim chances.  
    -> control_decision
}

=== found_keycard ===
*You pocket the keycard, hoping it will come in handy later.*  
~ keycard_found = true  
-> control_decision

=== leave_keycard ===
*You decide the keycard isn’t worth it and turn back to the room.*  
-> control_decision

=== control_decision ===
The reactor terminal hums softly, its cracked screen displaying a series of options.  

What do you do next?
+ [Try to stabilize the reactor.] -> stabilize_reactor
+ [Abandon the reactor and flee.] -> hallway_intro_exit

=== stabilize_reactor ===
You frantically type into the console, ignoring the sweat dripping into your eyes.  

{keycard_found:
    The keycard grants you access to advanced controls. You stabilize the reactor, buying precious time.  
    ~ reactor_stabilized = true  
    -> stabilize_success
-else:
    Without the keycard, the reactor remains unstable. Time is running out.  
    -> stabilize_fail
}

=== stabilize_success ===
The alarms quiet, and the reactor stabilizes. A deep, unsettling growl echoes from deeper in the facility.  

What do you do next?
* [Serch the console for any information] -> console_logs
+ [Search for survivors.] -> hallway_intro_survivors
+ [Run for the exit.] -> hallway_intro_exit

=== console_logs ===
While going through the computer console to find any information about the situation about the facility you are in you find Document 2

+ [Read Document 2] -> Document_2
+ [Continue the search for salvation] -> stabilize_success

===Document_2===
The console pulls up a document log that says this:
Document 2 
 June 5th 205X
Something has been going wrong with the tests. The subjects seem to be doing fine with the serum at first, been then weeks later they seem to... change. I cannot explain how, but it is as if they are trapped inside their bodies, only leaving the husk behind and adopting something beyond, something... beastly. We have explained it to the higher ups, but they only seem to ensure us that the process is arduous and that this is the price for our ultimate goal. I cannot fathom what is happening inside their minds, but I pray that it ends soon, and that all this time and effort is worth it.
+ [Continue the search for salvation] -> stabilize_success

=== stabilize_fail ===
*The reactor is beyond saving. You have no choice but to run.*  
-> hallway_intro_exit

=== hallway_intro_survivors ===
The hallways stretch endlessly, their silence broken only by distant crashes and faint screams. Bloodied handprints smear the walls, and an abandoned shoe sits inexplicably in the middle of the path.  

Your voice trembles as you call out. A faint, trembling response leads you to a group of survivors huddled in a corner, their faces pale and streaked with tears.  

Do you lead them to safety?
+ [Yes, guide them.] -> guide_survivors
+ [No, leave them behind.] -> leave_survivors

=== guide_survivors ===
*You lead the group toward the exit. Their gratitude lifts your spirits, but every step feels like a gamble.*  
~ survivors_saved_count += 1  
-> hallway_intro_exit

=== leave_survivors ===
*You turn away, guilt tugging at your conscience, but your survival feels more certain without them.*  
~ guilt_level += 1  
-> hallway_intro_exit

=== hallway_intro_exit ===
As you move through the hallways, the sound of heavy footsteps grows closer. Shadows twist and stretch unnaturally, and your breath comes in short gasps.  

Suddenly, a grotesque creature steps into the flickering light, its eyeless face twisting as it sniffs the air.  

{weapon_found:
    You clutch your metal pipe tightly, ready to defend yourself.  
    -> combat
-else:
    You have nothing to fight with. Your only choice is to run.  
    -> pure_escape
}

=== combat ===
The creature lunges at you, its claws scraping against the walls.  

{creature_health > 0:
    Do you strike or retreat?
    + [Strike!] -> combat_continue
    + [Retreat!] -> pure_escape
-else:
    *With one final blow, the creature collapses. You breathe heavily, victorious but shaken.*  
    -> escape_attempt
}

=== combat_continue ===
You swing your weapon, the impact jarring your arms. The creature screeches, wounded but not yet defeated.  
~ creature_health -= 1  
{creature_health > 0:
    -> combat
-else:
    -> escape_attempt
}

===escape_attempt===
The Facility's door is shut tight, it wont budge

+ [Find a way to open it] -> console_search

===console_search===
running through out then facility you found a branch in you path.

* [Go down the stairs in front of you] -> second_floor
* [Go right down the hallway] -> Overseer

===Overseer===
In the Overseer's room you see pile of documents and files strew about. There is also a desk with more documents and a console.

* [find a way to open the facilty door] -> Overseer_console
* [Search for more information] -> Document_1

===Overseer_console===
The Overseer's computer console doesnt allow you to open the front door with out a password.
* [find another way to open the facilty door] -> console_search

===Document_1===
The console pulls up a document log that says this:
Document 1
 August 16th, 205X
The subjects have arrived, they seem younger than the last but still look capable of handling the procedure. There seems to be a new batch of candidates every other month, with some looking as though they were just dragged right out of there beds in the middle of the night, dazed and wondering where and what they are. That is not my job unfortunately to question their upbringing or what they were before, with us on the cuspis of this research. If everything goes well the data we have discovered the next stage of evolution for humans, bring us ever closer to humanity achieving a greater form.

* [continue to find a way to open the facilty door] -> console_search

===second_floor===
Going down the stairs you see a mass of bodies, what ever this facility was doing it was met with a grewsome fate.
+ [search for working consoles] -> second_floor_console

===second_floor_console===
on the search for a functioning console you see multiple consoles destroyed beyond salvage others are drenched in blood. Continuing on you find 3 consoles untouched 

+ [Left Console] -> Left_console
+ [Center Console] -> Center_console
+ [Right Console] -> Right_console

===Left_console===
The console pulls up a document log that says this:
Document 3
 November 20th 205X
We have successfully contained the monstrosity and are now examining it thoroughly. This is not what I wanted happen, hells I do not even know what I wanted to happen, but to think that this might be the outcome, I... do not wish to continue with this experiment, but unfortunately that is not my decision. many other scientists share my same sentiment as well, but I'm afraid what would happen if we do try to leave, there's now what we'll be able to live normal lives after all of this. We know to much and if this were to get out to the public... no I cannot think about any of that, I must see this through to the end, at any cost.

[Go to the Center console] -> Center_console
[Go to the Right console] -> Right_console

===Center_console===
This console already has the facility door command promt open ready to open it.

[Do you open the Facilty door] -> victory_escape
or
[Do you go to the Right Console] -> Right_console

===Right_console===
This console has ONE protocol. and it is clear what it is. To end the Facility all together and seal it permanently
If you go through with this protocol you will be locked in here with any other possible survivors and horrors. Are you sure you want to protect the world
[Yes] -> Saviors_Ending
[No, look at the other consoles] -> Center_console

===Saviors_Ending===
You made the ultimate sacrifice and it came with the biggest cost. Your own life. Almost right away when you click the console buttom you heard explosions. The front of the Facility has been demolished and destroyed. There is no longer a chance on escaping. This is where you will die, but you saved everyon outside the facility
-> END

=== pure_escape ===
*You sprint past the creature, its claws narrowly missing you. The exit looms ahead.*  
-> END

=== victory_escape ===
*The Facility Door echos throught the facility, You Run to it. as soon as you reach it you are able to see the blinding light of the world scarred and exhausted*  
-> END

=== bad_ending ===
*The creature overtakes you. Your vision fades to black as its claws tear through you.*  
-> END