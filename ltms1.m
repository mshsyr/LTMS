%%%Author: Muhammad Shadi Hajar  <m.hajar@rgu.ac.uk> <msh.syr@gmail.com>
%%%This file contains rrt_neq (where alpha maintain neqative values)
function e_rrt_neq = ltms1(R, W)
%Initialization
lambda = 0.9; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Aging 
t=length(R);
alpha_rrt_neq=zeros(t,1);
beta_rrt_neq=zeros(t,1);
e_rrt_neq=zeros(t,1);
alpha_rrt_neq(1)=R(1);
b_rrt_neq(1)=0;
beta_rrt_neq(1)=W(1);
d_rrt_neq(1)=0;
e_rrt_neq(1)=0.5;


%Loop
for c=2:t
    if b_rrt_neq(c-1)<=0 && d_rrt_neq(c-1)>0            %% Attack
    alpha_rrt_neq(c)=lambda*(alpha_rrt_neq(c-1)+b_rrt_neq(c-1))+R(c);
    b_rrt_neq(c)=alpha_rrt_neq(c)-alpha_rrt_neq(c-1); 
    beta_rrt_neq(c)=lambda*(beta_rrt_neq(c-1)+d_rrt_neq(c-1))+W(c);
    d_rrt_neq(c)=beta_rrt_neq(c)-beta_rrt_neq(c-1);
    else
    alpha_rrt_neq(c)=lambda*(alpha_rrt_neq(c-1))+R(c);
    b_rrt_neq(c)=alpha_rrt_neq(c)-alpha_rrt_neq(c-1); 
    beta_rrt_neq(c)=lambda*(beta_rrt_neq(c-1))+W(c);
    d_rrt_neq(c)=beta_rrt_neq(c)-beta_rrt_neq(c-1);   
    end

    %Processing netgative beta_rrt_neq value
    if alpha_rrt_neq(c)<=0
       e_rrt_neq(c)=0;
    else
    e_rrt_neq(c)=alpha_rrt_neq(c)./(alpha_rrt_neq(c)+beta_rrt_neq(c));
    end


end
end