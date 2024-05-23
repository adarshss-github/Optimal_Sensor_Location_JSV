dum = zeros(128,1) ;
elements = [elements dum] ;
l = 0 ;

%Length of members
for i = 1:1:128
    
    l = sqrt( ( nodes(elements(i,2),2)- nodes(elements(i,3),2))^2 + ...
       ( nodes(elements(i,2),3)- nodes(elements(i,3),3))^2 + ...
       ( nodes(elements(i,2),4)- nodes(elements(i,3),4))^2 ) ;
   elements(i,4) = l ;
    
end

%Stiffness Matrix Calculation

K = zeros(46*3,46*3) ;

for i = 1:1:128
    
    L = elements(i,4) ;
    k = (elements(i,5)*200e9)/L ;
    cx = (nodes(elements(i,3),2) - nodes(elements(i,2),2) )/L ;
    cy = (nodes(elements(i,3),3) - nodes(elements(i,2),3) )/L ;
    cz = (nodes(elements(i,3),4) - nodes(elements(i,2),4) )/L ;
    c = [cx^2 cx*cy cx*cz; cx*cy cy^2 cy*cz; cx*cz cy*cz cz^2] ;
    ke = k*[c -c ; -c c] ;
    ne = [3*elements(i,2)-2,3*elements(i,2)-1,3*elements(i,2),3*elements(i,3)-2,3*elements(i,3)-1,3*elements(i,3)];
    K(ne,ne) = K(ne,ne) + ke ;
    
end
 
%Local x-axis
localaxes = zeros(128,3) ;

for i = 1:1:128
    
    x2 = nodes(elements(i,3),2:4) ;
    x1 = nodes(elements(i,2),2:4) ;
    xl = x2-x1 ;
    xl = xl/norm(xl) ;
    localaxes(i,1:3) = xl ;
    
    
end

n = zeros(12,1) ;

for i = 1:1:12
    n(i) = norm(vy(i,:)) ;
end

%%Mass Matrix
Ml = zeros(138,138) ;
m = zeros(6,6) ;
M = zeros(6,6) ;
zd = zeros(3,3) ;
T = zeros(6,6) ;

for i = 1:1:128
    
    m = ((elements(i,6)*elements(i,4))/6)*[2 0 0 1 0 0; 0 2 0 0 1  0; 0 0 2 0 0 1;1 0 0 2 0 0; 0 1 0 0 2 0; 0 0 1 0 0 2] ;
    Td = [localaxes(i,1:3);localaxes(i,4:6) ; localaxes(i,7:9)] ;
   T = [Td zd;zd Td] ;
   me = T'*m*T ;
   ne = [3*elements(i,2)-2,3*elements(i,2)-1,3*elements(i,2),3*elements(i,3)-2,3*elements(i,3)-1,3*elements(i,3)];
    Ml(ne,ne) = Ml(ne,ne) + me ;
    
    
end

Ml = zeros(138,138) ;
m = zeros(6,6) ;
M = zeros(6,6) ;
zd = zeros(3,3) ;
T = zeros(6,6) ;

for i = 1:1:128
    
    m = ((elements(i,6)*elements(i,4))/2)*eye(6,6) ;
    Td = [localaxes(i,1:3);localaxes(i,4:6) ; localaxes(i,7:9)] ;
   T = [Td zd;zd Td] ;
   me = T'*m*T ;
   ne = [3*elements(i,2)-2,3*elements(i,2)-1,3*elements(i,2),3*elements(i,3)-2,3*elements(i,3)-1,3*elements(i,3)];
    Ml(ne,ne) = Ml(ne,ne) + me ;
    
    
end

dum = zeros(128,1) ;
elements = [elements dum] ;
l = 0 ;

%Length of members
for i = 1:1:114
    
    l = nodes(elements(i,3),2:4) - nodes(elements(i,2),2:4) ;
    elements(i,4) = norm(l) ;
end

K = zeros(40*3,40*3) ;

