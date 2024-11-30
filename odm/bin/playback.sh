set -x
# $1: device for output
#     spk: speaker
#     top-spk: top speaker
#     bot-spk: bottom speaker
#     rcv: receiver
#     spk_hp: speaker high power
#     top-spk_hp: top speaker high power
#     bot-spk_hp: bottom speaker high power
#     us: ultrasound

# tinyplay file.wav [-D card] [-d device] [-p period_size] [-n n_periods]
# sample usage: playback.sh spk
# rcv.wav:-4.5dbfs   spk: -4.8dbfs  ultra: -4.5dbfs  spk_hp:-1.8dbfs
name="aw882xx"
function get_smartpa_type
{
    echo "get smartpa type"
    name=$(getprop "persist.vendor.audio.pa.smartpa_type")
    echo $name

}

############################ add for aw882xx start #######################
function enable_receiver
{
    echo "enabling receiver"

    tinymix 'I2SOUT4_CH1 DL0_CH1' 1
    tinymix 'I2SOUT4_CH2 DL0_CH2' 1
    tinymix 'I2SOUT4_HD_Mux' 'Low_Jitter'

    tinymix 'aw_dev_0_prof' 'Receiver'
    tinymix 'aw_dev_0_switch' 'Enable'
    tinymix 'aw_dev_1_prof' 'Music'
    tinymix 'aw_dev_1_switch' 'Disable'

    sleep 1
}

function disable_receiver
{
    echo "disabling receiver"
    tinymix 'aw_dev_1_switch' 'Disable'
    tinymix 'aw_dev_1_prof' 'Music'
    tinymix 'aw_dev_0_switch' 'Disable'
    tinymix 'aw_dev_0_prof' 'Music'

    tinymix 'I2SOUT4_HD_Mux' 'Normal'
    tinymix 'I2SOUT4_CH1 DL0_CH1' 0
    tinymix 'I2SOUT4_CH2 DL0_CH2' 0

}



function enable_speaker
{
    echo "enabling speaker"
    tinymix 'I2SOUT4_CH1 DL0_CH1' 1
    tinymix 'I2SOUT4_CH2 DL0_CH2' 1
    tinymix 'I2SOUT4_HD_Mux' 'Low_Jitter'

    tinymix 'aw_dev_0_prof' 'Music'
    tinymix 'aw_dev_0_switch' 'Enable'
    tinymix 'aw_dev_1_prof' 'Music'
    tinymix 'aw_dev_1_switch' 'Enable'

    sleep 0.2
}

function disable_speaker
{
    echo "disabling speaker"
    tinymix 'I2SOUT4_CH1 DL0_CH1' 0
    tinymix 'I2SOUT4_CH2 DL0_CH2' 0
    tinymix 'I2SOUT4_HD_Mux' 'Normal'

}

function enable_speaker_top
{
    echo "enabling speaker top"

    tinymix 'I2SOUT4_CH1 DL0_CH1' 1
    tinymix 'I2SOUT4_CH2 DL0_CH2' 0
    tinymix 'I2SOUT4_HD_Mux' 'Low_Jitter'

    tinymix 'aw_dev_0_prof' 'Music'
    tinymix 'aw_dev_0_switch' 'Enable'
    tinymix 'aw_dev_1_prof' 'Music'
    tinymix 'aw_dev_1_switch' 'Enable'

    sleep 0.2
}

function disable_speaker_top
{
    echo "disabling speaker top"
    tinymix 'I2SOUT4_CH1 DL0_CH1' 0
    tinymix 'I2SOUT4_CH2 DL0_CH2' 0
    tinymix 'I2SOUT4_HD_Mux' 'Normal'

}
function enable_speaker_bot
{
    echo "enabling speaker bottom"
    tinymix 'I2SOUT4_CH1 DL0_CH1' 0
    tinymix 'I2SOUT4_CH2 DL0_CH2' 1
    tinymix 'I2SOUT4_HD_Mux' 'Low_Jitter'

    tinymix 'aw_dev_0_prof' 'Music'
    tinymix 'aw_dev_0_switch' 'Enable'
    tinymix 'aw_dev_1_prof' 'Music'
    tinymix 'aw_dev_1_switch' 'Enable'

    sleep 0.2
}

function disable_speaker_bot
{
    echo "disabling speaker bottom"
    tinymix 'I2SOUT4_CH1 DL0_CH1' 0
    tinymix 'I2SOUT4_CH2 DL0_CH2' 0
    tinymix 'I2SOUT4_HD_Mux' 'Normal'
}
############################ add for aw882xx end #######################

