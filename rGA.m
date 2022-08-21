% -------------------------- rGA ----------------------------------------
%   Single Objective Genetic Algorithm
%   with Real Parameter Handling using SBX
%   and Polynomial Mutation + Elite Preserv.
% -----------------------------------------------------------------------
%clear all; close all; clc; format short g;
seed = 0;

[N, k, problem, ncon, Xmin, Xmax, max_gen, p_cross, p_mut, eta_c, eta_m] = setParam();
n_realcross = 0;
n_realmut = 0;

%--------------------------------------------------------------------------
% CREATE INITIAL POPULATION
%--------------------------------------------------------------------------
disp('>>> Initial Generation');
pop = initializePop(N, k, Xmin, Xmax);

%--------------------------------------------------------------------------
% EVALUATE FITNESS
%--------------------------------------------------------------------------
% NOTE: All objectives should be of MINIMIZATION type
pop = evaluate_fitness(pop, problem, k, ncon);

gen = 1; % Generation # 0
fid1 = fopen('All_Generations.txt', 'wt');
fid2 = fopen('Statistics.txt','wt');
fid1 = report(pop, k, N, fid1, gen, seed); % gen = 1

feasID = pop(:, k+2) == 0;
%[min_fitness, bestID] = min( pop(feasID, k+1) );
min_fitness = min(pop(:,k+1));
avg_fitness = sum(pop(:, k+1))/N;
x1 = pop(:,1:k+2);
disp(['Best Individual Fitness= ' num2str( min_fitness) ...
    ', Average Fitness of the population= ' num2str( avg_fitness ) ]);
%disp(['Best Individual= [' num2str(pop(bestID, 1:k)) ' ].'])
fprintf(fid2,' %d %e  %e \n',gen,min_fitness,avg_fitness);
 c1=min_fitness;
 c2=gen;
plot(c2,c1,'r','LineWidth',2.0); hold on;

%--------------------------------------------------------------------------
% START ITERATIONS
%--------------------------------------------------------------------------
gen = 2; % First Generation
i=1;
while gen <= max_gen

    disp(['>>> Current Generation: ' num2str(gen)]);

    %--------------------------------------------------------------
    % REPRODUCTION (BINARY TOURNAMENT SELECTION)
    %--------------------------------------------------------------
    pop_sel = tournament(pop, k);

    %--------------------------------------------------------------
    % CROSSOVER (SBX)
    %--------------------------------------------------------------
    [pop_xover, n_realcross] = sbx( pop_sel, p_cross, n_realcross, eta_c, Xmin, Xmax );

    %--------------------------------------------------------------
    % MUTATION (PolyMut)
    %--------------------------------------------------------------
    [pop_mut, n_realmut] = pol_mut( pop_xover, p_mut, n_realmut, eta_m, Xmin, Xmax );

    % --------------------------------------------------------------- %
    % COMBINE PARENTS-CHILDREN & REDUCE POPULATION SIZE TO N
    % --------------------------------------------------------------- %
    pop = combine_and_reduce(pop, pop_mut, problem, ncon); % elite preservation
    
    % --------------------------------------------------------------- %
    % REPORT
    % --------------------------------------------------------------- %
    fid1 = report(pop, k, N, fid1, gen, seed);
     x1(:,1:k+2)=pop(:,1:k+2);
    feasID = pop(:, k+2) == 0;
    %[min_fitness, bestID] = min( pop(feasID, k+1) );
    min_fitness = min(pop(:,k+1));
    avg_fitness = sum(pop(:,k+1))/N;
    c1(i)=min_fitness;
    c2(i)=gen;
 
    disp(['Best Individual Fitness= ' num2str( min_fitness) ...
        ', Average Fitness of the population= ' num2str( avg_fitness ) ]);
    %disp(['Best Individual= [' num2str(pop(bestID, 1:k)) ' ].'])
    fprintf(fid2,' %d %e  %e \n',gen,min_fitness,avg_fitness);
    %plot(gen,min_fitness,'-r*','LineWidth',2.0); hold on;
    % --------------------------------------------------------------- %
    gen = gen+1;
    i=i+1;
%plot(gen,min_fitness,'r','LineWidth',2.0); hold on;
end

% END OF ITERATIONS
plot(c2,c1,'r','LineWidth',2.0); hold on;

fclose(fid1); fclose(fid2);

% best_vs_average = importdata('Plot_Best_vs_Average_Fitness.out');
% plot(1:max_generation, best_vs_average(:,1), 'r','LineWidth',2.0); hold on;
% plot(1:max_generation, best_vs_average(:,2), 'b','LineWidth',2.0);
%xlabel('Generations'); ylabel('Fitness'); 
% title('Minimization of the Fitness');
% legend('Best Individual Fitness','Average Fitness of the Population'); grid on; hold off;

%best_design = importdata('Plot_Best_Feasible_Designs.out');
%disp(['Optimum design set is [ ' num2str( best_design(end,:) ) ' ].']);


