##  <#GAPDoc Label="(RP^2,S^1)">
##  <Section Label="(RP^2,S^1)">
##  <Heading>(RP^2,S^1)</Heading>
##  In this example we compute the relative homology and cohomology
##  with coefficients in &ZZ; of the pair <M>(&RR;P^2,S^1)</M>,
##  where <M>&RR;P^2</M> is the real projective plane and <M>S^1</M> is
##  a nontrivial homology cycle.
##  <Example><![CDATA[
##  gap> R := HomalgRingOfIntegers( );
##  Z
##  gap> RP2 := [ [ 1, 2, 3 ], [ 1, 3, 6 ], [ 2, 5, 6 ], [ 1, 2, 5 ], [ 1, 4, 6 ],
##  > [ 2, 4, 6 ], [ 3, 5, 6 ], [ 1, 4, 5 ], [ 2, 3, 4 ], [ 3, 4, 5 ] ];;
##  gap> RP2 := SimplicialComplexConstructor( RP2 );
##  <A simplicial 2-complex>
##  gap> cyc := SimplicialCycle( RP2, 1, 1 );
##  [ [ 4, 5 ], [ 4, 6 ], [ 5, 6 ] ]
##  gap> S1 := SimplicialComplexConstructor( cyc, Dimension( RP2 ) );
##  <A simplicial 1-complex>
##  gap> d := SimplicialData( RP2, S1, R );
##  <A short exact sequence containing 2 morphisms of left complexes at degrees 
##  [ 0 .. 2 ]>
##  gap> T := ExactTriangle( d );
##  <An exact triangle containing 3 morphisms of left complexes at degrees 
##  [ 1, 2, 3, 1 ]>
##  gap> lehs := LongSequence( T );
##  <A sequence containing 8 morphisms of left modules at degrees [ 0 .. 8 ]>
##  gap> ByASmallerPresentation( lehs );
##  <A non-zero sequence containing 8 morphisms of left modules at degrees
##  [ 0 .. 8 ]>
##  gap> IsExactSequence( lehs );
##  true
##  gap> lehs;
##  <A non-zero exact sequence containing 8 morphisms of left modules at degrees 
##  [ 0 .. 8 ]>
##  gap> Display( lehs );
##  -------------------------
##  at homology degree: 8
##  0
##  -------------------------
##  (an empty 0 x 0 matrix)
##  
##  the map is currently represented by the above 0 x 0 matrix
##  ------------v------------
##  at homology degree: 7
##  0
##  -------------------------
##  (an empty 0 x 1 matrix)
##  
##  the map is currently represented by the above 0 x 1 matrix
##  ------------v------------
##  at homology degree: 6
##  Z^(1 x 1)
##  -------------------------
##  [ [  2 ] ]
##  
##  the map is currently represented by the above 1 x 1 matrix
##  ------------v------------
##  at homology degree: 5
##  Z^(1 x 1)
##  -------------------------
##  [ [  1 ] ]
##  
##  the map is currently represented by the above 1 x 1 matrix
##  ------------v------------
##  at homology degree: 4
##  Z/< 2 > 
##  -------------------------
##  (an empty 1 x 0 matrix)
##  
##  the map is currently represented by the above 1 x 0 matrix
##  ------------v------------
##  at homology degree: 3
##  0
##  -------------------------
##  (an empty 0 x 1 matrix)
##  
##  the map is currently represented by the above 0 x 1 matrix
##  ------------v------------
##  at homology degree: 2
##  Z^(1 x 1)
##  -------------------------
##  [ [  1 ] ]
##  
##  the map is currently represented by the above 1 x 1 matrix
##  ------------v------------
##  at homology degree: 1
##  Z^(1 x 1)
##  -------------------------
##  (an empty 1 x 0 matrix)
##  
##  the map is currently represented by the above 1 x 0 matrix
##  ------------v------------
##  at homology degree: 0
##  0
##  -------------------------
##  gap> dd := Hom( d );
##  <A cocomplex containing 2 morphisms of right cocomplexes at degrees 
##  [ 0 .. 2 ]>
##  gap> SetIsShortExactSequence( dd, true );
##  gap> t := ExactTriangle ( dd );
##  <An exact cotriangle containing 3 morphisms of right cocomplexes at degrees 
##  [ 0, 1, 2, 0 ]>
##  gap> lecs := LongSequence( t );
##  <A cosequence containing 8 morphisms of right modules at degrees [ 0 .. 8 ]>
##  gap> ByASmallerPresentation( lecs );
##  <A non-zero cosequence containing 8 morphisms of right modules at degrees
##  [ 0 .. 8 ]>
##  gap> IsExactSequence( lecs );
##  true
##  gap> lecs;
##  <A non-zero exact cosequence containing 
##  8 morphisms of right modules at degrees [ 0 .. 8 ]>
##  gap> Display( lecs );
##  -------------------------
##  at cohomology degree: 8
##  0
##  ------------^------------
##  (an empty 0 x 1 matrix)
##  
##  the map is currently represented by the above 0 x 1 matrix
##  -------------------------
##  at cohomology degree: 7
##  Z/< 2 > 
##  ------------^------------
##  [ [  1 ] ]
##  
##  the map is currently represented by the above 1 x 1 matrix
##  -------------------------
##  at cohomology degree: 6
##  Z^(1 x 1)
##  ------------^------------
##  [ [  2 ] ]
##  
##  the map is currently represented by the above 1 x 1 matrix
##  -------------------------
##  at cohomology degree: 5
##  Z^(1 x 1)
##  ------------^------------
##  (an empty 1 x 0 matrix)
##  
##  the map is currently represented by the above 1 x 0 matrix
##  -------------------------
##  at cohomology degree: 4
##  0
##  ------------^------------
##  (an empty 0 x 0 matrix)
##  
##  the map is currently represented by the above 0 x 0 matrix
##  -------------------------
##  at cohomology degree: 3
##  0
##  ------------^------------
##  (an empty 0 x 1 matrix)
##  
##  the map is currently represented by the above 0 x 1 matrix
##  -------------------------
##  at cohomology degree: 2
##  Z^(1 x 1)
##  ------------^------------
##  [ [  1 ] ]
##  
##  the map is currently represented by the above 1 x 1 matrix
##  -------------------------
##  at cohomology degree: 1
##  Z^(1 x 1)
##  ------------^------------
##  (an empty 1 x 0 matrix)
##  
##  the map is currently represented by the above 1 x 0 matrix
##  -------------------------
##  at cohomology degree: 0
##  0
##  -------------------------
##  ]]></Example>
##  </Section>
##  <#/GAPDoc>

LoadPackage( "alexander" );

R := HomalgRingOfIntegers( );

RP2 := [[1, 2, 3], [1, 3, 6], [2, 5, 6], [1, 2, 5], [1, 4, 6], [2, 4, 6], [3, 5, 6], [1, 4, 5], [2, 3, 4], [3, 4, 5]];

RP2 := SimplicialComplexConstructor( RP2 );

cyc := SimplicialCycle( RP2, 1, 1 );

S1 := SimplicialComplexConstructor( cyc, Dimension( RP2 ) );

d := SimplicialData( RP2, S1, R );

T := ExactTriangle( d );

lehs := LongSequence( T );

ByASmallerPresentation( lehs );

IsExactSequence( lehs );

dd := Hom( d );

## FIXME: make the following line obsolete
SetIsShortExactSequence( dd, true );

t := ExactTriangle ( dd );

lecs := LongSequence( t );

ByASmallerPresentation( lecs );

IsExactSequence( lecs );