############################ add for fs19xx start #######################
function enable_receiver_fs
{
    echo "enabling receiver"

    tinymix 'I2SOUT4_CH1 DL0_CH1' 1
    tinymix 'I2SOUT4_CH2 DL0_CH2' 1
    tinymix 'I2SOUT4_HD_Mux' 'Low_Jitter'

    tinymix 'FSM_Scene' 15
    tinymix 'FSM_Volume' 251
    tinymix 'FSM_SW_GPIO' 1

    sleep 1
}

function disable_receiver_fs
{
    echo "disabling receiver"

    tinymix 'FSM_Volume' 255
    tinymix 'FSM_Scene' 0
    tinymix 'FSM_SW_GPIO' 0

    tinymix 'I2SOUT4_HD_Mux' 'Normal'
    tinymix 'I2SOUT4_CH1 DL0_CH1' 0
    tinymix 'I2SOUT4_CH2 DL0_CH2' 0
}



function enable_speaker_fs
{
    echo "enabling speaker"
    tinymix 'I2SOUT4_CH1 DL0_CH1' 1
    tinymix 'I2SOUT4_CH2 DL0_CH2' 1
    tinymix 'I2SOUT4_HD_Mux' 'Low_Jitter'

    tinymix 'FSM_Scene' 0
    tinymix 'FSM_Volume' 255

    sleep 0.2
}

function disable_speaker_fs
{
    echo "disabling speaker"
    tinymix 'I2SOUT4_CH1 DL0_CH1' 0
    tinymix 'I2SOUT4_CH2 DL0_CH2' 0
    tinymix 'I2SOUT4_HD_Mux' 'Normal'

    tinymix 'FSM_Volume' 255
    tinymix 'FSM_Scene' 0
}

function enable_speaker_top_fs
{
    echo "enabling speaker top"

    tinymix 'I2SOUT4_CH1 DL0_CH1' 1
    tinymix 'I2SOUT4_CH2 DL0_CH2' 0
    tinymix 'I2SOUT4_HD_Mux' 'Low_Jitter'

    tinymix 'FSM_Scene' 7
    tinymix 'FSM_Volume' 249

    sleep 0.2
}

function disable_speaker_top_fs
{
    echo "disabling speaker top"
    tinymix 'I2SOUT4_CH1 DL0_CH1' 0
    tinymix 'I2SOUT4_CH2 DL0_CH2' 0
    tinymix 'I2SOUT4_HD_Mux' 'Normal'

    tinymix 'FSM_Volume' 255
    tinymix 'FSM_Scene' 0


}

function enable_speaker_top_hp_fs
{
    echo "enabling speaker top hp"

    tinymix 'I2SOUT4_CH1 DL0_CH1' 1
    tinymix 'I2SOUT4_CH2 DL0_CH2' 0
    tinymix 'I2SOUT4_HD_Mux' 'Low_Jitter'

    tinymix 'FSM_Scene' 8
    tinymix 'FSM_Volume' 248

    sleep 0.2
}

function disable_speaker_top_hp_fs
{
    echo "disabling speaker top hp"
    tinymix 'I2SOUT4_CH1 DL0_CH1' 0
    tinymix 'I2SOUT4_CH2 DL0_CH2' 0
    tinymix 'I2SOUT4_HD_Mux' 'Normal'

    tinymix 'FSM_Volume' 255
    tinymix 'FSM_Scene' 0
}

function enable_speaker_bot_fs
{
    echo "enabling speaker bottom"
    tinymix 'I2SOUT4_CH1 DL0_CH1' 0
    tinymix 'I2SOUT4_CH2 DL0_CH2' 1
    tinymix 'I2SOUT4_HD_Mux' 'Low_Jitter'

    tinymix 'FSM_Scene' 9
    tinymix 'FSM_Volume' 249

    sleep 0.2
}

function disable_speaker_bot_fs
{
    echo "disabling speaker bottom"
    tinymix 'I2SOUT4_CH1 DL0_CH1' 0
    tinymix 'I2SOUT4_CH2 DL0_CH2' 0
    tinymix 'I2SOUT4_HD_Mux' 'Normal'

    tinymix 'FSM_Volume' 255
    tinymix 'FSM_Scene' 0
}

function enable_speaker_bot_hp_fs
{
    echo "enabling speaker bottom hp"
    tinymix 'I2SOUT4_CH1 DL0_CH1' 0
    tinymix 'I2SOUT4_CH2 DL0_CH2' 1
    tinymix 'I2SOUT4_HD_Mux' 'Low_Jitter'

    tinymix 'FSM_Scene' 10
    tinymix 'FSM_Volume' 249

    sleep 0.2
}

