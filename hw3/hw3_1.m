% Part A
N = 10000;
dt = 1/N;
t = linspace(-1, 1, N);
p = zeros(5, N);
for n = 1:5
    p(n,:) = t.^(n-1);
end

p1 = p(1,:);
p2 = p(2,:);
p3 = p(3,:);
p4 = p(4,:);
p5 = p(5,:);

q1 = p1 / func_norm(p1);

e2 = p2 - dot(p2, q1)*q1;
q2 = e2 / func_norm(e2);

e3 = p3 - dot(p3, q2)*q2;
q3 = e3 / func_norm(e3);

e4 = p4 - dot(p4, q3)*q3;
q4 = e4 / func_norm(e4);

e5 = p5 - dot(p5, q4)*q4;
q5 = e5 / func_norm(e5);


figure(1)
subplot(5,1,1)
title('Legendre Polynomials (first 5)')
plot(t, q1)
subplot(5,1,2)
plot(t, q2)
subplot(5,1,3)
plot(t, q3)
subplot(5,1,4)
plot(t, q4)
subplot(5,1,5)
plot(t, q5)

% Part B
x = zeros(N, 1);
for ii=1:N
   x(ii,1) = exp(-t(ii));
end
A = [q1', q2', q3', q4', q5'];

P = A/(A'*A)*A';

xhat = P*x;

error = xhat - x;
e_norm_l = func_norm(error);

figure(2)
title('Plot of x and xhat using Legendre - Error = 0.0333')
hold on
plot(t, x, 'g')
plot(t, xhat, 'r')

% Part C

q1 = p1 / cheb_norm(p1);

e2 = p2 - dot(p2, q1)*q1;
q2 = e2 / cheb_norm(e2);

e3 = p3 - dot(p3, q2)*q2;
q3 = e3 / cheb_norm(e3);

e4 = p4 - dot(p4, q3)*q3;
q4 = e4 / cheb_norm(e4);

e5 = p5 - dot(p5, q4)*q4;
q5 = e5 / cheb_norm(e5);


figure(1)
subplot(5,1,1)
title('Legendre Polynomials (first 5)')
plot(t, q1)
subplot(5,1,2)
plot(t, q2)
subplot(5,1,3)
plot(t, q3)
subplot(5,1,4)
plot(t, q4)
subplot(5,1,5)
plot(t, q5)

% Part D
A = [q1', q2', q3', q4', q5'];

P = A/(A'*A)*A';

xhat = P*x;

error = xhat - x;
e_norm_c = cheb_norm(error);

figure(2)
title('Plot of x and xhat using Chebyshev - Error = 0.0015')
hold on
plot(t, x, 'g')
plot(t, xhat, 'r')


% Norm for functions
function [norm] = func_norm(func)
    dt = 1/size(func,2);
    norm = sqrt(dot(func,func)*dt);
end

function [norm] = cheb_norm(func)
    N = size(func,2);
    dt = 1/N;
    t = linspace(-1, 1, N);
    norm = 0;
    for k = 1:N
        if abs(t(k)) >= 1
            dnorm = 1/sqrt(0.000001)*func(k)^2*dt;
        else
            dnorm = 1/sqrt(1 - t(k)^2)*func(k)^2*dt;
        end
        
        norm = norm + dnorm;
    end
end
    


