% Simulation of Binomial counting process.
% and illustration of the generated discrete-time process
% with Delta frame size.

NB = input('length of sample path = ');
p = input('prob. of success (arrival) = ');
X = zeros(1, NB); % allocate memory for X
X(1) = (rand < p); % first Bernoulli trial; X nr. of successes
for t = 2 : NB
    X(t) = X(t - 1) + (rand < p); % count the nr. of successes
end
%X

% illustration

Del = input('frame size (in seconds) = ');
axis([ 0 NB 0 max(X)]); % allocate the box for the entire simulated segment
hold on
title('Binomial process of arrivals');
xlabel('time');
ylabel('nr. of arrivals')
for t = 1 : NB
    plot(t, X(t), '*', 'MarkerSize', 8) % plot each point with '*'
    pause(Del) % to see it in real time
end
hold off