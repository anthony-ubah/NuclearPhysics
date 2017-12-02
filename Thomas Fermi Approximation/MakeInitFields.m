% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 6
% Calculate Initial Fields

function fields = MakeInitFields(shared_data,sources,densities,fields)
    fields = MakeInitOmega(shared_data,sources,fields,densities);
    fields = MakeInitRho0(shared_data,sources,fields,densities);
    fields = MakeInitSigma(shared_data,densities,fields);
    fields = UpdateA0(shared_data,sources,fields);
end