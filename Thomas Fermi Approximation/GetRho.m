% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 5
% Nucleon Density Function

function rhopn = GetRho(mu, sigma, rho0, omega, A0, nmax, rmax, const_data, p_or_n)
    % Setting up radius vector and global constants.
    dr = rmax/nmax;
    r = 0:dr:rmax;
    eA = const_data.e_EM.*A0;
    grho = const_data.g_rho.*rho0;
    gomega = const_data.g_omega.*omega;
    
    % Calculate Fermi Enery and Fermi Momentum.
    E_Fermi = GetEFermi(mu, eA, grho, gomega, p_or_n);
    if (p_or_n == 1)       % Proton case.
        m_eff = const_data.m_proton/const_data.hbarc - const_data.g_sigma.*sigma;
    else            % Neutron case.
        m_eff = const_data.m_neutron/const_data.hbarc - const_data.g_sigma.*sigma;
    end
    
    P_Fermi = GetPFermi(E_Fermi,m_eff);
    rhopn = (P_Fermi.^3)./(3*pi.^2);          % Populate rhopn vector.
end