

err = input('error(tolerable error) = ');
alpha = input('alpha (level of significance. should never be bigger than 0.05) = ');
N = ceil(0.25 * (norminv(alpha/2,0,1)/err)^2);
fprintf('Nr. of simulations N = %d \n\n', N)
k = input('number of previous days considered = ');
in_last = input ('numbers of errors in the last k days(enter a row vector of length k) = ')% initial number of errors in the last k days
tmax = input ('max time after which the new software is withrawn(in days) = ');
%We need to keep track of time T, of number of errors on day T,
% number of errors detected so far and the numbers of errors 
% in the last k days.
for i = 1 : N
    % T is time from now on (in days), X is nr. of errors on day T
    % nrerr is the number of errors detected so far
    T = 0;
    last = in_last % number of errors in last k days
    x = in_last(k); % nr. of errors in day T
    nrerr = sum(in_last);
    % While there still are errors, we generate the new number of errors, as a Poisson variable withparameterλt= min{Xt−1,Xt−2,...,Xt−k}.We use the 
    % special method discussed previously.
    while x > 0; % loop until no errors are found
        lambda = min(last); % parameter for var x, simulate the number of errors on day T, Poisson (lambda) special method
        u = rand; % generated U(0,1) variable
        x = 0; % initial value
        while u >= exp(-lambda);
            u = u * rand;
            x = x + 1; % the poisson variable
        end
        % then we update
        T = T +1;  % update:next day
        nrerr = nrerr + x; % update new nr. of errors
        last = [last(2:k),x];  %update new nr. of errors in the last k days
        
    end
    Ttotal(i) = T - 1; % the day all errors were found
    Ntotalerr(i) = nrerr; % total nr. of errors found
end

fprintf('\n')
fprintf('a) The time it will take to find all errors is %3.3f days \n', mean(Ttotal))
fprintf('b) Total nr. of error in the new release is %5.3f \n', mean(Ntotalerr))
fprintf('c) Prob. taht some errors will still be undetected after %d days, \n',tmax)
fprintf('after which the software will be withrawn is %3.3f \n\n', mean(Ttotal > tmax))

