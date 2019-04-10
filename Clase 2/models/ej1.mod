set Nodos;
param Demanda {Nodos};
set Arcos within Nodos cross Nodos;
param c {Arcos};

param xcoord {Nodos};
param ycoord {Nodos};
set coord;
set coordenadas within coord cross coord;
param nodo{coordenadas};
 
var x {Arcos} >= 0;

minimize Costo: sum{(i,j) in Arcos} c[i,j] * x[i,j];
s.t. Balance{j in Nodos}: sum{(j,h) in Arcos} x[j,h] - sum{(i,j) in Arcos} x[i,j] = Demanda[j];
