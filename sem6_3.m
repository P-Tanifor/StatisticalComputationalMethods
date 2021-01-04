%Assume that the clinic in Problem 7. is only open between 8a.m. and 6p.m. 
% to receive patients.Use Monte Carlo methods to estimate
% a) the expected waiting time for a patient;
% b) the longest waiting time for a patient;
% c) the number of patients still in the clinic at6p.m.

% solution

% Generate a  D/G/1 queuing system with time limit.clear all


% Parameters

alpha = 4; lambda = 10/3; % parameters of service times
t = 15; % fixed interarrival times

% Initialize variables

Tmax = input('maximum time (in minutes) = '); % limited max. time
N = input('size of MC study = '); % size of the MC study
Nmax = Tmax/15; % max nr. of scheduled patients
arrival = 0 : t : (Nmax - 1)*t; % arrival times = 0, t, 2t,% 3t, ...
expw = zeros(1, N); % expected waiting time
maxw = zeros(1, N); % maximum waiting time
nr_p = zeros(1, N); % number of patients in the clinic at the end of the day

for i = 1 : N
    j = 0; % job number
    T = 0; % arrival time of a new job
    A = 0; % time when the doctor becomes available
    start = zeros(1, Nmax); % times when service starts
    service = zeros(1, Nmax); % service time for each job
    finish = zeros(1, Nmax); % times when service finishes;
    while T < Tmax % until the end of the day
        j = j + 1; % next job
        T = T + t; % arrival time of job j
        start(j) = max(A, arrival(j)); % time when service starts
        S = -lambda*sum(log(rand(alpha,1)));
        finish(j) = start(j) + S; % departure time
        A = finish(j); % time when the server (doctor) becomes available to take the (j+1)st job (patient)
    end
    expw(i) = mean(start - arrival);
    maxw(i) = max(start-arrival);
    nr_p(i) = sum(finish > Tmax);
end

fprintf('a) expected waiting time E(W) is %3.2f min.\n', mean(expw)); % expected waiting time
fprintf('b) longest waiting time is %3.2f min.\n', mean(maxw)); % the longest waiting time)
fprintf('c) number of patients at time Tmax is %3.2f \n', mean(nr_p)); % number of jobs at time Tmax

%Between8a.m.  and6p.m.  there are10hours, soTmax= 600minutes. 
% Try a smaller number ofsimulationsN= 1e4,5e4,1e5.  We estimate the average waiting 
% time for a patient≈7.9minutes(slightly smaller than in the unlimited capacity case), 
% longest waiting time≈28.4minutes and thereseems to be at least1patient in the 
% clinic at the end of the workday.