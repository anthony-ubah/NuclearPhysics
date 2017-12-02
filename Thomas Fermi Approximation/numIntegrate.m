% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 2
% Numerical Integration Function

function f_now = numIntegrate(f,down,up)
    IterMax = 10000;
    tol = 10^(-13);
    max_count = 1e7;
    count = 0;
    nmax = 50;
    accum = nmax + 1;
    h = (up-down)/nmax;
    vf = f(down:h:up);
    f_prev = 0;
    f_now = NumIntegrateVec(vf,h,1,nmax+1,nmax);
    
    while(abs(f_prev-f_now)>tol*abs(f_now))
        f_prev = f_now;
        nmax = nmax + 50;
        
        if nmax > max_count
            disp('nmax has exceeded maximum count allowed.');
            break;
        end
        
        accum = nmax+1;
        h = (up-down)/nmax;
        vf = [];
        vf = f(down:h:up);
        f_now = NumIntegrateVec(vf,h,1,nmax+1,nmax);
        count = count + 1;
        if (count> IterMax)
            error('Maximum number of iterations exceeded!\n');
            disp('Answer may not be accurate.');
            break;
        end
    end
    fprintf('nmax: %d \n iterations: %d \n accum: %d \n f_prev: %.12f \n f_now: %.12f \n\n',nmax,count,accum,f_prev,f_now);
end