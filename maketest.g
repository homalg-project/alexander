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
         ];

TestManualExamples( "doc", "alexander.xml", list );

GAPDocManualLab( "alexander" );

quit;