for i = 1:1:114
    
    L = elements(i,4) ;
    k = ((elements(i,5)*200e9)/L)*[1 -1; -1 1] ;
    R = [localaxes(i,1:3) 0 0 0; 0 0 0 localaxes(i,1:3)] ;
    ke = R'*k*R ;
    ne = [3*elements(i,2)-2,3*elements(i,2)-1,3*elements(i,2),3*elements(i,3)-2,3*elements(i,3)-1,3*elements(i,3)];
    K(ne,ne) = K(ne,ne) + ke ;
    
end

v = [1:120]' ;
v(1) = []  ;
v(1) = []  ;
v(1) = []  ;
v(26) = []  ;
v(26) = []  ;
v(56) = []  ;
v(56) = []  ;
v(56) = []  ;
v(81) = []  ;
v(81) = []  ;
rig = zeros(120,1) ;

for i = 1:1:110
    rig(v(i)) = V(i);
end

nodesrig = zeros(40,4) ;

for i = 1:1:40
    
    nodesrig(i,1) = i ;
    nodesrig(i,2:4) = rig(3*i-2:3*i) ;
    
end

Mc = zeros(120,120) ;
m = zeros(6,6) ;
M = zeros(6,6) ;
zd = zeros(3,3) ;
T = zeros(6,6) ;

for i = 1:1:114
    
    m = ((elements(i,6)*elements(i,4))/6)*[2*eye(3,3) eye(3,3); eye(3,3) 2*eye(3,3)] ;
    Td = [localaxes(i,1:3);localaxes(i,4:6) ; localaxes(i,7:9)] ;
   T = [Td zd;zd Td] ;
   me = T'*m*T ;
   ne = [3*elements(i,2)-2,3*elements(i,2)-1,3*elements(i,2),3*elements(i,3)-2,3*elements(i,3)-1,3*elements(i,3)];
    Mc(ne,ne) = Mc(ne,ne) + me ;
    
    
end

Ml = zeros(120,120) ;
m = zeros(6,6) ;
M = zeros(6,6) ;
zd = zeros(3,3) ;
T = zeros(6,6) ;

for i = 1:1:114
    
    m = ((elements(i,6)*elements(i,4))/2)*eye(6,6) ;
    Td = [localaxes(i,1:3);localaxes(i,4:6) ; localaxes(i,7:9)] ;
   T = [Td zd;zd Td] ;
   me = T'*m*T ;
   ne = [3*elements(i,2)-2,3*elements(i,2)-1,3*elements(i,2),3*elements(i,3)-2,3*elements(i,3)-1,3*elements(i,3)];
    Ml(ne,ne) = Ml(ne,ne) + me ;
    
    
end

Mly = zeros(120,120) ;

for i = 1:1:40
    Mly(3*i-1,3*i-1) = Ml(3*i-1,3*i-1) ;
end

Philexp = zeros(120,120) ;

for i =1:1:108
    
   Philexp(v(i)) = Phil(i); 
    
end




Philexp = zeros(138,1) ;

for i =1:1:126
    
   Philexp(v(i)) = V(i,6); 
    
end

nodesPhilexp = zeros(46,4) ;

for i = 1:1:46
    
    nodesPhilexp(i,1) = i ;
    nodesPhilexp(i,2:4) = Philexp(3*i-2:3*i) ;
    
end

load('TrussModel.mat', 'nodes')
nodes = nodes + nodesPhilexp ;

[Kf ~] = boundrestr(bf,K,zeros(138,138)) ;
[V,D] = eig(Kf) ;
v = [1:138]' ;
v(1) = []  ;
v(1) = []  ;
v(1) = []  ;
v(26) = []  ;
v(26) = []  ;
v(56) = []  ;
v(56) = []  ;
v(56) = []  ;
v(81) = []  ;
v(81) = []  ;
v(83) = [] ;
v(119) = [] ;

for i = 1:1:15
    
    nodes(3*i-2,:) = elementsdum(i,1:4) ;
    nodes(3*i-1,:) = elementsdum(i,5:8) ;
    nodes(3*i,:) = elementsdum(i,9:12) ;
    
    
