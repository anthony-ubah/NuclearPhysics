% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 3
% Function Making Green's Function (E-Potential)

function [GreenMatE, Je] = MakeGreenE(rmax, nmax, p)
    dr = rmax/nmax; % Set dr.
    
    for k = 1:nmax+1
        rk = dr*k;
        for l = 1:nmax+1 % Eq. 98 and 100.
            rl = dr*l;
            if (k == 1)
                GreenMatE(k,l) = 1; 
            else
                GreenMatE(k,l) = rl/rk*heaviside(rk-rl)+ heaviside(rl-rk) + eq(k,l);
            end
            Je(l) = rl*p(rl);
        end
    end
end

