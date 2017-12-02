% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 6
% Initialize Fields

function fields = InitializeFields(shared_data,fields)
    a = 1;
    p = @(r) exp(-a.*r); % Dummy funciton since MakeGreen and MakeGreenE also produce source vectors.
    [fields.green_sigma,~] = MakeGreen(shared_data.m_sigma/shared_data.hbarc,shared_data.rmax,shared_data.nmax,p);
    [fields.green_omega,~] = MakeGreen(shared_data.m_omega/shared_data.hbarc,shared_data.rmax,shared_data.nmax,p);
    [fields.green_rho0,~] = MakeGreen(shared_data.m_rho/shared_data.hbarc,shared_data.rmax,shared_data.nmax,p);
    [fields.green_A0,~] = MakeGreenE(shared_data.rmax/shared_data.hbarc,shared_data.nmax,p);
end