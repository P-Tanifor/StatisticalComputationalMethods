 % simulate a negative binomial (pascal) distr.

n = input('n (in N) = ');
p = input('p (in (0,1)) = ');
N = input('nr. of simulations = ');
for i = 1 : N
    for j = 1: n
        Y(j) = 0;
        while rand >= p
            Y(j) = Y(j) + 1;
        end
    end
    x(i) = sum(Y);
end

% Application / comparison

fprintf('simulated prob. P(x =2) = %1.5f\n', mean(x == 2))
fprintf('true prob. P(x=2) = %1.5f\n', nbinpdf(2,n,p))
fprintf('error = %e\n\n', abs(nbinpdf(2,n,p) - mean(x ==2)))

fprintf('simulated prob. P(x <=2) = %1.5f\n', mean(x <= 2))
fprintf('true prob. P(x<=2) = %1.5f\n', nbincdf(2,n,p))
fprintf('error = %e\n\n', abs(nbincdf(2,n,p) - mean(x <=2)))

fprintf('simulated prob. P(x <2) = %1.5f\n', mean(x <2))
fprintf('true prob. P(x<2) = %1.5f\n', nbincdf(1,n,p))
fprintf('error = %e\n\n', abs(nbincdf(1,n,p) - mean(x <2)))

fprintf('simulated mean E(x) = %5.5f\n', mean(x))
fprintf('true mean E(x) = %5.5f\n', ((n*(1-p))/p))
fprintf('error = %e\n\n', abs(((n*(1-p))/p) - mean(x)))