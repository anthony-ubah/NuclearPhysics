% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% sinh(x)/x

function g = SinhXoverX(x)
    for i = 1:max(size(x))
        if x(i) < 1e-8
            g(i) = 1 + x(i)^2/6 + x(i)^4/120;
        else
            g(i) = sinh(x(i))/x(i);
        end
    end
end