#!/bin/bash

# Here you can declare the variables that will be changed in your script
# ---------------

waterDrinker=$1

# ---------------

# Chooses a random number, creates a folder for the specific script, generates an empty file for the script
file_n=$RANDOM
mkdir $file_n
touch $file_n/script.sh
script_n=$file_n/script.sh

# Variables for the script header
userName=$USER
day="$(date)"

# Writing the code to the script - I know this is very messy and is not the efficient way to do this
echo -n "# " >> $script_n
echo -n "Script Generated " >> $script_n
echo $day >> $script_n
echo -n "# " >> $script_n
echo -n "Created for " >> $script_n
echo $userName >> $script_n

# Writing the actual code to the file
echo -n '# Water Droplet Icon
# https://www.vecteezy.com/free-vector/water-drop-icon - Water Drop Icon Vectors by Vecteezy
echo # Necessary for creating a cron job
eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME gnome-session)/environ)";

# Creating an array with a few water facts
waterText=("Water is composed to 2 Hydrogen atoms and 1 Oxygen atom" 
	"75% of your brain is water" 
	"Human Bones are 31% Water" 
	"330 Gallons of water are required to make 1 Chicken" 
	"Water is a natural appetite suppressant" 
	"Most people are reccomended to drink between 8-11 glasses of water a day")

# Randomly Generate a water fact to use in the Notify-Send
MESSAGE=${waterText[(( $RANDOM % 5 +1 ))]}

# Utilize Notify-Send to notify with Title & Message Arguments
DISPLAY=:0 notify-send -i drop.png "Time to Hydrate "' >> $script_n
echo -n $waterDrinker >> $script_n
echo '"${MESSAGE}"' >> $script_n

# End of Script
