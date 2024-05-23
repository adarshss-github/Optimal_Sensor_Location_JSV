
clr
j = 72 ;
comb = zeros(10000,j) ;

for i = 1:1:10000
    
    comb(i,1:(0.5*j)) = randperm(128,0.5*j) ;
    comb(i,(0.5*j)+1:j) = randperm(122,0.5*j) ;
    
    
end

n = [0.5*j,0.5*j] ;

W = ones(j,1) ;
W((0.5*j)+1:(0.5*j)+(0.25*j)) = 10 ;
W((0.5*j)+(0.25*j)+1:end) = 5 ;
W = diag(W) ;

load('Data') ;

mcomb = size(comb,1) ;
errT = zeros(mcomb,1) ;

for i = 1:1:mcomb
    
    [Amat] = AmatCalc(comb(i,:),n,modn,Phi,Psi,w,zeta) ;
    [~,errT(i,1)]  = qerr(Amat,W,nmode) ;
    
    
end

[errTSort,IerrTSort] = sort(errT) ;

clear Amat  i j mcomb modn  nmode Phi Psi w zeta