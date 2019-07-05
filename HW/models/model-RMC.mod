param num_nodos;
set N := 1..num_nodos;
set A within {N,N};

param d{N} default 0;
param c{A};
param coord_x{N};
param coord_y{N};

var x {A} >= 0;

minimize z: 
	sum{(i,j) in A} c[i,j] * x[i,j];

s.t. 
	r01{j in N}: sum{(j,k) in A} x[j,k] - sum{(i,j) in A} x[i,j] = d[j];
