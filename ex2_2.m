%% Question 2.2 a)

clear
clc

nu = 0.1;   % Courant number (delta_t/delta_x*u)
k = 200;   % number of cells
x_min = -1.005;   % interval for x
x_max = 1.005;
delta_x = (x_max-x_min)/k;   % Grid size
x = x_min+delta_x/2:delta_x:(x_max - delta_x/2);

% set parameters below
a = 0.5;
z = -0.7;
delta = 0.005;
alpha = 10;
beta = log(2)/(36*delta^2);
G = exp(-beta*(x-z).^2);
F = sqrt(max(1-alpha^2*(x-a).^2,0));

% compute start values
u_0 = zeros(1,k);
for i = 1:k
    if -0.8 <= x(i)
        if x(i) <= -0.6
            u_0(i) = 1/6*(exp(-beta*(x(i)-z-delta).^2)+exp(-beta*(x(i)-z+delta).^2)+4*exp(-beta*(x(i)-z).^2));
        end
    end
    if -0.4 <= x(i)
        if x(i) <= -0.2
            u_0(i) = 1;
        end
    end    
    if 0 <= x(i)
        if x(i) <= 0.2
            u_0(i) = 1-abs(10*(x(i)-0.1));
        end
    end    
    if 0.4 <= x(i)
        if x(i) <= 0.6
            u_0(i) = 1/6*(sqrt(max(1-alpha^2*(x(i)-a-delta).^2,0))+sqrt(max(1-alpha^2*(x(i)-a+delta).^2,0)+4*sqrt(max(1-alpha^2*(x(i)-a).^2,0))));
        end
    end
end
plot(x,u_0)   % the last curve does not go up to 1.0 -> why?