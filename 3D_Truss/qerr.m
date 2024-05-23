function [err,errT]  = qerr(Amat,W,n)

[mAmat,nAmat] = size(Amat) ;
C = zeros(nAmat,nAmat) ;
[U,S,V] = svd(Amat) ;

for i = 1:1:n
    for j = 1:1:n
        alpha = U(:,i)'*inv(W)*U(:,j) ;
        C = C + alpha*(V(:,i)*V(:,j)')/(S(i,i)*S(j,j)) ;
    end
end

err = diag(C) ;
err = err(1:n) ;
errT = sum(err) ;
        

end