% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 5
% Fermi Energy Calculation Function

function E_Fermi = GetEFermi(mu, eA, grho, gomega, p_or_n)
    if (p_or_n == 1)       % Proton as nucleon.
        E_Fermi = mu - eA - grho - gomega;
    else            % Neutron as nucleon.
        E_Fermi = mu + grho - gomega;
    end
end