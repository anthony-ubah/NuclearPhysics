% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% Charge Density

function rho_c = GetRhoCharge(shared_data,rho_p)
    dr = shared_data.rmax/shared_data.nmax;
    r = 0:dr:shared_data.rmax;
    rprime = 0:dr:shared_data.rmax;
    r0 = 0.6532;
%    exp(-(r.^2+r.^2)./(r0.^2))
    for i = 1:shared_data.nmax+1
        integrand = (4.*pi./((sqrt(pi).*r0).^3)).*exp(-(rprime.^2 + r(i).^2)./(r0.^2)).*rprime.^2.*SinhXoverX(2.*r(i).*rprime./(r0.^2)).*rho_p;
        rho_c(i) = NumIntegrateVec(integrand,dr,1,shared_data.nmax+1,shared_data.nmax);
    end
end