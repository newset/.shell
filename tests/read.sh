#! /bin/bash

# echo newset/remax/demo | awk -F / '{print $1, $2}' | while read USERNAME REPO;
# echo newset/remax | awk -F / '{USER1=$1; REPO1=$2}' 
# echo newset/remax | awk -F / '{USER2=$1; $2}' 
# echo newset/remax | awk -F / '{USER3=$1}' 

# echo USER=$USERNAME repo=$REPO name=$NAME
# echo user1=$USER1 repo1=$REPO1
# echo user2=$USER2 
# echo user3=$USER3 

read USERNAME REPO <<< $(echo newset/remax | awk -F / '{print $1, $2}' )

echo user=$USERNAME repo=$REPO
