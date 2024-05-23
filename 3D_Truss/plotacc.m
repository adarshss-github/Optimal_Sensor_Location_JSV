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
    xnode = elements(i,2) ;
    ynode = elements(i,3) ;
    x1(1) = nodes(xnode,2) ;
    x1(2) = nodes(ynode,2) ;
    y1(1) = nodes(xnode,3) ;
    y1(2) = nodes(ynode,3) ;
    z1(1) = nodes(xnode,4) ;
    z1(2) = nodes(ynode,4) ;
    line(x1,y1,z1,'Color',[0 0.4470 0.7410]) ;
    hold on
    
    
end
axis equal
camup([0 1 0])
 cameratoolbar
 axis on
 f = figure(1);
 f.CurrentAxes.ZDir = 'Reverse'
 
 nacc1 = length(acc1) ;
 
 for i = 1:1:nacc1
     
     nodeacc = v(acc1(i)) ;
     I = find(vdof(:,1) == nodeacc) ;
     dir = vdof(I,2) ;
     ndno = vdof(I,3) ;
      
     x1(1) = nodes(ndno,2) ;
     y1(1) = nodes(ndno,3) ;
     z1(1) = nodes(ndno,4) ;
     
     if dir == 1
         x1(2) = x1(1) + 0.6 ;
         y1(2) = y1(1) ;
         z1(2) = z1(1) ;
     elseif dir == 2
         x1(2) = x1(1) ;
         y1(2) = y1(1) + 0.6 ;
         z1(2) = z1(1) ;
     elseif dir == 3
         x1(2) = x1(1) ;
         y1(2) = y1(1) ;
         z1(2) = z1(1)+0.6 ;
     end
     
     line(x1,y1,z1,'Color','r','LineWidth',4) ;
     hold on
     
 end
 
 nacc2 = length(acc2) ;
 
 for i = 1:1:nacc2
     
     nodeacc = v(acc2(i)) ;
     I = find(vdof(:,1) == nodeacc) ;
     dir = vdof(I,2) ;
     ndno = vdof(I,3) ;
      
     x1(1) = nodes(ndno,2) ;
     y1(1) = nodes(ndno,3) ;
     z1(1) = nodes(ndno,4) ;
     
     if dir == 1
         x1(2) = x1(1) + 0.6 ;
         y1(2) = y1(1) ;
         z1(2) = z1(1) ;
     elseif dir == 2
         x1(2) = x1(1) ;
         y1(2) = y1(1) + 0.6 ;
         z1(2) = z1(1) ;
     elseif dir == 3
         x1(2) = x1(1) ;
         y1(2) = y1(1) ;
         z1(2) = z1(1)+0.6 ;
     end
     
     line(x1,y1,z1,'Color','b','LineWidth',4) ;
     hold on
     
 end
 grid off
%  hold on
%  line([0,0.6],[0,0],[0,0],'Color','r','LineWidth',4) ;
%  line([0,0],[0,0.6],[0,0],'Color','g','LineWidth',4) ;
%  line([0,0],[0,0],[0,-0.6],'Color','b','LineWidth',4)