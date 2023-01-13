rm rat # delete old file
cd ..
shar -V ./*.* > packaging/exec # build archive
cd packaging
head -n -1 exec > rat # delete last line of archive and save to rat
rm exec # delete temp file

pre=$(cat pre.sh) # load modifications
post=$(cat post.sh)

sed -i "7i $pre" rat # insert pre to line 7
cat post.sh >> rat # append post to end
sed -i '/^${echo} "x - extracting/d' rat # remove extraction messages
chmod +x rat
