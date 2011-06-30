#############################################################################
##
##  alexander.gi           alexander package                 Mohamed Barakat
##
##  Copyright 2007-2008 Lehrstuhl B für Mathematik, RWTH Aachen
##
##  Implementation stuff for alexander.
##
#############################################################################

####################################
#
# global variables:
#
####################################

# a central place for configuration variables:

InstallValue( ALEXANDER,
        rec(
            ring := HomalgRingOfIntegers( )
            )
);

# two new representations for the GAP-category IsHomalgSimplicialComplex:
DeclareRepresentation( "IsHomalgSimplicialComplexRep",
        IsHomalgSimplicialComplex,
        [ ] );

####################################
#
# families and types:
#
####################################

# a new family:
BindGlobal( "TheFamilyOfHomalgSimplicialComplexes",
        NewFamily( "TheFamilyOfHomalgSimplicialComplexes" ) );

# a new type:
BindGlobal( "TheTypeHomalgSimplicialComplex",
        NewType( TheFamilyOfHomalgSimplicialComplexes,
                IsHomalgSimplicialComplexRep ) );

####################################
#
# global functions and operations:
#
####################################

##
InstallMethod( SimplicialFaces,
        "for homalg simplicial complexes",
        [ IsHomalgSimplicialComplex, IsInt ],
        
  function( C, i )
    
    if IsBound(C!.(String(i))) then
        return C!.(String(i));
    else
        return [ ];
    fi;
    
end );

##
InstallGlobalFunction( SimplicialComplex,
  function( arg )
    local nargs, L, cmax, dim, cmin, mx, ar3, C, i, c, p, b, SC;
    
    nargs := Length( arg );
    
    if nargs > 0 then
        L := arg[1];
    else
        Error( "empty input\n" );
    fi;
    
    if Length( L ) > 0 then
        cmax := Maximum( List( L, Length ) ) - 1;
    else
        cmax := -1;
    fi;
    
    dim := cmax;
    
    if nargs > 1 then
        if IsInt( arg[2] ) then
            ## C[d] := [] for all d > dim
            dim := arg[2];
        elif not IsString( arg[2] ) then
            Error( "wrong second argument!\n" );
        fi;
    fi;
    
    cmin := 0;
    
    mx := dim;
    
    if nargs > 2 then
        ar3 := arg[3];
        if IsInt( ar3 ) and ar3 >= -1 then
            mx := ar3;
        elif IsList( ar3 ) and Length( ar3 ) = 2 and ForAll( ar3, IsInt ) then
            if ar3[1] <= ar3[2] then
                cmin := ar3[1];
                mx := ar3[2];
            else
                cmin := ar3[2];
                mx := ar3[1];
            fi;
        elif not IsString( ar3 ) then
            Error( "wrong third argument!\n" );
        fi;
    fi;
    
    C := rec( );
    
    C.(String( cmax )) := Filtered( L, a -> Length( a ) - 1 = cmax );      
    Perform( C.(String( cmax )), Sort );
    
    i := cmax - 1;
    
    while i >= Maximum( cmin, 0 ) do
        C.(String(i)) := Filtered( L, a -> Length( a ) = i + 1 );
        Perform( C.(String(i)), Sort );
        for c in C.(String(i + 1)) do
            for p in [ 1 .. i + 2 ] do
                b := ShallowCopy( c );
                Remove( b, i + 3 - p );
                if Position( C.(String(i)), b ) = fail then
                    Sort( b );
                    Add( C.(String(i)), b );
                fi;
            od;
        od;
        i := i - 1;
    od;
    
    SC := rec( );
    
    for i in [ cmin .. mx ] do
        if i <= Minimum( dim, cmax ) and i >= 0 then
            Sort( C.(String(i)) );
            SC.(String(i)) := C.(String(i));
        else
            SC.(String(i)) := [ ];
        fi;
    od;
    
    ## Objectify:
    ObjectifyWithAttributes(
            SC, TheTypeHomalgSimplicialComplex,
            Dimension, cmax );
    
    return SC;
    
end );

