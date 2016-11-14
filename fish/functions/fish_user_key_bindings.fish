fzf_key_bindings

function uart
    picocom -b 115200 --imap crcrlf /dev/ttyUSB0
end

function runfw
    reset
    set -x LD_LIBRARY_PATH /home/sporty/MSPFlasher/
    if count $argv > /dev/null
        echo "Flusing: "  $argv
        MSP430Flasher -w $argv -b -j fast -q -g -z [RESET, VCC] 
    else 
        echo "Flusing: hw_1_5.hex"
        MSP430Flasher -w "hw_1_5.hex" -b -j fast -q -g -z [RESET, VCC] 
    end
    picocom -b 115200 --imap crcrlf /dev/ttyUSB0
end

function fw
    cd ~/HydroGuardFW/hw_1_5
end

function mone
    "xrandr --output eDP1 --off"
end

function moni
    "xrandr --output eDP1 --auto"
end

function maria
    "ssh maria@10.48.2.57"
end

function uart
    picocom -b 115200 --imap crcrlf /dev/ttyUSB0
end

function fcd
    if count $argv > /dev/null
        open $argv
    else
        open $PWD
    end
end
