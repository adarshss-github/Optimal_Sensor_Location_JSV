
% GENETIC ALGORITHM CODE
%==================================================================

%%PROGRAM CONTROLS
%%----------------

load('Comb3636.mat')
load('Data.mat')
N = 500 ; % Total number of generations
ns = 100 ; % No. of combinations to be retained

%==================================================================

nmode = length(modn) ;
errTSort = errTSort(1:ns,:) ;
comb = comb(IerrTSort,:) ;
clear IerrTSort ;
comb = comb(1:ns,:) ;

[~,ncomb] = size(comb) ;

intpart = fix((ncomb*0.5)/2) ;

endsens = (ncomb*0.5) ;



for k = 1:1:N
    
newcomb = zeros(ns,ncomb) ;
errT = zeros(ns,1) ;

for i = 1:1:ns
    
strcombdum = comb(i,1:endsens) ;
acccombdum = comb(i,endsens+1:ncomb) ;

for j = 1:1:intpart
    
    strcombdum(2*j) = 0 ;
    acccombdum(2*j) = 0 ; 
    
end

for j = 1:1:intpart
    
    strcombdum(2*j) = randi(128,1) ;
    vdum1 = nnz(strcombdum) ;
    vdum2 = nonzeros(strcombdum) ;
    vdum2 = unique(vdum2) ;
    vdum2 = length(vdum2) ;
    
    while vdum1~=vdum2
        strcombdum(2*j) = randi(128,1) ;
        vdum1 = nnz(strcombdum) ;
    vdum2 = nonzeros(strcombdum) ;
    vdum2 = unique(vdum2) ;
    vdum2 = length(vdum2) ;
    end
    
    
end


for j = 1:1:intpart
    
    acccombdum(2*j) = randi(122,1) ;
    vdum1 = nnz(acccombdum) ;
    vdum2 = nonzeros(acccombdum) ;
    vdum2 = unique(vdum2) ;
    vdum2 = length(vdum2) ;
    
    while vdum1~=vdum2
        acccombdum(2*j) = randi(122,1) ;
        vdum1 = nnz(acccombdum) ;
    vdum2 = nonzeros(acccombdum) ;
    vdum2 = unique(vdum2) ;
    vdum2 = length(vdum2) ;
    end
    
    
end
    
    
   newcomb(i,1:endsens)  = strcombdum ;
   newcomb(i,endsens+1:ncomb)  = acccombdum ;
    
    
    
    
    
end

for i = 1:1:ns
    
    [Amat] = AmatCalc(newcomb(i,:),n,modn,Phi,Psi,w,zeta) ;
    [~,errT(i,1)]  = qerr(Amat,W,nmode) ;
    
    
end


comb = [comb;newcomb] ;
errTSort = [errTSort;errT] ;
[newerrTSort,newIerrTSort] = sort(errTSort) ;
comb = comb(newIerrTSort,:) ;
errTSort = errTSort(newIerrTSort) ;
comb = comb(1:ns,:) ;
errTSort = errTSort(1:ns) ;


end

clear acccombdum Amat endsens errT i intpart j k modn n N ncomb newcomb...
    newerrTSort newIerrTSort nmode ns Phi Psi strcombdum vdum1 vdum2 w W zeta

