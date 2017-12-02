% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% Meson Potential

function mpe = MesonPotentialEnergy(meson, r_grho, rmax, nmax)
    dr = rmax/nmax;
    r = 0:dr:rmax;
    integrand = 2*pi.*meson.*r.*r_grho;
    mpe = NumIntegrateVec(integrand,dr,1,nmax+1,nmax);
end