%Simulate distr. Nbin(n,p) Using discrete inverse transform mehtod

n = input('n (in N) = ');
N = input('nr. of simulations = ')%
p = input('p (in (0,1)) = '); % the parameters of the NBin distr.
% A NBin(n,p) variable is the sum of n indep. Geo variables 
% (and repr. the number of failures occurred before the nth success)
% % Generate one variable
Y = ceil(log(1 - rand(n, 1))/log(1 - p) - 1);
X = sum(Y);

for i = 1 : N
    Y = ceil(log(1 - rand(n, 1))/log(1 - p) - 1); 
    X(i) = sum(Y);
end

% Application/ Comparison
fprintf('simulated probab. P(X = 2) = %1.5f\n', mean(X == 2))
fprintf('true probab. P(X = 2) = %1.5f\n', nbinpdf(2,n,p))
fprintf('error = %e\n\n', abs(nbinpdf(2,n, p) - mean(X == 2)))

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', nbincdf(2,n, p))
fprintf('error = %e\n\n', abs(nbincdf(2,n, p) - mean(X <= 2)))

fprintf('simulated probab. P(X < 2) = %1.5f\n', mean(X < 2))
fprintf('true probab. P(X < 2) = %1.5f\n', nbincdf(1,n, p))
fprintf('error = %e\n\n', abs(nbincdf(1,n, p) - mean(X < 2)))

fprintf('simulated mean E(X) = %5.5f\n', mean(X))
fprintf('true mean E(X) = %5.5f\n', (n*(1 - p))/p)
fprintf('error = %e\n\n', abs((n*(1 - p))/p - mean(X)))
