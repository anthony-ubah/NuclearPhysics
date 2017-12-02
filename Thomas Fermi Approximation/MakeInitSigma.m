% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 6
% Calculate Initial Sigma Field

function fields = MakeInitSigma(shared_data,densities,fields)
    tol = 1.0e-10;
    iter_max = 150;    
    fields.sigma = (densities.rho_p + densities.rho_n).*shared_data.g_sigma./((shared_data.m_sigma/shared_data.hbarc).^2);
    PFermi_p = (3.*pi.^2.*densities.rho_p).^(1/3);
    PFermi_n = (3.*pi.^2.*densities.rho_n).^(1/3);
    
    for iter = 1:100
        sigma_prev = fields.sigma;
        mp_eff = shared_data.m_proton./shared_data.hbarc - shared_data.g_sigma.*sigma_prev;
        mn_eff = shared_data.m_neutron./shared_data.hbarc - shared_data.g_sigma.*sigma_prev;

        rho_sp = ScalarDensity(mp_eff, PFermi_p);
        rho_sn = ScalarDensity(mn_eff, PFermi_n);
        fields.sigma = (rho_sp+rho_sn).*(shared_data.g_sigma./(shared_data.m_sigma./shared_data.hbarc).^2);
        err = abs((sigma_prev-fields.sigma)./fields.sigma);
        
        if err<tol
            break;
        end
        
        if(iter == iter_max)
            error('Iteration did not converge.');
            break;
        end
    end
end