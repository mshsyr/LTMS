%%%Author: Muhammad Shadi Hajar  <m.hajar@rgu.ac.uk> <msh.syr@gmail.com>
%%%This file contains the last improvement of rrt function to defeat on-off
function trust = ltms2(R, W)
%Initialization

lambda = 0.9; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Aging 
t=length(R);
threshold=0.5;
alpha_rrt=zeros(t,1);
beta_rrt=zeros(t,1);
e_rrt=zeros(t,1);
alpha_rrt(1)=R(1);
b_rrt(1)=0;
beta_rrt(1)=W(1);
d_rrt(1)=0;
e_rrt(1)=0.5;
malicious = 0;
period = 0;
trust=zeros(t,1);
trust(1) = 0.5;





%Loop
for c=2:t
    if b_rrt(c-1)<=0 && d_rrt(c-1)>0            %% Attack Indicator
       [e_rrt(c), alpha_rrt(c), beta_rrt(c), b_rrt(c), d_rrt(c)] = novelUpdating(R(c), W(c), alpha_rrt(c-1), beta_rrt(c-1), b_rrt(c-1), d_rrt(c-1), lambda);  
    
    else
       [e_rrt(c), alpha_rrt(c), beta_rrt(c), b_rrt(c), d_rrt(c)] = normalUpdating(R(c), W(c), alpha_rrt(c-1), beta_rrt(c-1), b_rrt(c-1), d_rrt(c-1), lambda);
        
    end
    [malicious, period] = onOffDetector(malicious, period, e_rrt(c-1), e_rrt(c), c, threshold);
    
    if period > 0 && trust(c-1) < 0.85
       %B = [mean(e_rrt(c-period/4:c-period)), mean(e_rrt(c-period/2:c-period/4)), mean(e_rrt(c-3*period/4:c-period/2)), mean(e_rrt(c-period:c-3*period/4)), e_rrt(c)];
       %B = [mean(e_rrt(c-period:c-3*period/4)), e_rrt(c)];
       %B = [mean(e_rrt(c-period:c)), e_rrt(c)];
       %B = e_rrt(c);
       sum = 0;
       for n=c-period:c
           sum = e_rrt(n) + sum;
       end
       B = [sum/period e_rrt(c)];
       trust(c) = min(B);
    else
       trust(c) = e_rrt(c);
       period = 0;
    end
    
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Novel Updating
function [e_rrt, alpha_post, beta_post, b_post, d_post] = novelUpdating(R, W, alpha_pre, beta_pre, b_pre, d_pre, lambda)
alpha_post=lambda*(alpha_pre+b_pre)+R;
b_post=alpha_post-alpha_pre; 
beta_post=lambda*(beta_pre+d_pre)+W;
d_post=beta_post-beta_pre;
if alpha_post<=0
    e_rrt = 0;
else
    e_rrt = alpha_post./(alpha_post+beta_post);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Normal Updating
function [e_rrt, alpha_post, beta_post, b_post, d_post] = normalUpdating(R, W, alpha_pre, beta_pre, b_pre, d_pre, lambda)
alpha_post=lambda*(alpha_pre)+R;
b_post=alpha_post-alpha_pre; 
beta_post=lambda*(beta_pre)+W;
d_post=beta_post-beta_pre;
if alpha_post<=0
    e_rrt = 0;
else
    e_rrt = alpha_post./(alpha_post+beta_post);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%on off detector
function [m, period] = onOffDetector(m, period, e_pre, e_post, c, threshold)
if e_pre >= threshold && e_post < threshold
   if m > 0
      period = c - m;
      m = 0;
   else
      m = c;
   end
end
end

  