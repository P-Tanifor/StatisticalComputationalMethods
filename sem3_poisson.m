% use a special method to generate a Poiss(lambda)

lambda = input('lambda ( > 0) = ');  % param. of the poisson distr.
U = rand; % generated U(0,1) variable
X = 0; % initial value
N = input('N = ')
% while U >= exp(-lambda)  % check that U1*...*Un >= exp(-lambda), to get max n
%     U = U * rand; % go further to n + 1 (i.e X + 1)
%     X = X + 1; % the poisson variable
%end

for i = 1 : N
    while U >= exp(-lambda)
        U = U * rand;
        X(i) = X(i) + 1;
    end
end

% application/ comparison

fprintf('simulated probab. P(X = 2) = %1.5f\n', mean(X == 2))
fprintf('true probab. P(X = 2) = %1.5f\n', poisspdf(2,lambda))
fprintf('error = %e\n\n', abs(poisspdf(2,lambda) - mean(X == 2)))

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', poisscdf(2,lambda))
fprintf('error = %e\n\n', abs(poisscdf(2,lambda) - mean(X <= 2)))

fprintf('simulated probab. P(X < 2) = %1.5f\n', mean(X < 2))
fprintf('true probab. P(X < 2) = %1.5f\n', poisscdf(1,lambda))
fprintf('error = %e\n\n', abs(poisscdf(1,lambda) - mean(X < 2)))

fprintf('simulated mean E(X) = %5.5f\n', mean(X))
fprintf('true mean E(X) = %5.5f\n', (lambda))
fprintf('error = %e\n\n', abs((lambda - mean(X))))