end

for i = 1:1:32
    
    elements(4*i-3,:) = eledum(i,1:3) ;
    elements(4*i-2,:) = eledum(i,4:6) ;
    elements(4*i-1,:) = eledum(i,7:9) ;
    elements(4*i,:) = eledum(i,10:12) ;
    
    
end

for i = 1:1:128
    
   ix =  find(nodes(:,1) == elements(i,2)) ;
    jx =  find(nodes(:,1) == elements(i,3)) ;
    elements(i,4:6) = nodes(ix,2:4) ;
    elements(i,7:9) = nodes(jx,2:4) ;
end

%%Mass Matrix
Ml = zeros(138,138) ;
m = zeros(6,6) ;

for i = 1:1:128
    
    m = ((elements(i,6)*elements(i,4))/2)*eye(6,6) ;
    ne = [3*elements(i,2)-2,3*elements(i,2)-1,3*elements(i,2),3*elements(i,3)-2,3*elements(i,3)-1,3*elements(i,3)];
    Ml(ne,ne) = Ml(ne,ne) + m ;
    
    
end

%Strain transformstion
B = zeros(128,138) ;
Bdum = zeros(1,138) ;
Ldum = zeros(6,138) ;


for i = 128:1:128
    
    Ldum = zeros(6,138) ;
    ne = [3*elements(i,2)-2,3*elements(i,2)-1,3*elements(i,2),3*elements(i,3)-2,3*elements(i,3)-1,3*elements(i,3)];
    Ldum(1,ne(1)) = 1 ;
    Ldum(2,ne(2)) = 1 ;
    Ldum(3,ne(3)) = 1 ;
    Ldum(4,ne(4)) = 1 ;
    Ldum(5,ne(5)) = 1 ;
    Ldum(6,ne(6)) = 1 ;
    Bdum = (1/elements(i,4))*[-1 1]*[localaxes(i,1:3) 0 0 0;0 0 0 localaxes(i,1:3)]*Ldum;
    B(i,1:138) = Bdum ;
    
    
end

Mdl = zeros(138,138) ;


for i = 98:105
    
    Mdl(3*elements(i,2)-1,3*elements(i,2)-1) = ((29.4*1e3)/9.81)*0.5 ;
     Mdl(3*elements(i,3)-1,3*elements(i,3)-1) = ((29.4*1e3)/9.81)*0.5 ;
    
    
    
end

Mdl(122,122) = Mdl(122,122) + ((14.7*1e3)/9.81) ;
Mdl(125,125) = Mdl(125,125) + ((14.7*1e3)/9.81) ;


for i = 10:18
    
     Mdl(3*elements(i,2)-1,3*elements(i,2)-1) = Mdl(3*elements(i,2)-1,3*elements(i,2)-1) +((0.85*1e3*elements(i,4))/9.81)*0.5 ;
     Mdl(3*elements(i,3)-1,3*elements(i,3)-1) = Mdl(3*elements(i,3)-1,3*elements(i,3)-1)+ ((0.85*1e3*elements(i,4))/9.81)*0.5 ;
    
    
    
end

for i = 48:56
    
     Mdl(3*elements(i,2)-1,3*elements(i,2)-1) = Mdl(3*elements(i,2)-1,3*elements(i,2)-1) +((0.85*1e3*elements(i,4))/9.81)*0.5 ;
     Mdl(3*elements(i,3)-1,3*elements(i,3)-1) = Mdl(3*elements(i,3)-1,3*elements(i,3)-1)+ ((0.85*1e3*elements(i,4))/9.81)*0.5 ;
    
    
    
end

Mdl(3*elements(96,2)-1,3*elements(96,2)-1) = Mdl(3*elements(96,2)-1,3*elements(96,2)-1) +((1.07*1e3*elements(96,4))/9.81)*0.5 ;
Mdl(3*elements(96,3)-1,3*elements(96,3)-1) = Mdl(3*elements(96,3)-1,3*elements(96,3)-1)+ ((1.07*1e3*elements(96,4))/9.81)*0.5 ;
   
