# !/bin/bash
# script change settings trackpoint for I can make tap to trackpoint

echo  '[>] Run script';
echo  '[=] Change settings TrackPad to can tapping';

# find id mt trackPad 
trackPadID=$( xinput list | grep "Synaptics"  | grep "id=[0-9]\{2\}" -o | grep "[0-9]\{2\}" -o  );
echo "[+] Find id track pad:  $trackPadID";
 
 # after find property wich need change 
 numberProperty=$(xinput list-props $trackPadID | grep 'Tapping Enabled (' | grep '[0-9]\{3\}' -o);
 echo "[+] Find property which need change: $numberProperty";

 # and finally set new property 
 setProperty=$( xinput set-prop $trackPadID $numberProperty 1);
echo "[+] Set property";

 echo "[<] Script work DONE ";
