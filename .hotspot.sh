#first argument
ssid=${1:-"bidhayak"}

#second argument
pass=${2:-"hibanamain"}

#enp is the name of ethernet network
enp=$(ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;getline}')

#wlp is name of wifi network, wifi must be enables
wlp=$(ip link | awk -F: '$0 !~ "lo|vir|enp|^[^0-9]"{print $2;getline}')

sudo create_ap $wlp $enp $ssid $pass