function [N, k, problem, ncon, Xmin, Xmax, max_gen, p_cross, p_mut, eta_c, eta_m] = setParampd()
%---------------------------
%       Define TEST PROBLEMS
%---------------------------

 % Test Problem ID
problem = @optimize_PD;
        k = 16;           % number of variables
        ncon = 0;        % number of constraints
        % lower bound of var-vector for pd
        Xmin=[0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001];

       % upper bound of var-vector for pd
       Xmax =[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
        

N = 40; % Population size (usually 5-10 x number of variables)
max_gen =40 ; % Maximum generation number, usually 30-100
p_cross = 0.9; % Crossover probability, usually 0.8-1.0
p_mut = 1.0/k; % Mutation probability, usually 1/#var
eta_c = 5; % Distribution index for SBX, usually 2-5 
eta_m = 10; % Distribution index for polynomial mutation, usually 10-100



