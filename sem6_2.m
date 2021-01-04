%A small clinic has several doctors on duty, but only one patient is seen at 
% a time.  Patients arescheduled to arrive at equal15−minute intervals, are 
% then served in the order of their arrivals andeach of them needs a Gamma 
% time with the doctor, that has parametersα= 4andλ= 10/3 min−1.Use Monte Carlo 
% simulations to estimate
% a) the probability that a patient has to wait before seeing the doctor;
% b) the expected waiting time for a patient;

% solution

%This system isnotM / M / 1 either, both because the interarrival times are 
% not random and becausethe service times are not Exponential.   This is a D / G / 1 
% queuing system,  where "D” stands for“deterministic” (fixed).Now  arrival  times  are  
% fixed,  at  increments  of15minutes.   Service  times  have  aGamma(α,λ)distribution,
% which can be simulated as a sum ofα Exp(1/λ)variables. Let us notice that the 
% meaninterarrival time is μA= 15minutes, while the average service time isμS=α·λ= 40/3 = 13.33,
% so  the  system  is  functionalr=μS/μA<1.   Also,  the  standard  deviation  
% of  service  times  is√α·λ2=203≈6.67, quite large, so we can expect quite a bit 
% of variation.Again,  we keep track of arrival times,  of times when service starts,  
% times when service finishes(departure times), as arrays and time when the server becomes available.

% Generate a  D/G/1 queuing system.clear all

 
% Parameters of the system

alpha = 4; lambda = 10/3; % parameters of service times
t = 15; % fixed interarrival times
N = input('size of MC study(at least 1e4) = '); % size of the MC study
arrival = 0 : t : (N - 1)*t; % arrival times = 0, t, 2t, 3t, ...

% Initialize variables
start = zeros(1, N); % times when service starts
service = zeros(1, N); % service time for each job
finish = zeros(1, N); % times when service finishes;
A = 0; % time when the doctor becomes available

for j = 1 : N % do-loop over N jobs
    start(j) = max(A, arrival(j)); % time when service starts
    service(j) = -lambda*sum(log(rand(alpha,1)));% service time for each job, Gamma(alpha, lambda) distr.
    finish(j) = start(j) + service(j); % departure time
    A = finish(j); % time when the server (doctor) becomes% available to take the (j+1)st job (patient)
end

fprintf('a) prob. that a patient has to wait P(W > 0) ...is %3.5f\n', mean(start > arrival))
fprintf('b) expected waiting time E(W) is %3.5f min.\n', mean(start - arrival))
