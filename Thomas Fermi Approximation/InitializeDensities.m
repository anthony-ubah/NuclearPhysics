% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 6
% Initialize Densities

function densities = InitializeDensities(shared_data,densities)
    dr = shared_data.rmax/shared_data.nmax;
    r = 0:dr:shared_data.rmax;
    R_A = 1.12.*shared_data.A.^(1/3);
    a = 0.6;
    
    norm = WoodsSaxonNorm(shared_data.A,shared_data.rmax,shared_data.nmax);
    fp = WoodsSaxon(R_A,a);
    fn = WoodsSaxon(R_A,a);
    
    densities.rho_p = fp(r).*shared_data.Z./norm;
    densities.rho_n = fn(r).*shared_data.N./norm;
    densities.rho_p_prev = densities.rho_p;
    densities.rho_n_prev = densities.rho_n;
end