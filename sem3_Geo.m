
% 1a) Use the discrete inverse transform method to generate Geo(p)

p = input('p in (0,1) = '); % the parameter of the geo distr.
X = ceil(log(1 - rand)/log(1-p) - 1);
err = input('error = ');  % the maximum error
alpha =input('alpha (level of significance should never be greater than 0.05) = ');
N = ceil(0.25*(norminv(alpha/2,0,1)/err)^2); % max size to ensure the error < err with confidence level 1-alpha
fprintf('Nr. of simulations N = %d \n\n', N)
%It would be a good idea to track the number of simulations and proceed with 
% caution! For instance,an errorε= 1e−3 and a significance level 
% α= 0.01 produce a number of N= 1658725 simulations! 
% However,α should never be bigger than 0.05 and the error 
% should be at least 1e−2(so, youshould tryε= 1e−2,5e−3,1e−3,5e−4,α= 0.05,0.01,0.001).
% Now, that we generated one variable and we determined the
% number of simulations, generate asample.
for i = 1 : N
    X(i) = ceil(log(1 - rand)/log(1-p) - 1);
end

% Application/ Comparison
fprintf('simulated probab. P(X = 2) = %1.5f\n', mean(X == 2))
fprintf('true probab. P(X = 2) = %1.5f\n', geopdf(2, p))
fprintf('error = %e\n\n', abs(geopdf(2, p) - mean(X == 2)))

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', geocdf(2, p))
fprintf('error = %e\n\n', abs(geocdf(2, p) - mean(X <= 2)))

fprintf('simulated probab. P(X < 2) = %1.5f\n', mean(X < 2))
fprintf('true probab. P(X < 2) = %1.5f\n', geocdf(1, p))
fprintf('error = %e\n\n', abs(geocdf(1, p) - mean(X < 2)))

fprintf('simulated mean E(X) = %5.5f\n', mean(X))
fprintf('true mean E(X) = %5.5f\n', (1 - p)/p)
fprintf('error = %e\n\n', abs((1 - p)/p - mean(X)))
