#!/usr/bin/env bash

#!/bin/bash

# Specify the directory path
directory="images/input"
outputdir="images/output"
imageTracer="lib/imagetracerjava/ImageTracer.jar"

# Iterate over each file in the directory
for file in "$directory"/*; do
  # Check if the file is a regular file
  if [[ -f "$file" ]]; then

    filename=$(basename "$file")

#    if [ "$filename" == "sukar.png" ]; then

#      java -jar $imageTracer "$directory/$filename" outfilename "$outputdir/${filename}.svg" numberofcolors 2
      convert "$directory/$filename" -monochrome "images/bw/$filename"
      convert "images/bw/$filename" -transparent white "images/bw/tr_${filename}"
#      java -jar $imageTracer "images/bw/$filename" outfilename "$outputdir/${filename}.svg" numberofcolors 2 ltres 1 qtres 1 pathomit 8 colorsampling 1 mincolorratio 0.02 colorquantcycles 3 scale 1 simplifytolerance 0 roundcoords 1 lcpr 0 qcpr 0 desc 1 viewbox 0 blurradius 0 blurdelta 20

#    fi

  fi
done

#java -jar ImageTracer.jar appIcon.png
#
#inkscape -w 1024 -h 1024 appIcon.png.svg -o output.png
#
#convert output.png -monochrome output-b-w.png
#
#convert "$input_file" -transparent black "$output_file"
#
#convert output-b-w.png -transparent white output-b-w-t-w.png
