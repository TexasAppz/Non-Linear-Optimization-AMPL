set stocks;

param covar{stocks,stocks};
param expret{stocks};
param m;

### Minimizing Variance

var xVAR{stocks};

minimize ObjVAR: sum{i in stocks, j in stocks} covar[i,j]*xVAR[i]*xVAR[j];
subject to TargetVAR: sum{i in stocks} expret[i]*xVAR[i] >= 100*m;
subject to SumTo1VAR: sum{i in stocks} xVAR[i] = 100;
