% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 6
% Fill Data

function shared_data = FillData(shared_data)
    shared_data.nmax = input('Enter nmax: ');
    disp('');
    shared_data.rmax = input('Enter rmax: ');
    disp('');
    shared_data.A = input('Enter total number of nucleons: ');
    disp('');
    shared_data.Z = input('Enter total number of protons: ');
    disp('');
    shared_data.new_frac = input('Enter new_frac: ');
    shared_data.old_frac = 1.0 - shared_data.new_frac;
    
    while(shared_data.A < shared_data.Z)
        disp('You have more protons than total nucleons. Re-enter your values.');
        shared_data.A = input('Enter total number of nucleons: ');
        disp('');
        shared_data.Z = input('Enter total number of protons: ');
    end
    
    disp('');
    shared_data.N = shared_data.A - shared_data.Z;
    
end