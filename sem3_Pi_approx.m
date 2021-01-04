% use rejection method to approx. pi

err = input('error of the approximation = '); % Max. error
alpha = input('alpha (level of significance) = ');  % level of significance
N = ceil(0.25*(norminv(alpha/2,0,1)/err)^2); % MC size to ensure that 
                                             % error < err, with confidence
                                             %level 1-alpha
fprintf('nr. of simulations N = %d \n\n', N)
i = 0; % initial number of pairs that are inside the unit circle
for j = 1 : N
    X = unifrnd(-1,1);
    Y = unifrnd(-1,1);
    if X^2 + Y^2 <= 1
        i = i + 1;
    end
end
approx_pi = 4 * i/N;

% Comparison

fprintf('approx. value of pi = %1.10f\n', approx_pi)
fprintf('error = %e\n\n', abs(approx_pi - pi))