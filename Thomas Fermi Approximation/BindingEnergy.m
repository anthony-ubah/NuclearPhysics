% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% Binding Energy

function bindE = BindingEnergy(fields, sources, densities, shared_data)
    dr = shared_data.rmax/shared_data.nmax;
    r = 0:dr:shared_data.rmax;

    r_grho_S = Get_gRhoScalar(fields.sigma,densities.rho_p,densities.rho_n,shared_data);
    rho_pe = MesonPotentialEnergy(fields.rho0, sources.r_grho_3, shared_data.rmax, shared_data.nmax);
    omega_pe = MesonPotentialEnergy(fields.omega, sources.r_grho_B, shared_data.rmax, shared_data.nmax);
    sigma_pe = MesonPotentialEnergy(fields.sigma, r_grho_S, shared_data.rmax, shared_data.nmax);
    A0_pe = MesonPotentialEnergy(fields.A0, sources.r_grho_p, shared_data.rmax, shared_data.nmax);
    nke = PN_TotalKineticEnergy(densities, fields, shared_data);
    
    E_dens = rho_pe + omega_pe + sigma_pe + shared_data.e_EM.*A0_pe + nke;
    bindE = (shared_data.m_proton.*shared_data.Z./shared_data.hbarc + shared_data.m_neutron.*shared_data.N./shared_data.hbarc - E_dens)./shared_data.A;
end