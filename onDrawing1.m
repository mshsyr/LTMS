%%%Author: Muhammad Shadi Hajar  <m.hajar@rgu.ac.uk> <msh.syr@gmail.com>
% The Drawing function for the first experiment
function onDrawing1(m_rrt)
m_rrt = transpose(m_rrt);

ltms1_1 = m_rrt(1,1:4);
ltms1_2 = m_rrt(1,5:8);
ltms1_3 = m_rrt(1,9:12);
ltms1_4 = m_rrt(1,13:16);

ltms2_1 = m_rrt(2,1:4);
ltms2_2 = m_rrt(2,5:8);
ltms2_3 = m_rrt(2,9:12);
ltms2_4 = m_rrt(2,13:16);

re_1 = m_rrt(3,1:4);
re_2 = m_rrt(3,5:8);
re_3 = m_rrt(3,9:12);
re_4 = m_rrt(3,13:16);

rar_1 = m_rrt(4,1:4);
rar_2 = m_rrt(4,5:8);
rar_3 = m_rrt(4,9:12);
rar_4 = m_rrt(4,13:16);


x=[10 20 30 40]; 


figure
h1=plot(x,re_1,'-.d','Color','r');
xlabel('On-off attack Period [s]'); 
ylabel('On-off detection %');
hold on
h2=plot(x,rar_1,':+','Color','m');
h3=plot(x,ltms1_1,'-o','Color','g');
h4=plot(x,ltms2_1,'--*','Color','b');
legend([h1,h2,h3,h4],{'ReTrust','RaRTrust','LTMS(1)','LTMS(2)'},'location','southeast');
title("\mu = 1");

figure
h1=plot(x,re_2,'-.d','Color','r');
xlabel('On-off attack Period [s]'); 
ylabel('On-off detection %');
hold on
h2=plot(x,rar_2,':+','Color','m');
h3=plot(x,ltms1_2,'-o','Color','g');
h4=plot(x,ltms2_2,'--*','Color','b');
legend([h1,h2,h3,h4],{'ReTrust','RaRTrust','LTMS(1)','LTMS(2)'},'location','southeast');
title("\mu = 2");

figure
h1=plot(x,re_3,'-.d','Color','r');
xlabel('On-off attack Period [s]'); 
ylabel('On-off detection %');
hold on
h2=plot(x,rar_3,':+','Color','m');
h3=plot(x,ltms1_3,'-o','Color','g');
h4=plot(x,ltms2_3,'--*','Color','b');
legend([h1,h2,h3,h4],{'ReTrust','RaRTrust','LTMS(1)','LTMS(2)'},'location','southeast');
title("\mu = 10");

figure
h1=plot(x,re_4,'-.d','Color','r');
xlabel('On-off attack Period [s]'); 
ylabel('On-off detection %');
hold on
h2=plot(x,rar_4,':+','Color','m');
h3=plot(x,ltms1_4,'-o','Color','g');
h4=plot(x,ltms2_4,'--*','Color','b');
legend([h1,h2,h3,h4],{'ReTrust','RaRTrust','LTMS(1)','LTMS(2)'},'location','southeast');
title("\mu = 100");

