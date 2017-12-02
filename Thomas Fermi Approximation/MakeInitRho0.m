% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 6
% Calculate Initial Rho0 Field

function fields = MakeInitRho0(shared_data,src,fields,densities)
    dr = shared_data.rmax/shared_data.nmax;
    r = 0:dr:shared_data.rmax;
    fields.rho0 = src.r_grho_3./(r.*(shared_data.m_rho./shared_data.hbarc).^2);
    fields.rho0(1) = fields.rho0(2);
end