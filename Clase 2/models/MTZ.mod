param n;
param deposito;
set nodos := 1..n;
set arcos := {i in nodos, j in nodos : i != j};
param c {arcos};
param N := 10000;
param tiempo{arcos};
var x {arcos} binary;
var t {nodos} >= 0;


param xcoord {nodos};
param ycoord {nodos};


minimize funcion_objetivo: sum {(i, j) in arcos} c[i, j] * x[i, j];

rest_1 {i in nodos}: sum {j in nodos: (i,j) in arcos} x[i,j] =1;
rest_2 {j in nodos}: sum {i in nodos: (i,j) in arcos} x[i,j] =1;
rest_3 {(i,j) in arcos : j != deposito}: t[j] >= t[i] + 1 - N*(1 - x[i,j]);
