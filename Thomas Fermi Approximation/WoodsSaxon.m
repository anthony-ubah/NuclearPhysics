% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 6
% Woods Saxon Coefficients

function f = WoodsSaxon(R_A, a)
    f = @(r) 1./( 1 + exp((r-R_A)./a) );
end

