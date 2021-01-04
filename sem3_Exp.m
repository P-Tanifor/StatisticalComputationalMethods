%a) Use the ITM to generate Exp(lambda)

N = input('nr. of simulations = ');
lambda = input('lambda = ');

for i = 1 : N
    X(i) = -1/lambda*log(rand);  %the exp variable
end

%For the last part, the comparison with true values, 
% the expected value is 1/λ.Also, since now we simulate 
% a continuous variable, it will take single values with 
% probability ZERO!(so omit that part in the comparison)

%application / comparison

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', expcdf(2, 1/lambda))
fprintf('error = %e\n\n', abs(expcdf(2, 1/lambda) - mean(X <= 2)))

fprintf('simulated probab. P(X < 2) = %1.5f\n', mean(X < 2))
fprintf('true probab. P(X < 2) = %1.5f\n', expcdf(2, 1/lambda))
fprintf('error = %e\n\n', abs(expcdf(2, 1/lambda) - mean(X < 2)))

fprintf('simulated mean E(X) = %5.5f\n', mean(X))
fprintf('true mean E(X) = %5.5f\n', 1/lambda)
fprintf('error = %e\n\n', abs(1/lambda - mean(X)))