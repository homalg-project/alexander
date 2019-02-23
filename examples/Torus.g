##  <#GAPDoc Label="Torus">
##  <Section Label="Torus">
##  <Heading>Torus</Heading>
##  In this example we compute the homology and cohomology
##  with coefficients in &ZZ; and &ZZ;/2 of the (2-dimensional) torus.
##  <Example><![CDATA[
##  gap> R := HomalgRingOfIntegers( );
##  Z
##  gap> Torus := [ [ 1, 2, 5 ], [ 1, 4, 5 ], [ 2, 3, 6 ], [ 2, 5, 6 ], [ 1, 3, 4 ],
##  > [ 3, 4, 6 ], [ 4, 7, 8 ], [ 4, 5, 8 ], [ 5, 8, 9 ], [ 5, 6, 9 ],
##  > [ 6, 7, 9 ], [ 4, 6, 7 ], [ 1, 2, 7 ], [ 2, 7, 8 ], [ 2, 3, 8 ],
##  > [ 3, 8, 9 ], [ 1, 3, 9 ], [ 1, 7, 9 ] ];;
##  gap> Torus := SimplicialComplexConstructor( Torus );
##  <A simplicial 2-complex>
##  gap> d := SimplicialData( Torus, R );
##  <A complex containing 2 morphisms of left modules at degrees [ 0 .. 2 ]>
##  gap> HZ_Torus := Homology( d );
##  <A graded homology object consisting of 3 left modules at degrees [ 0 .. 2 ]>
##  gap> ByASmallerPresentation( HZ_Torus );
##  <A non-zero graded homology object consisting of 3 left modules at degrees 
##  [ 0 .. 2 ]>
##  gap> Display( HZ_Torus );
##  -------------------------
##  at homology degree: 2
##  Z^(1 x 1)
##  -------------------------
##  at homology degree: 1
##  Z^(1 x 2)
##  -------------------------
##  at homology degree: 0
##  Z^(1 x 1)
##  -------------------------
##  gap> cyc := SimplicialCycle( HZ_Torus, Torus, 1, 1 );
##  [ [ 3, 6 ], [ 3, 9 ], [ 6, 9 ], [ 7, 8 ], [ 7, 9 ], [ 8, 9 ] ]
##  gap> dd := Hom( d, R );
##  <A cocomplex containing 2 morphisms of right modules at degrees [ 0 .. 2 ]>
##  gap> CZ_Torus := Cohomology( dd );
##  <A graded cohomology object consisting of 3 right modules at degrees 
##  [ 0 .. 2 ]>
##  gap> ByASmallerPresentation( CZ_Torus );
##  <A non-zero graded cohomology object consisting of 3 right modules at degrees 
##  [ 0 .. 2 ]>
##  gap> Display( CZ_Torus );
##  ---------------------------
##  at cohomology degree: 2
##  Z^(1 x 1)
##  ---------------------------
##  at cohomology degree: 1
##  Z^(2 x 1)
##  ---------------------------
##  at cohomology degree: 0
##  Z^(1 x 1)
##  ---------------------------
##  gap> Z2 := LeftPresentation( [ 2 ], R );
##  <A cyclic torsion left module presented by 1 relation for a cyclic generator>
##  gap> d2 := d * Z2;
##  <A complex containing 2 morphisms of left modules at degrees [ 0 .. 2 ]>
##  gap> HZ2_Torus := Homology( d2 );
##  <A graded homology object consisting of 3 left modules at degrees [ 0 .. 2 ]>
##  gap> ByASmallerPresentation( HZ2_Torus );
##  <A non-zero graded homology object consisting of 3 left modules at degrees 
##  [ 0 .. 2 ]>
##  gap> Display( HZ2_Torus );
##  -------------------------
##  at homology degree: 2
##  Z/< 2 > 
##  -------------------------
##  at homology degree: 1
##  Z/< 2 > + Z/< 2 > 
##  -------------------------
##  at homology degree: 0
##  Z/< 2 > 
##  -------------------------
##  gap> dd2 := Hom( d, Z2 );
##  <A cocomplex containing 2 morphisms of right modules at degrees [ 0 .. 2 ]>
##  gap> CZ2_Torus := Cohomology( dd2 );
##  <A graded cohomology object consisting of 3 right modules at degrees 
##  [ 0 .. 2 ]>
##  gap> ByASmallerPresentation( CZ2_Torus );
##  <A non-zero graded cohomology object consisting of 3 right modules at degrees 
##  [ 0 .. 2 ]>
##  gap> Display( CZ2_Torus );
##  ---------------------------
##  at cohomology degree: 2
##  Z/< 2 > 
##  ---------------------------
##  at cohomology degree: 1
##  Z/< 2 > + Z/< 2 > 
##  ---------------------------
##  at cohomology degree: 0
##  Z/< 2 > 
##  ---------------------------
##  ]]></Example>
##  </Section>
##  <#/GAPDoc>

LoadPackage( "alexander" );

R := HomalgRingOfIntegers( );

Torus := [[1,2,5],[1,4,5],[2,3,6],[2,5,6],[1,3,4],[3,4,6],[4,7,8],[4,5,8],[5,8,9],[5,6,9],[6,7,9],[4,6,7],[1,2,7],[2,7,8],[2,3,8],[3,8,9],[1,3,9],[1,7,9]];

Torus := SimplicialComplexConstructor( Torus );

d := SimplicialData( Torus, R );

HZ_Torus := Homology( d );

ByASmallerPresentation( HZ_Torus );

cyc := SimplicialCycle( HZ_Torus, Torus, 1, 1 );

dd := Hom( d, R );

CZ_Torus := Cohomology( dd );

ByASmallerPresentation( CZ_Torus );

Z2 := LeftPresentation( [ 2 ], R );

d2 := d * Z2;

HZ2_Torus := Homology( d2 );

ByASmallerPresentation( HZ2_Torus );

dd2 := Hom( d, Z2 );

CZ2_Torus := Cohomology( dd2 );

ByASmallerPresentation( CZ2_Torus );

#Print( _UCT_Homology, "\n" );
#Print( _UCT_Cohomology, "\n" );

