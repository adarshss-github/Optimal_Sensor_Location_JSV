close all
for i = 1:1:8
    
    x = nodes(i,2) ;
    y = nodes(i,3) ;
    scatter(x,y,'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerFaceColor',[0.6350 0.0780 0.1840]) ;
    hold on
    
end
  
x1 = zeros(2,1) ;
y1 = zeros(2,1) ;

for i = 1:1:13
    xnode = elements(i,2) ;
    ynode = elements(i,3) ;
    x1(1) = nodes(xnode,2) ;
    x1(2) = nodes(ynode,2) ;
    y1(1) = nodes(xnode,3) ;
    y1(2) = nodes(ynode,3) ;
   
    line(x1,y1,'Color',[0 0.4470 0.7410],'LineWidth',2) ;
    hold on
    
    
end
axis equal
axis off

 