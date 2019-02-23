#############################################################################
##
##  alexander.gd           alexander package                 Mohamed Barakat
##
##  Copyright 2007-2008 Lehrstuhl B für Mathematik, RWTH Aachen
##
##  Declaration stuff for alexander.
##
#############################################################################

# our info class:
DeclareInfoClass( "InfoAlexander" );
SetInfoLevel( InfoAlexander, 1 );

# a central place for configurations:
DeclareGlobalVariable( "ALEXANDER" );

####################################
#
# categories:
#
####################################

# a new GAP-category:

DeclareCategory( "IsHomalgSimplicialComplexConstructor",
        IsAttributeStoringRep );

####################################
#
# global functions and operations:
#
####################################

# constructor methods:

DeclareGlobalFunction( "SimplicialComplexConstructor" );

DeclareGlobalFunction( "SimplicialBoundaryMap" );

DeclareGlobalFunction( "SimplicialChainMap" );

DeclareGlobalFunction( "SimplicialData" );

# basic operations:

DeclareOperation( "SimplicialCycle",
        [ IsHomalgMatrix, IsList ] );

DeclareOperation( "SimplicialCycle",
        [ IsHomalgComplex, IsHomalgSimplicialComplexConstructor, IsInt, IsPosInt ] );

DeclareOperation( "SimplicialCycle",
        [ IsHomalgSimplicialComplexConstructor, IsInt, IsPosInt ] );

DeclareOperation( "SimplicialFaces",
        [ IsHomalgSimplicialComplexConstructor, IsInt ] );

