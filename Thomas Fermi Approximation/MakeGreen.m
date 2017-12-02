% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 3
% Function Making Green's Function

function [GreenMat, J] = MakeGreen(mass, rmax, nmax, p)
    dr = rmax/nmax; % Set dr.
    dx = dr*mass; % Set dx.
    flag = 0;
    
    for k = 1:nmax+1
        xk = dx*(k-1);
        for l = 1:nmax+1 % Eqs. 87 and 89 place here.
            xl = (l-1)*dx;
            if (k == 1)
                GreenMat(k,l) = exp(-xl); 
            else
                GreenMat(k,l) = 1/xk*(exp(-xk)*sinh(xl)*heaviside(k-l)+exp(-xl)*sinh(xk)*heaviside(l-k)+exp(-xk)*sinh(xk)*eq(k,l));
            end
            
            if (flag == 0)
                J(l) = xl/mass*p(xl/mass);
            end
        end
        flag = 1;
    end
end