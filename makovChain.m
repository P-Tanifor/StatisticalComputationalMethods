% Nm = input('length of sample path  (of Markov chain) = ');
% X = zeros(length(Nm)); % allocate memory for X
% P0 = [0.2 0.8]; % initial distr. of sunny/rainy
% P = [0.7 0.3; 0.4 0.6]; % trans. prob. matrix
% P1(1, :) = P0; % P1 will contain forecast at each step;% first row contains the forecast in day t = 1
% for t = 1 : Nm
%     U = rand;
%     X(t) = 1*(U < P0(1)) + 2*(U >= P0(1));
%     P1(t + 1, :) = P1(t, : )*P;
%     P0 = P(X(t),:);
% end
% X
% 
% % Now, we need to find any "long streaks” of sunny/rainy days. First, we find at which indexes of
% % X(i.e. which days in the next30) the chain changes states (i.e. the weather changes).
% 
% i_change = [find(X(1 : end - 1)  ~= X(2 : end)), Nm]
% 
% % Next, we define a vector that contains all these "long streaks”.
% 
% longstr(1) = i_change(1)
% 
% for i = 2 : length(i_change)
%     longstr(i) = i_change(i) - i_change(i - 1)   %the remaining long streaks are differences between any two changes
% end
% 
% % We now save long streaks of sunny and long streaks of rainy days in separate vectors, to see if any exceeds 7days.
% 
% if (X(1)==1)
%     sunny = longstr(1 : 2 : end); % long streaks of sunny
%     rainy = longstr(2 : 2 : end); % long streaks of rainy
% else
%     sunny = longstr(2 : 2 : end); % long streaks of sunny
%     rainy = longstr(1 : 2 : end); % long streaks of rainy
% end
% 
% maxs = max(sunny) % longest streak of sunny days
% maxr = max(rainy) % longest streak of rainy days
% 



Nm = input('length of sample path  = ');
N = input('nr. of simulations = ');
for j = 1 : N
    X = zeros(length(Nm)); % allocate memory for X
    P0 = [0.2 0.8]; % initial distr. of sunny/rainy
    P = [0.7 0.3; 0.4 0.6]; % trans. prob. matrix
    P1(1, :) = P0; % P1 will contain forecast at each step; first row contains the forecast in day t = 1
    for t = 1 : Nm
        U = rand;
        X(t) = 1*(U < P0(1)) + 2*( U >= P0(1));
        % simulate X(1),... X(Nm) sequentially,% as Bernoulli variables taking value 1 with
        % % prob. P0(1) and value 2 with prob. 1 - P0(1)
        P1(t + 1, :) = P1(t, : )*P; % forecast for next day
        P0 = P(X(t),:); % prepare the distribution of X(t + 1); its pdf is the (X(t))th row of matrix P
    end
    % X
    i_change=[find(X(1:end-1)  ~= X(2:end)), Nm];  % indices where states change
    longstr(1) = i_change(1);  % first long streak ends at the first change
    for i = 2 : length(i_change)
        longstr(i) = i_change(i) - i_change(i - 1);  % the remaining long streaks are differences% between any two changes
    end
    if (X(1)==1)
        sunny = longstr(1 : 2 : end); % long streaks of sunny
        rainy = longstr(2 : 2 : end); % long streaks of rainy
    else
        sunny = longstr(2 : 2 : end); % long streaks of sunny
        rainy = longstr(1 : 2 : end); % long streaks of rainy
    end
    maxs(j) = max(sunny); % longest streak of sunny days
    maxr(j) = max(rainy); % longest streak of rainy days

end


fprintf('\n prob. of water shortage is %1.4f\n',mean(maxs >= 7))
fprintf(' prob. of flooding is %1.4f\n',mean(maxr >= 7))
