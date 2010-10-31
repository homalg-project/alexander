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

DeclareCategory( "IsHomalgSimplicialComplex",
        IsAttributeStoringRep );

####################################
#
# global functions and operations:
#
####################################

# constructor methods:

DeclareGlobalFunction( "SimplicialComplex" );

DeclareGlobalFunction( "SimplicialBoundaryMap" );

DeclareGlobalFunction( "SimplicialChainMap" );

DeclareGlobalFunction( "SimplicialData" );

# basic operations:

DeclareOperation( "SimplicialCycle",
        [ IsHomalgMatrix, IsList ] );

DeclareOperation( "SimplicialCycle",
        [ IsHomalgComplex, IsHomalgSimplicialComplex, IsInt, IsPosInt ] );

DeclareOperation( "SimplicialCycle",
        [ IsHomalgSimplicialComplex, IsInt, IsPosInt ] );

DeclareOperation( "SimplicialFaces",
        [ IsHomalgSimplicialComplex, IsInt ] );

