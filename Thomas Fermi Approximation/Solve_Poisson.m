% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 3
% Solve Poisson Equation

function vec_phi = Solve_Poisson(vec_J, GreenMat, rmax, nmax)
    dr = rmax/nmax;
    
    for k = 1:nmax+1            % Shift applied to k already
        for l = 1:nmax+1
            integ_vec(l) = GreenMat(k,l)*vec_J(l);      % Setting up integrand vector for Newton-Coates Integrals.
        end
        
        f_1 = NumIntegrateVec(integ_vec, dr, 1, k, nmax); % Need to start indexing at 1.
        f_2 = NumIntegrateVec(integ_vec, dr, k, nmax+1, nmax); % Shift applied to nmax as upper limit.
        vec_phi(k) = f_1+f_2;
    end
end