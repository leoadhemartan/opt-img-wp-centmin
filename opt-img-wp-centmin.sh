#! /bin/bash
########################################################################
# Quick script to batch optimise images inside a standard WordPress uploads folder.
# This is only tested to work in a VPS that was setup using centminmod Web LAMP Stack. https://centminmod.com/
# Entire functionality is dependent on the optimise-images addon tool for centminmod https://github.com/centminmod/optimise-images
# NOTE: Make sure that optimise-images.sh has the value UNATTENDED_OPTIMISE='n'  before running this script.
# Run this script as root
########################################################################

# Optimise /home/nginx/domains/vilmar.centmin/public/wp-content/uploads/2019/ folder

# Profile the folder to be optimised
find /home/nginx/domains/vilmar.centmin/public/wp-content/uploads/2019/ -type d | sort | while read d; do echo "directory: $d"; echo "/root/tools/optimise-images/optimise-images.sh profile $d"; /root/tools/optimise-images/optimise-images.sh profile $d; done 

# Optimise the folder
find /home/nginx/domains/vilmar.centmin/public/wp-content/uploads/2019/ -type d | sort | while read d; do echo "optimise directory: $d"; echo "/root/tools/optimise-images/optimise-images.sh optimise $d"; /root/tools/optimise-images/optimise-images.sh  optimise $d; done

echo "Images in the /home/nginx/domains/vilmar.centmin/public/wp-content/uploads/2019/ folder are optimised"
