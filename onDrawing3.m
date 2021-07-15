%%%Author: Muhammad Shadi Hajar  <m.hajar@rgu.ac.uk> <msh.syr@gmail.com>
function onDrawing3(m_rrt)
m_rrt = transpose(m_rrt);

ltms1 = m_rrt(1,1:10);

ltms2 = m_rrt(2,1:10);


re = m_rrt(3,1:10);


rar = m_rrt(4,1:10);




x=[10 20 30 40 50 60 70 80 90 100]; 

figure
h1=plot(x,re,'-.d','Color','r');
xlabel('Packet drop %'); 
ylabel('On-off detection %');
hold on
h2=plot(x,rar,':+','Color','m');
h3=plot(x,ltms1,'-o','Color','g');
h4=plot(x,ltms2,'--*','Color','b');
legend([h1,h2,h3,h4],{'ReTrust','RaRTrust','LTMS(1)','LTMS(2)'},'location','southeast');
title("On period = 50");

