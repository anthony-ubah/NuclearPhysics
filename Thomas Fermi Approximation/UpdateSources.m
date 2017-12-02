% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 6
% Update Sources

function src = UpdateSources(shared_data,densities,src)
    dr = shared_data.rmax/shared_data.nmax;
    r = 0:dr:shared_data.rmax;
    src.r_grho_B = shared_data.g_omega.*r.*(densities.rho_p + densities.rho_n);
    src.r_grho_3 = shared_data.g_rho.*r.*(densities.rho_p - densities.rho_n);
    src.r_grho_p = shared_data.e_EM.*r.*densities.rho_p;
end