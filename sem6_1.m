%Messages arrive at an electronic mail server according to a Poisson process 
% with the average frequency of 5messages per minute. The server can process
% only one message at a time and messagesare processed on a "first come−first 
% serve" basis.  It takes an Exponential amount of timeM1toprocess any text
% message, plus an Exponential amount of timeM2, independent ofM1, to process
% attachments (if there are any), withE(M1) = 2seconds andE(M2) = 7seconds.
% Forty percent ofmessages contain attachments. Use Monte Carlo methods to estimatea) 
% the expected response time of this server;b) the expected waiting time of 
% a message before it is processed.

% solution
%Messages arrive at an electronic mail server according to a Poisson process 
% with the average fre-quency of5messages per minute. The server can process 
% only one message at a time and messagesare processed on a "first come−first 
% serve" basis.  It takes an Exponential amount of timeM1toprocess any text message, 
% plus an Exponential amount of timeM2, independent ofM1, to processattachments
% (if there are any), withE(M1) = 2seconds andE(M2) = 7seconds. Forty percent ofmessages 
% contain attachments. Use Monte Carlo methods to estimatea) the expected response time of this server;b)
% the expected waiting time of a message before it is processed.


% Generate an M/G/1 queuing system.clear all

% % Parameters of the system6
lamA = 5/60; % arrival rate lambdaA, per sec.
lamM1 = 1/2; % parameter of M1 (texts); lambdaM1
lamM2= 1/7; % parameter of M2 (attachments); lambdaM2
p = 0.4; % proportion of emails with attachments
N = input('size of MC study(at least 1e4) = '); % size of the MC study:% number of generated jobs

% Initialize variables
arrival = zeros(1, N); % arrival times
start = zeros(1, N); % times when service starts
finish = zeros(1, N); % times when service finishes;
T = 0; % arrival time of a new job
A = 0; % time when the server becomes available

for j = 1 : N % do-loop over N jobs
    T = T - 1/lamA*log(rand); % arrival time of the j-th job
    S = -1/lamM1*log(rand) - (rand < p)*1/lamM2*log(rand);% service time of the j-th job
    arrival(j) = T; % arrival time of the j-th job
    start(j) = max(A, T); % time when service starts
    finish(j) = start(j) + S; % departure time
    A = finish(j); % time when the server becomes available% to take the (j+1)st job
end


fprintf('a) expected response time E(R) is %3.5f sec.\n',  mean(finish - arrival))
fprintf('b) expected waiting time E(W) is %3.5f sec.\n', mean(start - arrival))