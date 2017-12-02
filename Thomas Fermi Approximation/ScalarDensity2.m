% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 6
% Calculating Scalar Density

function rho_s = ScalarDensity2(m_eff, pf)
    Ef = sqrt(pf.^2 + m_eff.^2);
    rho_s = m_eff.*(pf.*Ef - m_eff.*m_eff.*asinh(pf./m_eff))./2./pi./pi;
end