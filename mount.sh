echo "mamadani" | sudo -S umount /home/exeon/pico/
echo "mamadani" | sudo -S mount /dev/sdc1 /home/exeon/pico/ -o umask=000
cargo run
echo "mamadani" | sudo -S umount /home/exeon/pico/
