##  <#GAPDoc Label="(Torus,S^1)">
##  <Section Label="(Torus,S^1)">
##  <Heading>(Torus,S^1)</Heading>
##  In this example we compute the relative homology and cohomology
##  with coefficients in &ZZ; of the pair <M>(T,S^1)</M>,
##  where <M>T</M> is the (2-dimensional) torus and <M>S^1</M> is
##  a nontrivial homology cycle.
##  <Example><![CDATA[
##  gap> R := HomalgRingOfIntegers( );
##  <A homalg internal ring>
##  gap> Torus := [ [ 1, 2, 5 ], [ 1, 4, 5 ], [ 2, 3, 6 ], [ 2, 5, 6 ], [ 1, 3, 4 ],
##  > [ 3, 4, 6 ], [ 4, 7, 8 ], [ 4, 5, 8 ], [ 5, 8, 9 ], [ 5, 6, 9 ],
##  > [ 6, 7, 9 ], [ 4, 6, 7 ], [ 1, 2, 7 ], [ 2, 7, 8 ], [ 2, 3, 8 ],
##  > [ 3, 8, 9 ], [ 1, 3, 9 ], [ 1, 7, 9 ] ];;
##  gap> Torus := SimplicialComplex( Torus );
##  <A simplicial 2-complex>
##  gap> cyc := [[3, 6], [3, 9], [6, 9]];
##  [ [ 3, 6 ], [ 3, 9 ], [ 6, 9 ] ]
##  gap> S1 := SimplicialComplex( cyc, Dimension( Torus ) );
##  <A simplicial 1-complex>
##  gap> d := SimplicialData( Torus, S1, R );
##  <A short exact sequence containing 2 morphisms of left complexes at degrees 
##  [ 0 .. 2 ]>
##  gap> T := ExactTriangle( d );
##  <An exact triangle containing 3 morphisms of left complexes at degrees 
##  [ 1, 2, 3, 1 ]>
##  gap> lehs := LongSequence( T );
##  <A "complex" containing 8 morphisms of left modules at degrees [ 0 .. 8 ]>
##  gap> ByASmallerPresentation( lehs );
##  <A non-zero "complex" containing 8 morphisms of left modules at degrees 
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
##  (an empty 0 x 1 matrix)
##  
##  the map is currently represented by the above 0 x 1 matrix
##  ------------v------------
##  at homology degree: 7
##  Z^(1 x 1)
##  -------------------------
##  [ [  1 ] ]
##  
##  the map is currently represented by the above 1 x 1 matrix
##  ------------v------------
##  at homology degree: 6
##  Z^(1 x 1)
##  -------------------------
##  [ [  0 ] ]
##  
##  the map is currently represented by the above 1 x 1 matrix
##  ------------v------------
##  at homology degree: 5
##  Z^(1 x 1)
##  -------------------------
##  [ [   4,  -3 ] ]
##  
##  the map is currently represented by the above 1 x 2 matrix
##  ------------v------------
##  at homology degree: 4
##  Z^(1 x 2)
##  -------------------------
##  [ [  3 ],
##    [  4 ] ]
##  
##  the map is currently represented by the above 2 x 1 matrix
##  ------------v------------
##  at homology degree: 3
##  Z^(1 x 1)
##  -------------------------
##  [ [  0 ] ]
##  
##  the map is currently represented by the above 1 x 1 matrix
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
##  <A "cocomplex" containing 8 morphisms of right modules at degrees [ 0 .. 8 ]>
##  gap> ByASmallerPresentation( lecs );
##  <A non-zero "cocomplex" containing 8 morphisms of right modules at degrees 
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
##  Z^(1 x 1)
##  ------------^------------
##  [ [  1 ] ]
##  
##  the map is currently represented by the above 1 x 1 matrix
##  -------------------------
##  at cohomology degree: 6
##  Z^(1 x 1)
##  ------------^------------
##  [ [  0 ] ]
##  
##  the map is currently represented by the above 1 x 1 matrix
##  -------------------------
##  at cohomology degree: 5
##  Z^(1 x 1)
##  ------------^------------
##  [ [  1,  0 ] ]
##  
##  the map is currently represented by the above 1 x 2 matrix
##  -------------------------
##  at cohomology degree: 4
##  Z^(2 x 1)
##  ------------^------------
##  [ [  0 ],
##    [  1 ] ]
##  
##  the map is currently represented by the above 2 x 1 matrix
##  -------------------------
##  at cohomology degree: 3
##  Z^(1 x 1)
##  ------------^------------
##  [ [  0 ] ]
##  
##  the map is currently represented by the above 1 x 1 matrix
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

Torus := [[1,2,5],[1,4,5],[2,3,6],[2,5,6],[1,3,4],[3,4,6],[4,7,8],[4,5,8],[5,8,9],[5,6,9],[6,7,9],[4,6,7],[1,2,7],[2,7,8],[2,3,8],[3,8,9],[1,3,9],[1,7,9]];

Torus := SimplicialComplex( Torus );

#cyc := SimplicialCycle( Torus, 1, 1 );
cyc := [[3, 6], [3, 9], [6, 9]];

S1 := SimplicialComplex( cyc, Dimension( Torus ) );

d := SimplicialData( Torus, S1, R );

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