##
InstallGlobalFunction( SimplicialBoundaryMap,
  function( arg )
    local nargs, Cc, Cb, ZZ, R, cc, cb, d, b, one, minus_one,
          s, b_s, pos, z, i;
    
    nargs := Length( arg );
    
    if nargs > 1 then
        Cc := arg[1];
        Cb := arg[2];
    else
        Error( "too few arguments\n" );
    fi;
    
    ZZ := ALEXANDER.ring;
    
    if nargs > 2 then
        if IsHomalgRing( arg[3] ) then
            R := arg[3];
        else
            Error( "the third argument must be homalg ring!\n" );
        fi;
    else
        R := ZZ;
    fi;
    
    cc := Length( Cc );
    cb := Length( Cb );
    
    if cb = 0 then
        return HomalgZeroMatrix( cc, 0, R );
    fi;
    
    if cc = 0 then
        return HomalgZeroMatrix( 0, cb, R );
    fi;
    
    d := Length( Cc[1] );
    
    if Length( Cb[1] ) <> d - 1 then
        Error( "wrong input\n" );
    fi;
    
    b := HomalgInitialMatrix( cc, cb, R );
    
    one := One( R );
    minus_one := MinusOne( R );
    
    ## for every simplex s do
    for s in [ 1 .. cc ] do
        ## compute the boundary of s
        b_s := List( [ 1 .. d ], a -> ShallowCopy( Cc[s] ) );
        Apply( [ 1 .. d ], a -> Remove( b_s[a], a ) );
        pos := List( b_s, a -> Position( Cb, a ) );
        for i in [ 1 .. d ] do
            if IsInt( pos[i] ) then
                if IsOddInt( i ) then
                    SetMatElm( b, s, pos[i], one );	## this is not a mistake: we start couting at 1 and not at 0, therefore the (-1)^(i-1)
                else
                    SetMatElm( b, s, pos[i], minus_one );
                fi;
            fi;
        od;
    od;
    
    ResetFilterObj( b, IsInitialMatrix );
    ResetFilterObj( b, IsMutable );
    
    return b;
    
end );

##
InstallGlobalFunction( SimplicialChainMap,
  function( arg )
    local nargs, Cd, Cr, ZZ, R, cd, cr, b, one, s, pos;
    
    nargs := Length( arg );
    
    if nargs > 1 then
        Cd := arg[1];
        Cr := arg[2];
    else
        Error( "too few arguments\n" );
    fi;
    
    ZZ := ALEXANDER.ring;
    
    if nargs > 2 then
        if IsHomalgRing( arg[3] ) then
            R := arg[3];
        else
            Error( "the third argument must be homalg ring!\n" );
        fi;
    else
        R := ZZ;
    fi;
    
    cd := Length( Cd );
    cr := Length( Cr );
    
    if cr = 0 then
        return HomalgZeroMatrix( cd, 0, R );
    fi;
    
    if cd = 0 then
        return HomalgZeroMatrix( 0, cr, R );
    fi;
    
    b := HomalgInitialMatrix( cd, cr, R );
    
    one := One( R );
    
    for s in [ 1 .. cd ] do
        pos := Position( Cr, Cd[s] );
        if pos <> fail then
            SetMatElm( b, s, pos, one );
        fi;
    od;
    
    ResetFilterObj( b, IsInitialMatrix );
    ResetFilterObj( b, IsMutable );
    
    return b;
    
end );

