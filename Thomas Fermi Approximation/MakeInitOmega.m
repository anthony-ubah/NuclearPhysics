% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 6
% Calculate Initial Omega Field

function fields = MakeInitOmega(shared_data,sources,fields,densities)
    dr = shared_data.rmax/shared_data.nmax;
    r = 0:dr:shared_data.rmax;
    fields.omega = sources.r_grho_B./(r.*(shared_data.m_omega./shared_data.hbarc).^2);
    fields.omega(1) = fields.omega(2);
end