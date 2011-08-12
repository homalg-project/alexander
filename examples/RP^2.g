##  <#GAPDoc Label="RP^2">
##  <Section Label="RP^2">
##  <Heading>RP^2</Heading>
##  In this example we compute the homology and cohomology
##  with coefficients in &ZZ; and &ZZ;/2 of the real projective plane.
##  <Example><![CDATA[
##  gap> R := HomalgRingOfIntegers( );
##  Z
##  gap> RP2 := [ [ 1, 2, 3 ], [ 1, 3, 6 ], [ 2, 5, 6 ], [ 1, 2, 5 ], [ 1, 4, 6 ],
##  > [ 2, 4, 6 ], [ 3, 5, 6 ], [ 1, 4, 5 ], [ 2, 3, 4 ], [ 3, 4, 5 ] ];;
##  gap> RP2 := SimplicialComplex( RP2 );
##  <A simplicial 2-complex>
##  gap> d := SimplicialData( RP2, R );
##  <A complex containing 2 morphisms of left modules at degrees [ 0 .. 2 ]>
##  gap> HZ_RP2 := Homology( d );
##  <A graded homology object consisting of 3 left modules at degrees [ 0 .. 2 ]>
##  gap> ByASmallerPresentation( HZ_RP2 );
##  <A non-zero graded homology object consisting of 3 left modules at degrees 
##  [ 0 .. 2 ]>
##  gap> Display( HZ_RP2 );
##  -------------------------
##  at homology degree: 2
##  0
##  -------------------------
##  at homology degree: 1
##  Z/< 2 > 
##  -------------------------
##  at homology degree: 0
##  Z^(1 x 1)
##  -------------------------
##  gap> S1 := SimplicialCycle( HZ_RP2, RP2, 1, 1 );
##  [ [ 4, 5 ], [ 4, 6 ], [ 5, 6 ] ]
##  gap> dd := Hom( d, R );
##  <A cocomplex containing 2 morphisms of right modules at degrees [ 0 .. 2 ]>
##  gap> CZ_RP2 := Cohomology( dd );
##  <A graded cohomology object consisting of 3 right modules at degrees 
##  [ 0 .. 2 ]>
##  gap> ByASmallerPresentation( CZ_RP2 );
##  <A non-zero graded cohomology object consisting of 3 right modules at degrees 
##  [ 0 .. 2 ]>
##  gap> Display( CZ_RP2 );
##  ---------------------------
##  at cohomology degree: 2
##  Z/< 2 > 
##  ---------------------------
##  at cohomology degree: 1
##  0
##  ---------------------------
##  at cohomology degree: 0
##  Z^(1 x 1)
##  ---------------------------
##  gap> Z2 := LeftPresentation( [ 2 ], R );
##  <A cyclic left module presented by 1 relation for a cyclic generator>
##  gap> d2 := d * Z2;
##  <A complex containing 2 morphisms of left modules at degrees [ 0 .. 2 ]>
##  gap> HZ2_RP2 := Homology( d2 );
##  <A graded homology object consisting of 3 left modules at degrees [ 0 .. 2 ]>
##  gap> d2 := d * Z2;
##  <A complex containing 2 morphisms of left modules at degrees [ 0 .. 2 ]>
##  gap> HZ2_RP2 := Homology( d2 );
##  <A graded homology object consisting of 3 left modules at degrees [ 0 .. 2 ]>
##  gap> ByASmallerPresentation( HZ2_RP2 );
##  <A non-zero graded homology object consisting of 3 left modules at degrees 
##  [ 0 .. 2 ]>
##  gap> Display( HZ2_RP2 );
##  -------------------------
##  at homology degree: 2
##  Z/< 2 > 
##  -------------------------
##  at homology degree: 1
##  Z/< 2 > 
##  -------------------------
##  at homology degree: 0
##  Z/< 2 > 
##  -------------------------
##  gap> dd2 := Hom( d, Z2 );
##  <A cocomplex containing 2 morphisms of right modules at degrees [ 0 .. 2 ]>
##  gap> CZ2_RP2 := Cohomology( dd2 );
##  <A graded cohomology object consisting of 3 right modules at degrees 
##  [ 0 .. 2 ]>
##  gap> ByASmallerPresentation( CZ2_RP2 );
##  <A non-zero graded cohomology object consisting of 3 right modules at degrees 
##  [ 0 .. 2 ]>
##  gap> Display( CZ2_RP2 );
##  ---------------------------
##  at cohomology degree: 2
##  Z/< 2 > 
##  ---------------------------
##  at cohomology degree: 1
##  Z/< 2 > 
##  ---------------------------
##  at cohomology degree: 0
##  Z/< 2 > 
##  ---------------------------
##  ]]></Example>
##  </Section>
##  <#/GAPDoc>

LoadPackage( "alexander" );

R := HomalgRingOfIntegers( );

RP2 := [[1, 2, 3], [1, 3, 6], [2, 5, 6], [1, 2, 5], [1, 4, 6], [2, 4, 6], [3, 5, 6], [1, 4, 5], [2, 3, 4], [3, 4, 5]];

RP2 := SimplicialComplex( RP2 );

d := SimplicialData( RP2, R );

HZ_RP2 := Homology( d );

ByASmallerPresentation( HZ_RP2 );

S1 := SimplicialCycle( HZ_RP2, RP2, 1, 1 );

dd := Hom( d, R );

CZ_RP2 := Cohomology( dd );

ByASmallerPresentation( CZ_RP2 );

Z2 := LeftPresentation( [ 2 ], R );

d2 := d * Z2;

HZ2_RP2 := Homology( d2 );

ByASmallerPresentation( HZ2_RP2 );

dd2 := Hom( d, Z2 );

CZ2_RP2 := Cohomology( dd2 );

ByASmallerPresentation( CZ2_RP2 );

#Print( _UCT_Homology, "\n" );
#Print( _UCT_Cohomology, "\n" );

