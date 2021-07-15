%%%Author: Muhammad Shadi Hajar  <m.hajar@rgu.ac.uk> <msh.syr@gmail.com>
function [n_e_ltms1, n_e_ltms2, n_e_retrust, n_e_rartrust] = onOffMetric(e_ltms1, e_ltms2, e_retrust, e_rartrust, threshold, t)
n_e_ltms1 = 0;
n_e_ltms2 = 0;
n_e_retrust = 0;
n_e_rartrust = 0;

for c=50:t
    if e_ltms1(c) < threshold
       n_e_ltms1 = n_e_ltms1 + 1;
    end
    if e_ltms2(c) < threshold
       n_e_ltms2 = n_e_ltms2 + 1;
    end
    if e_retrust(c) < threshold
       n_e_retrust = n_e_retrust + 1;
    end
    if e_rartrust(c) < threshold
       n_e_rartrust = n_e_rartrust + 1;
    end
end