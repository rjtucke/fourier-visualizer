How to make shit:

1. Specify coefficients in a file- for example, coefficients.dat
2. Compile and run PsiStarPsiSI.cpp: 
   g++ -std=c++0x PsiStarPsiSI.cpp && ./a.out coefficients.dat
3. Turn the data files thus generated into PNGs using graphall.sh:
   sh graphall.sh
4. Stitch the separate PNGs together using ImageMagick:
   convert -delay 5 -loop 0 datafiles/*.png animated.gif
5. View the animated gif with GThumb:
   gthumb animated.gif
