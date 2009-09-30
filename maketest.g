##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "alexander" );

LoadPackage( "GAPDoc" );

list := [
         "../gap/alexander.gd",
         "../gap/alexander.gi",
         "../examples/Torus.g",
         "../examples/RP^2.g",
         "../examples/(Torus,S^1).g",
         "../examples/(RP^2,S^1).g",
         ];

TestManualExamples( "doc", "alexander.xml", list );

GAPDocManualLab( "alexander" );

quit;
