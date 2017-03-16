fzf_key_bindings

function fish_user_key_bindings
  fish_vi_key_bindings
  bind -M insert -m default jk backward-char force-repaint
end

function uart
    picocom -b 115200 --imap crcrlf /dev/ttyUSB0
end

function runfw
    reset
    set -x LD_LIBRARY_PATH /home/sporty/MSPFlasher/

    set prj_dir (string split -- / $PWD)[-2]

    if test $prj_dir = hw_1_5
        if count $argv > /dev/null
            echo "Flusing: "  $argv
            MSP430Flasher -w $argv -b -j fast -q -g -z [RESET, VCC] 
        else 
            echo "Flusing: hw_1_5.hex"
            MSP430Flasher -w "hw_1_5.hex" -b -j fast -q -g -z [RESET, VCC] 
        end
        picocom -b 115200 --imap crcrlf /dev/ttyUSB0
    else if test prj_dir = hw_2_0
        if count $argv > /dev/null
            echo "Flusing: "  $argv
            MSP430Flasher -w $argv -b -j fast -q -g -z [RESET, VCC] 
        else 
            echo "Flusing: hw_2_0"
            MSP430Flasher -w "hw_2_0.hex" -b -j fast -q -g -z [RESET, VCC] 
        end
        picocom -b 115200 --imap crcrlf /dev/ttyACM1
    else
        echo "Cannot Identify Dir: $prj_dir"
    end

end

function fwo
    cd ~/HydroGuardFW/hw_1_5
end

function fwt
    cd ~/HydroGuardFW/hw_2_0
end

function os
    cd ~/HydroGuardFW/hg_os
end

function mone
    xrandr --output eDP1 --off
    feh --bg-scale ~/Pictures/IMG_9057_screen.JPG
end

function moni
    xrandr --output eDP1 --auto
end

function tpoff
    synclient TouchpadOff=1
end

function tpon
    synclient TouchpadOff=0
end

function uart
    picocom -b 115200 --imap crcrlf /dev/ttyUSB0
end

function hguart
    picocom -b 115200 --imap crcrlf /dev/ttyACM1
end

function fcd
    if count $argv > /dev/null
        open $argv
    else
        open $PWD
    end
end

function stg
    ssh receiver@mueller.23stages.com
end

function prod
    ssh receiver@miwt.net
end

function lock
    i3lock -d -c 000000
end
