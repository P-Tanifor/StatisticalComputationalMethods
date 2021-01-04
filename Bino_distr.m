% simulate Binomial distr. Bino(n,p)
n = input('n (in N) = ');
p = input('p (in (0,1)) = ');


% generate one variable
%u = rand(n,1);
%x = sum(u < p);

N = input('nr. of simulations = ');
for i = 1 : N
    u = rand(n, 1);
    x(i) = sum(u < p);
end

% to see how good the simulation is, we could either compare the graph
% of the true binomial distro and the simulated on or compare various
% probs.

% Application/ Comparison
fprintf('simulated probab. P(x=2) = %1.5f\n', mean(x==2))
fprintf('true probab. P(x = 2) = %1.5f\n', binopdf(2,n,p))
fprintf('error = %e\n\n', abs(binopdf(2,n,p) - mean(x ==2)))


fprintf('simulated probab. P(x<=2) = %1.5f\n', mean(x<=2))
fprintf('true probab. P(x <= 2) = %1.5f\n', binopdf(2,n,p))
fprintf('error = %e\n\n', abs(binopdf(2,n,p) - mean(x <=2)))

fprintf('simulated probab. P(x<2) = %1.5f\n', mean(x<2))
fprintf('true probab. P(x < 2) = %1.5f\n', binopdf(2,n,p))
fprintf('error = %e\n\n', abs(binopdf(2,n,p) - mean(x <2)))

fprintf('simulated mean E(x) = %5.5f\n', mean(x))
fprintf('true mean E(x) = %5.5f\n', n*p)
fprintf('error = %e\n\n', abs(n*p - mean(x)))