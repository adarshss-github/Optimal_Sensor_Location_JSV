function [Amat] = AmatCalc(comb,n,modn,Phi,Psi,w,zeta)

totSens = size(comb,2) ;
lmodn = size(modn,2) ;
Amat = zeros(totSens,3*lmodn) ;

nst = 1:n(1) ;
na = (nst(end)+1): (nst(end) + n(2)) ;

Amat(nst(1):nst(end),1:lmodn) = Psi(comb( nst(1):nst(end) ),modn) ;

Amat(na(1):na(end),2*lmodn+1:3*lmodn) = Phi(comb( na(1):na(end) ),modn) ;

for i = 1:1:length(na)
   
    for j = 1:1:lmodn
        
        Amat(na(i),j) = -Phi(comb(na(i)),modn(j))*w(modn(j))^2 ;
         Amat(na(i),j+lmodn) = -2*Phi(comb(na(i)),modn(j))*w(j)*zeta(modn(j)) ;
    
    end
    
   
end






end
