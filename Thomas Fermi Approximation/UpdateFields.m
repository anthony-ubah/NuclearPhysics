% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% Update Fields

function fields = UpdateFields(fields,sources,densities,shared_data)
    fields = UpdateSigma(fields,densities,shared_data);
    fields.omega = SolveKG_WithSource(sources.r_grho_B, fields.green_omega, shared_data.m_omega./shared_data.hbarc, shared_data.rmax, shared_data.nmax);
    fields.rho0 = SolveKG_WithSource(sources.r_grho_3, fields.green_rho0, shared_data.m_rho./shared_data.hbarc, shared_data.rmax, shared_data.nmax);
    fields.A0 = Solve_Poisson(sources.r_grho_p, fields.green_A0, shared_data.rmax, shared_data.nmax);    
end