% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 3
% Solve Kleing-Gordon Equation with Source

function vec_phi = SolveKG_WithSource(vec_J, GreenMat, mass, rmax, nmax)
    dr = rmax/nmax; % Set dr.
    dx = dr*mass;   % Set dx.
    
    for k = 1:nmax+1
        for l = 1:nmax+1
            integ_vec(l) = GreenMat(k,l)*vec_J(l);  % Setting up integrand vector for Newton-Coates Integrals.
        end
        
        f_1 = NumIntegrateVec(integ_vec, dx, 1, k, nmax); % Need to start indexing at 1.
        f_2 = NumIntegrateVec(integ_vec, dx, k, nmax+1, nmax); % Shift applied to nmax as upper limit.
        vec_phi(k) = (f_1+f_2)/mass;
    end
end