Mdl(3*elements(97,2)-1,3*elements(97,2)-1) = Mdl(3*elements(97,2)-1,3*elements(97,2)-1) +((1.07*1e3*elements(97,4))/9.81)*0.5 ;
Mdl(3*elements(97,3)-1,3*elements(97,3)-1) = Mdl(3*elements(97,3)-1,3*elements(97,3)-1)+ ((1.07*1e3*elements(97,4))/9.81)*0.5 ;

Mdl(3*elements(106,2)-1,3*elements(106,2)-1) = Mdl(3*elements(106,2)-1,3*elements(106,2)-1) +((1.07*1e3*elements(106,4))/9.81)*0.5 ;
Mdl(3*elements(106,3)-1,3*elements(106,3)-1) = Mdl(3*elements(106,3)-1,3*elements(106,3)-1)+ ((1.07*1e3*elements(106,4))/9.81)*0.5 ;

Mdl(3*elements(107,2)-1,3*elements(107,2)-1) = Mdl(3*elements(107,2)-1,3*elements(107,2)-1) +((1.07*1e3*elements(107,4))/9.81)*0.5 ;
Mdl(3*elements(107,3)-1,3*elements(107,3)-1) = Mdl(3*elements(107,3)-1,3*elements(107,3)-1)+ ((1.07*1e3*elements(107,4))/9.81)*0.5 ;

for i = 98:105
    
     Mdl(3*elements(i,2)-1,3*elements(i,2)-1) = Mdl(3*elements(i,2)-1,3*elements(i,2)-1) +((2.14*1e3*elements(i,4))/9.81)*0.5 ;
     Mdl(3*elements(i,3)-1,3*elements(i,3)-1) = Mdl(3*elements(i,3)-1,3*elements(i,3)-1)+ ((2.14*1e3*elements(i,4))/9.81)*0.5 ;
    
    
    
end

 [Mdlf,~] = boundrestr(resdof,Mdl,zeros(138,138)) ;
     
 
 for i = 1:1:46
     
     Ml(3*i,3*i) = 0 ;
     Ml(3*i-2,3*i-2) = 0 ;
     
 end
 
 [Mlf,~] = boundrestr(resdof,Ml,zeros(138,138)) ;
 
 Mldlf = Mdlf + Mlf ;
 
 [f,w,Phi] = undmodpar(Mldlf,Kf) ;
 
 v = [1:138]' ;
v(1) = []  ;
v(1) = []  ;
v(1) = []  ;
v(26) = []  ;
v(26) = []  ;
v(56) = []  ;
v(56) = []  ;
v(56) = []  ;
v(81) = []  ;
v(81) = []  ;
v(111) = [] ;
v(113) = [] ;
v(115) = [] ;
v(117) = [] ;
v(119) = [] ;
v(121) = [] ;

 
 Phiexp = zeros(138,1) ;

for i =1:1:122
    
   Phiexp(v(i)) = Phi(i,1); 
    
end

nodesPhiexp = zeros(46,4) ;

for i = 1:1:46
    
    nodesPhiexp(i,1) = i ;
    nodesPhiexp(i,2:4) = Phiexp(3*i-2:3*i) ;
    
end

load('FinalModel.mat', 'nodes')
nodes = nodes + 0.8*nodesPhiexp ;
Plot



Phiexp = zeros(120,1) ;

for i =1:1:108
    
   Phiexp(v(i)) = Phi(i,3); 
    
end

nodesPhiexp = zeros(40,4) ;

for i = 1:1:40
    
    nodesPhiexp(i,1) = i ;
    nodesPhiexp(i,2:4) = Phiexp(3*i-2:3*i) ;
    
end

load('TrussModel2.mat', 'nodes')
nodes = nodes + nodesPhiexp ;
Plot


for i = 1:1:46
    vdof(3*i,3) = i ;
    vdof(3*i-1,3) = i ;
    vdof(3*i-2,3) = i ;
end