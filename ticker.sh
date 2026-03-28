#!/usr/bin/env bash

MESSAGES=(
    "[ WELCOME TO MiNERVA RADIO] Retro game music from across the ages"
    "Birds aren't real. Seriously though. Have you ever seen a baby pigeon? I think not! They're spying on you. Just you"
    "I'm ashamed of what I did for a klondike bar... "
    "[ MiNERVA RADIO]] Streaming SID, SPC, VGM, MOD and more"
    "PUBLIC ANNOUNCEMENT: Seeding is sharing and sharing is caring"
    "BE PATIENT! Viewers found using antipatience language will be scoffed at"
    "When was the last time you told your mother you loved her?"
    "Help! I'm trapped in a radio!"
    "[MiNERVA RADIO] song requests in general chat! Anything that get's 25+ hearts will be considered. SNES and older only!"
    "Anyway, back to the bird thing. I reckon they're charging by standing on the power lines, that's why they never get fried."
    "ALLDOWNANDNOUPMAKESJACKABADSEEDallDOWNandNOUPmakESJACKaBADSeedAlldownandnoUPMAkeSjackaBadSEDE"
    "Your numbers this week are 05-17-27-29-35 / 07"
    "To download is human, to share is DiVINE"
    "If we're not meant to have midnight snacks, why is there a light in the fridge?"
    "Cake Recipe: One 18.25 ounce package chocolate cake mix, one can prepared coconut pecan frosting, three slash four cup vegetable oil, four large eggs, one cup semi-sweet chocolate chips, three slash four cups butter or margarine, one and two third cups granulated sugar, two cups all purpose flour, fish shaped crackers, fish shaped candies, fish shaped solid waste, fish shaped dirt, fish shaped ethyl benzene, pull and peel licorice, fish shaped volatile organic compounds, sediment shaped sediment, candy coated peanut butter pieces shaped like fish, one cup lemon juice, alpha resins, unsaturated polyester resin, fiberglass surface resins, volatile malted milk impoundments, nine large egg yolks, twelve medium geosynthetic membranes, one cup granulated sugar, an entry called 'how to kill someone with your bare hands', two cups rhubarb sliced, two slash three cups granulated rhubarb, one tablespoon all-purpose rhubarb, one teaspoon grated orange rhubarb, three tablespoons rhubarb on fire, one large rhubarb, one cross borehole electro-magnetic imaging rhubarb, two tablespoons rhubarb juice, adjustable aluminum head positioner, slaughter electric needle injector, cordless electric needle injector, injector needle driver, injector needle gun, cranial caps, proven preservatives, deep penetration agents, gas and odor control chemicals."

)

DELAY=0.12

COLOURS=("\033[1;33m" "\033[1;32m" "\033[1;36m" "\033[1;35m" "\033[1;31m")
colour_idx=0

tput civis
trap 'tput cnorm; echo; exit' INT TERM

clear

while true; do
    # Pick a random message from the array
    msg="${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}"

    # Pick a random colour from the array
    colour="${COLOURS[$RANDOM % ${#COLOURS[@]}]}"

    # Create the repeating block with a neat separator
    base_msg="${msg}    *** "
    msg_len=${#base_msg}

    # Build a massive string by repeating the block
    full_line=""
    for (( c=0; c<30; c++ )); do
        full_line="${full_line}${base_msg}"
    done

    i=0
    # Set the timer for exactly 60 seconds from right now
    end_time=$(( SECONDS + 60 ))

    while (( SECONDS < end_time )); do
        WIDTH=$(tput cols)

        printf '\r\033[2K%b%s\033[0m' "$colour" "${full_line:$i:$WIDTH}"

        (( i = (i + 1) % msg_len ))
        sleep "$DELAY"
    done
done
done
