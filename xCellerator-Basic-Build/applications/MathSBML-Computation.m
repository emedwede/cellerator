(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



conservationMatrix[s_]:= Module[{echelon,x,y,location,i, prel0,l0, l0t,\[Gamma], A, B},
(*<<LinearAlgebra`MatrixManipulation` (* Loading MatrixManipulation *) *) 

If[!MatrixQ[s], Print["Error: conservationMatrix: input is not a matrix."]; Return[s];];

\[Gamma] = Transpose[NullSpace[Transpose[s]]];
Return[\[Gamma]]; 



If[MatrixRank[s]<Length[s], (* If there exist linearly dependent rows *)

echelon=RowReduce[Transpose[s]];
x=MatrixRank[Transpose[s]];
y=Length[Transpose[s]];
prel0=Drop[echelon, {x+1,y}];

location=0;
For[i=1, i<=Length[prel0],i++, If[prel0[[i,i]]==1, location++;];];

l0t=Drop[prel0, None, location];
l0=Transpose[l0t];

A = -l0; 
B = IdentityMatrix[Length[l0]]; 
Print["A=", A]; 
Print["B=", B]; 
Print[AppendRows[A,B]]; 

\[Gamma]=AppendRows[-l0, IdentityMatrix[Length[l0]]];,

\[Gamma]=IdentityMatrix[Length[s]];(* Else case *)

];(* End if *)
Return[\[Gamma]]; (* Returning conservation matrix *)
];




LTPrint["Loaded Computation."]
