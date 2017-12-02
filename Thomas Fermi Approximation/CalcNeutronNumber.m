% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% Calculate Neutron Number

function [nnum,densities] = CalcNeutronNumber(shared_data,fields,densities,mu_n)
    dr = shared_data.rmax/shared_data.nmax;
    r = 0:dr:shared_data.rmax;
    densities.rho_n = GetRho(mu_n, fields.sigma, fields.rho0, fields.omega, fields.A0, shared_data.nmax, shared_data.rmax, shared_data, 0);
    f = pnumIntegral(r,densities.rho_n);
    nnum = 4*pi*NumIntegrateVec(f,dr,1,shared_data.nmax+1,shared_data.nmax);
end