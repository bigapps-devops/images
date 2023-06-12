#!/usr/bin/env bash

#!/bin/bash

# Specify the directory path
directory="images/input"
outputdir="images/output"
onesignalFolder="$outputdir/onesignal"
imageTracer="lib/imagetracerjava/ImageTracer.jar"
onesignalFolderNames="drawable-hdpi drawable-mdpi drawable-xhdpi drawable-xxhdpi drawable-xxxhdpi"
# Iterate over each file in the directory
for file in "$directory"/*; do
  # Check if the file is a regular file
  if [[ -f "$file" ]]; then

    filename=$(basename "$file")
    shortName=$(echo "$filename" | awk -F . '{print $1}')

    #      java -jar $imageTracer "$directory/$filename" outfilename "$outputdir/${filename}.svg" numberofcolors 2
          convert "$directory/$filename" -monochrome "images/bw/$filename"
          convert "images/bw/$filename" -transparent white "images/bw/tr_${filename}"
    destinationFolder="$onesignalFolder/$shortName"


    for folder in $onesignalFolderNames; do
        mkdir -p "$destinationFolder/$folder"
    done
        convert "images/bw/tr_${filename}" -resize 32x32 xc:none -depth 8 "$destinationFolder/drawable-hdpi/ic_stat_onesignal_default.png"
        convert "images/bw/tr_${filename}" -resize 24x24 xc:none -depth 8 "$destinationFolder/drawable-mdpi/ic_stat_onesignal_default.png"
        convert "images/bw/tr_${filename}" -resize 48x48 xc:none -depth 8 "$destinationFolder/drawable-xhdpi/ic_stat_onesignal_default.png"
        convert "images/bw/tr_${filename}" -resize 72x72 xc:none -depth 8 "$destinationFolder/drawable-xxhdpi/ic_stat_onesignal_default.png"
        convert "images/bw/tr_${filename}" -resize 92x92 xc:none -depth 8 "$destinationFolder/drawable-xxxhdpi/ic_stat_onesignal_default.png"

#    convert input.png -resize 32x32 -depth 8 rgba:output.png
    #      java -jar $imageTracer "images/bw/$filename" outfilename "$outputdir/${filename}.svg" numberofcolors 2 ltres 1 qtres 1 pathomit 8 colorsampling 1 mincolorratio 0.02 colorquantcycles 3 scale 1 simplifytolerance 0 roundcoords 1 lcpr 0 qcpr 0 desc 1 viewbox 0 blurradius 0 blurdelta 20

  fi
done

