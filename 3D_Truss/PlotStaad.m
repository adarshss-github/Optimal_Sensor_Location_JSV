close all
for i = 1:1:46
    
    x = nodes(i,2) ;
    y = nodes(i,3) ;
    z = nodes(i,4) ;
    scatter3(x,y,z,'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerFaceColor',[0.6350 0.0780 0.1840]) ;
    hold on
    
end
  
x1 = zeros(2,1) ;
y1 = zeros(2,1) ;
z1 = zeros(2,1) ;

for i = 1:1:128
    xnode = elements(i,4:6) ;
    ynode = elements(i,7:9) ;
    x1(1) = xnode(1) ;
    x1(2) = ynode(1) ;
    y1(1) = xnode(2) ;
    y1(2) = ynode(2) ;
    z1(1) = xnode(3) ;
    z1(2) = ynode(3) ;
    line(x1,y1,z1,'Color',[0 0.4470 0.7410],'LineWidth',2) ;
    hold on
    
    
end
axis equal
camup([0 1 0])
 cameratoolbar
 axis on