##
InstallGlobalFunction( SimplicialData,
  function( arg )
    local nargs, CX, ZZ, xi, xi_min, xi_max, R, bx, i,
          CA, CXA, ba, bxa, iota, map, nu, C;
    
    nargs := Length( arg );
    
    if nargs > 0 then
        CX := arg[1];
    else
        Error( "too few arguments\n" );
    fi;
    
    ZZ := ALEXANDER.ring;
    
    xi := Filtered( List( NamesOfComponents( CX ), Int ), IsInt );
    
    xi_min := Minimum( xi );
    xi_max := Maximum( xi );
    
    if nargs = 1 or ( nargs = 2 and IsHomalgRing( arg[2] ) ) then
        
        if nargs > 1 then
            R := arg[2];
        else
            R := ZZ;
        fi;
        
        bx := SimplicialBoundaryMap( SimplicialFaces( CX, xi_min + 1 ), SimplicialFaces( CX, xi_min ), R );
        
        bx := HomalgComplex( HomalgMap( bx ), xi_min + 1 );
        
        for i in [ xi_min + 1 .. xi_max - 1 ] do
            Add( bx, SimplicialBoundaryMap( SimplicialFaces( CX, i + 1 ), SimplicialFaces( CX, i ), R ) );
        od;
        
        SetIsComplex( bx, true );
        
        return bx;
        
    elif nargs > 1 and IsHomalgSimplicialComplex( arg[2] ) then
        
        CA := arg[2];
        
        if nargs > 2 and IsHomalgRing( arg[3] ) then
            R := arg[3];
        else
            R := ZZ;
        fi;
        
    else
        Error( "wrong input" );
    fi;
    
    CXA := rec( );
    
    for i in [ xi_min .. xi_max ] do
        CXA.(String(i)) := Difference( SimplicialFaces( CX, i ), SimplicialFaces( CA, i ) );
    od;
    
    ## this is not really a simplicial complex but it does the job,
    ## i.e. the cokernel complex bxa below is correctly defined
    Objectify( TheTypeHomalgSimplicialComplex, CXA );
    
    bx := SimplicialData( CX, R );
    ba := SimplicialData( CA, R );
    bxa := SimplicialData( CXA, R );
    
    map := SimplicialChainMap( SimplicialFaces( CA, xi_min ), SimplicialFaces( CX, xi_min ), R );
    
    map := HomalgMap( map, CertainObject( ba, xi_min ), CertainObject( bx, xi_min ) );
    
    iota := HomalgChainMorphism( map, ba, bx );
    
    SetIsMonomorphism( iota, true );
    
    for i in [ xi_min + 1 .. xi_max ] do
        
        map := SimplicialChainMap( SimplicialFaces( CA, i ), SimplicialFaces( CX, i ), R );
        
        map := HomalgMap( map, CertainObject( ba, i ), CertainObject( bx, i ) );
        
        Add( iota, map );
        
    od;
    
    SetIsMonomorphism( iota, true );
    
    map := SimplicialChainMap( SimplicialFaces( CX, xi_min ), SimplicialFaces( CXA, xi_min ), R );
    
    map := HomalgMap( map, CertainObject( bx, xi_min ), CertainObject( bxa, xi_min ) );
    
    nu := HomalgChainMorphism( map, bx, bxa );
    
    for i in [ xi_min + 1 .. xi_max ] do
        
        map := SimplicialChainMap( SimplicialFaces( CX, i ), SimplicialFaces( CXA, i ), R );
        
        map := HomalgMap( map, CertainObject( bx, i ), CertainObject( bxa, i ) );
        
        Add( nu, map );
        
    od;
    
    SetIsEpimorphism( nu, true );
    
    C := HomalgComplex( nu );
    Add( C, iota );
    
    SetIsShortExactSequence( C, true );
    
    return C;
    
end );

##
InstallMethod( SimplicialCycle,
        "for homalg simplicial complexes",
        [ IsHomalgMatrix, IsList ],
        
  function( cycle, simplices )
    local l;
    
    l := Length( simplices );
    
    if l <> NrColumns( cycle ) then
        Error( "the cycle and the set of simplicies are incompatible\n" );
    fi;
    
    l := Filtered( [ 1 .. l ], a -> not IsZero( MatElm( cycle, 1, a ) ) );
    
    return simplices{ l };
    
end );

##
InstallMethod( SimplicialCycle,
        "for homalg simplicial complexes",
        [ IsHomalgComplex and IsGradedObject, IsHomalgSimplicialComplexRep, IsInt, IsPosInt ],
        
  function( H, C, q, i )
    
    return SimplicialCycle( GetGenerators( CertainObject( H, q ), i ), SimplicialFaces( C, q ) );
    
end );

##
InstallMethod( SimplicialCycle,
        "for homalg simplicial complexes",
        [ IsHomalgSimplicialComplexRep, IsInt, IsPosInt ],
        
  function( C, q, i )
    
    return SimplicialCycle( GetGenerators( ByASmallerPresentation( Homology( SimplicialData( C ), q ) ), i ), SimplicialFaces( C, q ) );
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( ViewObj,
        "for homalg simplicial complexes",
        [ IsHomalgSimplicialComplex ],
        
  function( o )
    
    Print( "<A simplicial ", Dimension( o ), "-complex>" );
    
end );
