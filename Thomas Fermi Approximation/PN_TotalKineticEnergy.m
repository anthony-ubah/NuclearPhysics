% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% Nucleon Kinetic Energy

function nke = PN_TotalKineticEnergy(densities, fields, shared_data)
    dr = shared_data.rmax/shared_data.nmax;
    r = 0:dr:shared_data.rmax;
    
    mp_eff = shared_data.m_proton./shared_data.hbarc - shared_data.g_sigma.*fields.sigma;
    mn_eff = shared_data.m_neutron./shared_data.hbarc - shared_data.g_sigma.*fields.sigma;
    P_Fp = (3.*pi.^2.*densities.rho_p).^(1/3);
    P_Fn = (3.*pi.^2.*densities.rho_n).^(1/3);
    E_Fp = sqrt(mp_eff.^2 + P_Fp.^2);
    E_Fn = sqrt(mn_eff.^2 + P_Fn.^2);
    
    eFp = (P_Fp.*E_Fp.^3 + E_Fp.*P_Fp.^3 - mp_eff.^4.*log((P_Fp + E_Fp)./mp_eff))./(8.*pi.^2);
    eFn = (P_Fn.*E_Fn.^3 + E_Fn.*P_Fn.^3 - mn_eff.^4.*log((P_Fn + E_Fn)./mn_eff))./(8.*pi.^2);
    ke = eFp + eFn;
    
    integrand = 4.*pi.*r.^2.*ke;
    nke = NumIntegrateVec(integrand,dr,1,shared_data.nmax+1,shared_data.nmax);
end