function disable_speaker_bot_hp_fs
{
    echo "disabling speaker bottom hp"
    tinymix 'I2SOUT4_CH1 DL0_CH1' 0
    tinymix 'I2SOUT4_CH2 DL0_CH2' 0
    tinymix 'I2SOUT4_HD_Mux' 'Normal'

    tinymix 'FSM_Volume' 255
    tinymix 'FSM_Scene' 0
}
############################ add for fs19xx end #######################

get_smartpa_type

if [ "$name" = "fs19xx" ]; then
    echo "smartpa_type is fs19xx,run fs19xx test"
    if [ "$1" = "spk" ]; then
        enable_speaker_fs
        filename=/odm/etc/spk.wav
        pcm_id=0
    elif [ "$1" = "top-spk" ]; then
        enable_speaker_top_fs
        filename=/odm/etc/top_spk.wav
        pcm_id=0
    elif [ "$1" = "bot-spk" ]; then
        enable_speaker_bot_fs
        filename=/odm/etc/bottom_spk.wav
        pcm_id=0
    elif [ "$1" = "spk_hp" ]; then
        enable_speaker_fs
        filename=/odm/etc/spk_hp.wav
        pcm_id=0
    elif [ "$1" = "top-spk_hp" ]; then
        enable_speaker_top_hp_fs
        filename=/odm/etc/spk_hp.wav
        pcm_id=0
    elif [ "$1" = "bot-spk_hp" ]; then
        enable_speaker_bot_hp_fs
        filename=/odm/etc/bottom_spk_hp.wav
        pcm_id=0
    elif [ "$1" = "rcv" ]; then
        enable_receiver_fs
        filename=/odm/etc/rcv.wav
        pcm_id=0
    else
        echo "Usage: playback.sh device; device: spk or spk_hp or rcv"
    fi
else
    echo "smartpa_type is aw882xx,run aw882xx test"
    if [ "$1" = "spk" ]; then
        enable_speaker
        filename=/odm/etc/spk.wav
        pcm_id=0
    elif [ "$1" = "top-spk" ]; then
        enable_speaker_top
        filename=/odm/etc/top_spk.wav
        pcm_id=0
    elif [ "$1" = "bot-spk" ]; then
        enable_speaker_bot
        filename=/odm/etc/bottom_spk.wav
        pcm_id=0
    elif [ "$1" = "spk_hp" ]; then
        enable_speaker
        filename=/odm/etc/spk_hp.wav
        pcm_id=0
    elif [ "$1" = "top-spk_hp" ]; then
        enable_speaker_top
        filename=/odm/etc/spk_hp.wav
        pcm_id=0
    elif [ "$1" = "bot-spk_hp" ]; then
        enable_speaker_bot
        filename=/odm/etc/bottom_spk_hp.wav
        pcm_id=0
    elif [ "$1" = "rcv" ]; then
        enable_receiver
        filename=/odm/etc/rcv.wav
        pcm_id=0
    else
        echo "Usage: playback.sh device; device: spk or spk_hp or rcv"
    fi
fi

#Only for cs35l41 smartPA Begin
echo "Enable I2S3_GPIO to On"
tinymix "I2S3_GPIO" "On"
sleep 0.2
#Only for cs35l41 smartPA End

echo "start playing"
tinyplay $filename -D 0 -d $pcm_id

if [ "$name" = "fs19xx" ]; then
    echo "smartpa_type is fs19xx,close fs19xx test"
    if [ "$1" = "spk" ]; then
        disable_speaker_fs
    elif [ "$1" = "top-spk" ]; then
        disable_speaker_top_fs
    elif [ "$1" = "bot-spk" ]; then
        disable_speaker_bot_fs
    elif [ "$1" = "spk_hp" ]; then
        disable_speaker_fs
    elif [ "$1" = "top-spk_hp" ]; then
        disable_speaker_top_hp_fs
    elif [ "$1" = "bot-spk_hp" ]; then
        disable_speaker_bot_hp_fs
    elif [ "$1" = "rcv" ]; then
        disable_receiver_fs
    fi
else
    echo "smartpa_type is aw882xx,close aw882xx test"
    if [ "$1" = "spk" ]; then
        disable_speaker
    elif [ "$1" = "top-spk" ]; then
        disable_speaker_top
    elif [ "$1" = "bot-spk" ]; then
        disable_speaker_bot
    elif [ "$1" = "spk_hp" ]; then
        disable_speaker
    elif [ "$1" = "top-spk_hp" ]; then
        disable_speaker_top
    elif [ "$1" = "bot-spk_hp" ]; then
        disable_speaker_bot
    elif [ "$1" = "rcv" ]; then
        disable_receiver
    fi
fi

exit 0

    