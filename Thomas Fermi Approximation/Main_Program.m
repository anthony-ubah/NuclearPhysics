% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 6
% Main Program

clear;
load 'common_data.mat'
% common_data.nmax = 1200;
% common_data.rmax = 12;
% common_data.old_frac = 0.4;
% common_data.new_frac = 0.6;

% for i = 1:20
load 'dens.mat'
load 'fields.mat'
load 'sources.mat'

% common_data.A = i*10;
% common_data.Z = common_data.A/2;
% common_data.N = common_data.A - common_data.Z;
common_data = FillData(common_data);
fields = InitializeFields(common_data,fields);
dens = InitializeDensities(common_data,dens);
sources = InitializeSources(dens,common_data,sources);

fields = MakeInitFields(common_data,sources,dens,fields);

% Setting up for integration.
dr = common_data.rmax/common_data.nmax;
r = 0:dr:common_data.rmax;

figure(1)
plot(r,fields.rho0.*common_data.hbarc)
hold on

figure(2)
plot(r,fields.sigma.*common_data.hbarc,r,fields.A0.*common_data.hbarc,r,fields.omega.*common_data.hbarc)
hold on

mu_p = common_data.M./common_data.hbarc;
mu_n = common_data.M./common_data.hbarc;

[dens,f,mu_p,mu_n] = UpdateDensities(common_data,fields,sources,dens,mu_p,mu_n);

iter_max = 100;
tol = 10e-10;
for iter = 1:80
    sources = UpdateSources(common_data,dens,sources);
    fields = UpdateFields(fields,sources,dens,common_data);
    [dens,f,mu_p,mu_n] = UpdateDensities(common_data,fields,sources,dens,mu_p,mu_n);
    
    if(f<tol)
        break;
    end
end

% BE = BindingEnergy(fields,sources,dens,common_data);
% disp('Binding energy in MeV');
% disp(BE);

% clear dens fields sources
% end

figure(1)
plot(r,fields.rho0.*common_data.hbarc)
xlabel('Radius (fm)')
ylabel('Field (MeV)')
legend('\rho_0 Init','\rho_0 Final')
title('\rho_0 Field Density vs Radius')

figure(2)
plot(r,fields.sigma.*common_data.hbarc,r,fields.A0.*common_data.hbarc,r,fields.omega.*common_data.hbarc)
xlabel('Radius (fm)')
ylabel('Field (MeV)')
legend('\sigma Init','A^0 Init','\omega Init','\sigma Final','A^0 Final','\omega Final')
title('Fields vs Radius')

rho_c = GetRhoCharge(common_data,dens.rho_p);
rho_B = dens.rho_p + dens.rho_n;

figure(3)
plot(r,rho_c,r,rho_B,r,dens.rho_p,r,dens.rho_n)
xlabel('Radius (fm)')
ylabel('Density (fm^{-3})')
title('Charge, Nucleon and Baryon Density')
legend('\rho_c','\rho_B','\rho_p','\rho_n')

omega_msg = sprintf('%.4f', fields.omega);
sigma_msg = sprintf('%.4f', fields.sigma);
A0_msg = sprintf('%.4f', fields.A0);
rho0_msg = sprintf('%.4f', fields.rho0);
rhop_msg = sprintf('%.4f', dens.rho_p);
rhon_msg = sprintf('%.4f', dens.rho_n);

disp('MESONS:');
disp('Omega');
disp(omega_msg);
disp('');
disp('Sigma');
disp(sigma_msg);
disp('');
disp('A0');
disp(A0_msg);
disp('');
disp('Rho0');
disp(rho0_msg);
disp('');
disp('');
disp('DENSITIES:');
disp('Proton Density');
disp(rhop_msg);
disp('');
disp('Neutron Density');
disp(rhon_msg);
disp('');

fid = fopen('Results.dat','w+');
fprintf(fid, 'Omega = ');
fprintf(fid, omega_msg);
fprintf(fid, '\n');
fprintf(fid, 'Sigma = ');
fprintf(fid, sigma_msg);
fprintf(fid, '\n');
fprintf(fid, 'A0 = ');
fprintf(fid, A0_msg);
fprintf(fid, '\n');
fprintf(fid, 'Rho0 = ');
fprintf(fid, rho0_msg);
fprintf(fid, '\n');
fprintf(fid, 'rho_p = ');
fprintf(fid, rhop_msg);
fprintf(fid, '\n');
fprintf(fid, 'rho_n = ');
fprintf(fid, rhon_msg);
fprintf(fid, '\n');
fclose(fid);