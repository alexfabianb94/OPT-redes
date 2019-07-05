param num_temp;
param num_sem;
param num_meses;
param costo_diario_electricidad;

set T := 1..num_temp;
set S := 1..num_sem;
set Q := 1..num_meses;
set M{Q};

param C{T};
param U{T,S};
param CF{T};
param CV{T,S};
param TP{T};
param PF{T,S};
param PV{T,S};
param A{T};
#param CL{T,S};
param CE{t in T} := costo_diario_electricidad * 7 * num_sem;
param CM{T};
param CR{T};
param B;
param D{T,S};
param CT{T,S};
param CAP;
param BM;
#param G;
param SP;
param TR;
param DIS{T,Q} binary;

var X{T,S} >= 0;
var F{T} integer >= 0;
var V{T,S} integer >= 0;
var L{T,S} >= 0;
var HM{T} >= 0;
var Y{T,S} integer >= 0;
var NS{T} integer >= 0;
var NP{T} integer >= 0;
var NC{T} integer >= 0;
var NB{T,S};


maximize FO :   sum {t in T, s in S} U[t,s] * X[t,s] - 
                sum {t in T} C[t] * NP[t] -
                sum {t in T} CF[t] * F[t] -
                sum {t in T} CR[t] * NC[t] -
                sum {t in T, s in S} CE[t] * NS[t] -
                sum {t in T} CM[t] * HM[t] -
                sum {t in T, s in S} CV[t,s] * V[t,s] - 
                sum {t in T, s in S} CT[t,s] * Y[t,s];

#minimize FO : sum {t in T} CR[t] * NC[t] ;

s.t.
    rest_1  {t in T}: NP[t] <= CAP * NC[t];
    rest_2  {t in T}: sum {i in T: i <= t} NC[i] <=  A[t] ;
    rest_3  {t in T, s in S}: X[t,s] <= D[t,s];
    rest_4  {t in T, q in Q}: sum {s in M[q]} X[t,s] <= sum {i in T : i <= t} TP[t-i+1] * DIS[t-i+1,q] * NP[i];
    rest_5  {t in T, s in S}: X[t,s] <= B * NB[t,s];
    rest_6  {t in T, s in S}: X[t,s] <= PF[t,s] * F[t] + PV[t,s] * V[t,s];
    rest_7  {t in T, s in S}: NB[t,s] <= BM * Y[t,s]; 
    rest_8  {t in T}: NC[t] * TR <= HM[t];
    #rest_9  {t in T, s in S}: NS[t] * G <= L[t,s];
    rest_10 {t in T}: sum {i in T: i <= t} NC[i] <= SP * NS[t];
    rest_11 {t in T}: F[t] >= 1;



    

