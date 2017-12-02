% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% Update Sigma

function fields = UpdateSigma(fields, densities, shared_data)
    dr = shared_data.rmax/shared_data.nmax;
    iter_max = 100;
    tol = 10e-10;
    
    for iter = 1:iter_max
        sigma_prev = fields.sigma;
        r_grho_S = Get_gRhoScalar(fields.sigma, densities.rho_p, densities.rho_n, shared_data);
        fields.sigma = SolveKG_WithSource(r_grho_S,fields.green_sigma,shared_data.m_sigma./shared_data.hbarc,shared_data.rmax,shared_data.nmax);
        err = norm(fields.sigma-sigma_prev)./norm(fields.sigma);
        
        if err < tol
            break;
        end
        
        if iter == iter_max
            error("Procedure did not converge.");
        end
    end
end