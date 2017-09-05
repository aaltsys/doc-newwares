   /bin/bash
   STREAM=$1
   DROPBOX=~/Dropbox/dermpro/ORDERS
   cd $DROPBOX
   (insert check for directory exists, else exit)
   mkdir ./WORKING
   touch ./WORKING/orders.jsn
   mv ./*.JSN ./WORKING
   ls -al ./WORKING/ >>./STREAMS/$STREAM.ls
   touch ./WORKING/orders.jsn
   find ./WORKING -type f -name '*.JSN' -exec cat {} + >> ./WORKING/orders.jsn
   cp ./WORKING/orders.jsn ./STREAMS/$STREAM.JSN
   mv ./WORKING/*.JSN ./HISTORY/ 
