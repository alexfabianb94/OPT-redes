param a {1..9,1..9,1..9} default 0;
var x {1..9,1..9,1..9}, binary;

maximize juego: sum {i in 1..9, j in 1..9, k in 1..9} x[i,j,k];

rest_1 {i in 1..9, k in 1..9}: sum {j in 1..9} (x[i,j,k] + a[i,j,k]) = 1;
rest_2 {j in 1..9, k in 1..9}: sum {i in 1..9} (x[i,j,k] + a[i,j,k]) = 1;
rest_3 {i in 1..9, j in 1..9}: sum {k in 1..9} (x[i,j,k] + a[i,j,k]) = 1;
rest_4 {m in 0..2, n in 0..2, k in 1..9}: sum {i in 3*m+1..3*(m+1), j in 3*n+1..3*(n+1)} (x[i,j,k] + a[i,j,k]) = 1;