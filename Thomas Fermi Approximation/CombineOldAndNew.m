% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% Combine Old and New Fractions

function [densities, err] = CombineOldAndNew(densities,shared_data,p_or_n)
    if p_or_n   % Proton case.
        densities.rho_p = shared_data.new_frac*densities.rho_p + shared_data.old_frac*densities.rho_p_prev;
        err = norm(densities.rho_p - densities.rho_p_prev)./norm(densities.rho_p);
        densities.rho_p_prev = densities.rho_p;
    else        % Neutron case.
        densities.rho_n = shared_data.new_frac*densities.rho_n + shared_data.old_frac*densities.rho_n_prev;
        err = norm(densities.rho_n - densities.rho_n_prev)./norm(densities.rho_n);
        densities.rho_n_prev = densities.rho_n; 
    end
end