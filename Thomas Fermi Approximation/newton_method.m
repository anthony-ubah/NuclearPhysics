% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 551 - Nuclear Physics
% Computing Assignment 1
% Newton's Method Function

function [solution,densities] = newton_method(f,c,x_init,shared_data,fields,densities)
    % This function solved F(x) = c .
    tol = 1e-12;                               % Setting tolerance.
    %tole = 1e-4;
    max_count = 10000;                           % Setting number of iterations.
    n = 10000;                                   % Setting initial step size.
    x_old = x_init;                             % Next three lines to start iteration.
    x_new = x_old + n*tol;                      
    count = 0;
    failure = 0; 
    
    while(abs(x_new - x_old) > tol)             % Conduct algorithm while difference between previous and current guess above tolerance.
        err = abs(x_new-x_old);
        f_deriv = fun_prime(f,x_old,shared_data,fields,densities);
        x_old = x_new;
        a = f(shared_data,fields,densities,x_old);
        x_new = x_old - (a-c)/f_deriv; 
        count = count + 1;
        
        if (count == max_count)
            % If number of iterations exhausted then set failure flag to true and throw error message.
            failure = 1;
            msg = 'Error. Could not find solution, x, in given number of iterations and tolerance. Try using more iterations!';
            error (msg);
            break;
        end
    end
    
    if (~failure)
        solution = x_new;
        [~,densities] = f(shared_data,fields,densities,x_new);
    end 
end