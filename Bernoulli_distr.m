p = input('(in(0,1)) = ');
u = rand; % random number from U(0,1)
x = (u < p); % x takes value 1, if u < p and 0, if u >= p

N = input('nr. of simulations = ');
for i = 1 : N
    u = rand;
    x(i) = (u < p);
end

% compare it to the Bern(p) = Bino(1,p)
ux = unique(x) % the values of x listed only once (no repetitions)
nx = hist(x, length(ux)); % the freq. of each value in ux
relfreq = nx/N % the relative feq. nx/N approximates the prob.
