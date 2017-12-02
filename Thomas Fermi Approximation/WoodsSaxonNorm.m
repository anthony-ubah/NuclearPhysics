% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 6
% Woods Saxon Normalization

function norm = WoodsSaxonNorm(A,rmax,nmax)
    R_A = 1.12.*A.^(1/3);
    a = 0.6;
    dr = rmax/nmax;
    r = 0:dr:rmax;
    f = WoodsSaxon(R_A, a);
    integ = 4.*pi.*r.^2.*f(r);
    norm = NumIntegrateVec(integ,dr,1,nmax+1,nmax);
end