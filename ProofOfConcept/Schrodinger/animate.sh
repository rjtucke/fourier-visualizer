#!/bin/sh

# Clean up previous runs
rm -f datafiles/*
rm -f PsiStarPsiSI
rm -f output.gif

# Read coefficients from file specified on cmd line
coef_file=$1
if [ ! -f $coef_file ]
then
    echo "$coef_file not found. Cannot continue."
    exit
fi
echo "Reading coefficients from $coef_file"

# Compile and run PsiStarPsiSI:
g++ -std=c++0x PsiStarPsiSI.cpp -oPsiStarPsiSI
./PsiStarPsiSI $coef_file

# Turn the data files into PNG frames 
echo "Generating frames with graphall.sh"
sh graphall.sh

# Stitch the PNGs together into an animated gif
echo "Stitching frames into output file"
convert -delay 5 datafiles/*.png output.gif

echo "Animation complete. Use gthumb output.gif to view."
