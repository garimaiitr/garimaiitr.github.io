function [N, k, problem, ncon, Xmin, Xmax, max_gen, p_cross, p_mut, eta_c, eta_m] = setParam()
%---------------------------
%       Define TEST PROBLEMS
%---------------------------

 % Test Problem ID
problem = @optimize_type2;

        k = 56;           % number of variables
        ncon = 0;        % number of constraints

        % lower bound of var-vector for type 2
        Xmin=[10,10,1,0.7,1552,16142,1,1,1,0.6,586,6741,24,6,1,0.5,815,9745,7,16,1.5,0.6,670,17303,21,13,1,0.8,1810,17403,12,13,1,0.5,1579,12657,3,11,2,0.6,1166,13674,10,4,2,0.1,1785,15387,0.01,0.01,0.01,0.03,0.03,0.03,0.02,0.01];
       % upper bound of var-vector for type2
       Xmax =[11,11,2,0.9,1752,18142,2,2,2,0.8,786,8741,26,8,2,0.7,1015,11745,9,18,3,0.9,870,19303,23,15,2,1,2000,19403,14,15,2,0.7,1759,14657,5,13,3,0.8,1366,15674,12,6,3,1,1985,17387,0.02,0.02,0.02,0.04,0.04,0.04,0.03,0.02];

N = 40; % Population size (usually 5-10 x number of variables)
max_gen =40 ; % Maximum generation number, usually 30-100
p_cross = 0.9; % Crossover probability, usually 0.8-1.0
p_mut = 1.0/k; % Mutation probability, usually 1/#var
eta_c = 5; % Distribution index for SBX, usually 2-5 
eta_m = 10; % Distribution index for polynomial mutation, usually 10-100



