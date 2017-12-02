% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 551 - Nuclear Physics
% Computing Assignment 1
% Derivative Approximation Function

function deriv = fun_prime(f, x,shared_data,fields,densities)
    % This function approximates df(x)/dx.
    h = 0.0000001;      % Setting h
    deriv = (f(shared_data,fields,densities,x+h)-f(shared_data,fields,densities,x-h))/(2*h);      % Calculating the derivative.
end