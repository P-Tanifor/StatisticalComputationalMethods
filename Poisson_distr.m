% simulate Poisson distr. P(lambda)
lambda = input('lambda (> 0) = ');
L = lambda;
N = input ('nr. of simulations = ');
for j = 1 : N
    clear F
    i = 0; % initial value
    F(j) = exp(-L);  % initial value of the cdf F(0)
    while (rand >= F(j))  % %check that u is in A_i,
                          % i.e F(i - 1) <= u < F(i);
                          %the whille loop ends when u < F(i)
    F(j) = F(j) + exp(-L) * L^i/factorial(i); % new value of F
    i = i + 1;        % count the values in A_i
    end
    x(j) =i;  % the poisson variable
end

% application / comparison

fprintf('simulated prob. P(x=2) = %1.5f\n', mean (x == 2))
fprintf('true prob. P(x=2) = %1.5f\n', poisspdf(x,L))
fprintf('error = %e\n\n', abs(poisspdf(x,L) - mean(x == 2)))

fprintf('simulated prob. P(x<=2) = %1.5f\n', mean (x <= 2))
fprintf('true prob. P(x<=2) = %1.5f\n', poisscdf(x,L))
fprintf('error = %e\n\n', abs(poisscdf(x,L) - mean(x <= 2)))

fprintf('simulated prob. P(<2) = %1.5f\n', mean (x < 2))
fprintf('true prob. P(x<2) = %1.5f\n', poisscdf(x,L))
fprintf('error = %e\n\n', abs(poisspdf(x,L) - mean(x < 2)))

fprintf('simulated mean E(x) = %5.5f\n', mean(x))
fprintf('true mean E(x) = %5.5f\n', L)
fprintf('error = %e\n\n', abs(L - mean(x)))
