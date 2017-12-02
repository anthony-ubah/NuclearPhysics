% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 6
% Calculating Scalar Density

function rho_s = ScalarDensity1(m_eff, pf)
    EFermi = sqrt(pf^2 + m_eff^2);
    rho_s = (m_eff^3)/(2*pi^2)*((pf*EFermi)/(m_eff^2) - log((pf + EFermi)/m_eff));
end