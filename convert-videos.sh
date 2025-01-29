#!/usr/bin/env bash

if [ $# -eq 0 ]
  then
    echo "Converting all videos"

    tasks=("close_jar"
           "push_buttons"
           "insert_onto_square_peg"
           "light_bulb_in"
           "meat_off_grill"
           "open_drawer"
           "place_cups"
           "place_shape_in_shape_sorter"
           "place_wine_at_rack_location"
           "put_groceries_in_cupboard"
           "put_item_in_drawer"
           "put_money_in_safe"
           "reach_and_drag"
           "slide_block_to_color_target"
           "stack_blocks"
           "stack_cups"
           "sweep_to_dustpan_of_size"
           "turn_tap"
           )
else
    echo "Converting video $1"
    tasks=("$1")
fi

for task in "${tasks[@]}"
do
    echo "Processing video: $task"
    ffmpeg -i "${task}.mp4" -c:v libx264 -preset medium -crf 23 -c:a aac -b:a 128k "${task}_fixed.mp4"
done