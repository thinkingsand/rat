chmod +x script.sh
if [ $RAINBOW_EN == 1 ]; then
    ./script.sh | lolcat
else
    ./script.sh
fi

exit 0
