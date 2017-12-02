% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 6
% Update A0

function fields = UpdateA0(shared_data,src,fields)
    fields.A0 = Solve_Poisson(src.r_grho_p,fields.green_A0,shared_data.rmax,shared_data.nmax);
end