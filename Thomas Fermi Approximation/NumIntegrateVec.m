% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 2
% Numerical Integration Function

function integral = NumIntegrateVec(f,h,down,up,nmax)
    intervals = up - down;
    switch (intervals)
        case 0
            integral = 0;
        case 1          % Special cases for single interval. End points use Eq. (58) or not end points Eq. (61). 
            if (down == 1)
                integral = h/24*(9*f(down)+19*f(down+1)-5*f(down+2)+f(down+3));
            elseif (up == nmax+1)
                integral = h/24*(f(up-3)-5*f(up-2)+19*f(up-1)+9*f(up));
            else
                integral = h/24*(-(f(down)+f(down+3))+13*(f(down+1)+f(down+2)));
            end
        case 2              % Simpsons' rule for 3 points.
            integral = h/3*(f(down)+4*f(down+1)+f(down+2));
        case 3              % Simpson's 3/8 rule for 4 points.
            integral = h/8*(3*(f(down)+f(down+3))+9*(f(down+1)+f(down+2)));
        case 4              % Boole's Rule for 5 points.
            integral = h/45*(14*(f(down)+f(down+4))+64*(f(down+1)+f(down+3))+24*f(down+2));
        case 5              % Eq. (51) for 6 points.
            integral = 5*h/288*(19*(f(down)+f(down+5))+75*(f(down+1)+f(down+4))+50*(f(down+2)+f(down+3)));
        otherwise           % Eq. (57)
            integral = h*(3/8*(f(down)+f(up))+7/6*(f(down+1)+f(up-1))+23/24*(f(down+2)+f(up-2))+sum(f(down+3:up-3)));
    end
end