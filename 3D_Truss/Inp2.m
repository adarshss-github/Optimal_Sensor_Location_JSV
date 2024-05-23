




load('Comb2525.mat')

mcomb = size(comb,1) ;
errT = zeros(mcomb,1) ;

for i = 1:1:mcomb
    
    [Amat] = AmatCalc(comb(i,:),n,modn,Phi,Psi,w,zeta) ;
    [~,errT(i,1)]  = qerr(Amat,W,nmode) ;
    
    
end

[errTSort,IerrTSort] = sort(errT) ;

comb = zeros(10000,40) ;

for i = 1:1:10000
    comb(i,1:20) = randperm(128,20) ;
    comb(i,21:40) = randperm(122,20) ;
end

comb = zeros(10000,10) ;

for i = 1:1:10000
    comb(i,1:5) = randperm(128,5) ;
    comb(i,6:10) = randperm(122,5) ;
end


W = ones(40,1) ;
W(21:30) = 10 ;
W(30:end) = 8 ;
W = diag(W) ;
n = [20,20] ;

load('Allplot.mat')
stem(2*(errTall(:,1)),errTall(:,2)/max(errTall(:,2)),'Filled','LineStyle','-.','LineWidth',1.5) ;
xlabel('No. of sensors','interpreter','latex','fontsize',14)
ylabel('Normalized total variance of $q(t)$    [$m^{2}$]','interpreter','latex','fontsize',14)
title('\textbf{Variance vs total no. of sensors}','interpreter','latex')
xlim([10,60])
ax = gca;
ax.FontSize = 16;

stem(ALLGA(:,1),ALLGA(:,2)/max(ALLGA(:,2)),'Filled','LineStyle','-.','LineWidth',1.5) ;
xlabel('No. of sensors','interpreter','latex','fontsize',14)
ylabel('Normalized total variance of $q(t)$    [$m^{2}$]','interpreter','latex','fontsize',14)
title('\textbf{No. of sensors vs variance }','interpreter','latex')
xlim([12,72])
xticks([12,24,36,48,60,72])
ax = gca;
ax.FontSize = 16;

load('FinalModel.mat', 'elements')
load('FinalModel.mat', 'nodes')



