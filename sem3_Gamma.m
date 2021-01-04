% the gamma variable is the sum of independent exp variables
% for a belonging to the set of natural numbers, Gamma(a, lambda)

N = input('nr. of simulations = ');
a = input('the value "a"(in set of natural numbers) = ');
lambda = input('lambda = ');

for  i = 1 : N
    X(i) = sum(-lambda *log(rand(a,1)));  % the gamma variables
end

%application/comparisons

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', gamcdf(2, lambda))
fprintf('error = %e\n\n', abs(gamcdf(2, lambda) - mean(X <= 2)))

fprintf('simulated probab. P(X < 2) = %1.5f\n', mean(X < 2))
fprintf('true probab. P(X < 2) = %1.5f\n', gamcdf(2, lambda))
fprintf('error = %e\n\n', abs(gamcdf(2, lambda) - mean(X < 2)))

fprintf('simulated mean E(X) = %5.5f\n', mean(X))
fprintf('true mean E(X) = %5.5f\n', lambda)
fprintf('error = %e\n\n', abs(lambda - mean(X)))