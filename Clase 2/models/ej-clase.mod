param num_nodos;
param origen;
set N := 1..num_nodos;
set A within {N,N};

param c{A};

var x{A} binary;
var y{A} >= 0;

minimize Z:
    sum{(i,j) in A} c[i,j] * x[i,j];
s.t.    rest_1 {j in N}: sum {(i,j) in A} x[i,j] = 1;
        rest_2 {i in N}: sum {(i,j) in A} x[i,j] = 1; 
        rest_3: sum {j in N: j != origen} y[origen, j] = card(N) - 1;
        rest_4 {k in N: k != origen}: sum {i in N : i != origen} y[i,k] - sum {j in N : j != origen} y[k,j] = 1;
        rest_5 {(i,j) in A}: y[i,j] <= (card(N) -1) * x[i,j];
