% a Geometric variable represent the number of failures that occurred befor
% the first success.

p = input('p (in (0,1)) = '); % the parameter of the Geo distr. we count the number of failures until the first succes
N = input('nr. of sumulations = ');
x = zeros(1,N);
for i = 1 : N
    while rand >= p
        x(i) = x(i) + 1;
    end
end
% application/ comparison

fprintf('silulated probab. P(x=2) = %1.5f\n', mean(x == 2))
fprintf('true probab. P(x = 2) = %1.5f\n', geopdf(2,p))
fprintf('error = %e\n\n', abs(geopdf(2,p) - mean(x ==2)))

fprintf('silulated probab. P(x<=2) = %1.5f\n', mean(x <= 2))
fprintf('true probab. P(x <= 2) = %1.5f\n', geocdf(2,p))
fprintf('error = %e\n\n', abs(geocdf(2,p) - mean(x <=2)))

fprintf('silulated probab. P(x<2) = %1.5f\n', mean(x < 2))
fprintf('true probab. P(x < 2) = %1.5f\n', geocdf(1,p))
fprintf('error = %e\n\n', abs(geocdf(1,p) - mean(x <2)))

fprintf('simulated mean E(x) = %5.5f\n', mean(x))
fprintf('true mean E(x) = %5.5f\n', (1-p)/p)
fprintf('error = %e\n\n', abs((1-p)/p - mean(x)))
