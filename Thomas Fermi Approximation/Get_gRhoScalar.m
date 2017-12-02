% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% Get Scalar Source

function r_grho_S = Get_gRhoScalar(sigma,rho_p,rho_n,shared_data)
    dr = shared_data.rmax/shared_data.nmax;
    r = 0:dr:shared_data.rmax;
    
    Pf_p = (3.*pi.^2.*rho_p).^(1/3);
    Pf_n = (3.*pi.^2.*rho_n).^(1/3);
    mp_eff = shared_data.m_proton./shared_data.hbarc - shared_data.g_sigma.*sigma;
    mn_eff = shared_data.m_neutron./shared_data.hbarc - shared_data.g_sigma.*sigma;
    
    rho_sp = ScalarDensity(mp_eff, Pf_p);
    rho_sn = ScalarDensity(mn_eff, Pf_n);
    r_grho_S = r.*shared_data.g_sigma.*(rho_sp + rho_sn);
end