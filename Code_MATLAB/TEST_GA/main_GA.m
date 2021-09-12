function [c, m, c1] = main_GA(filename)

adj_mat = csvread(filename);

%% Parameters
popsize = 100; 
gen = 100; 
pc = 0.9; 
pm = 0.1;  
M = 1; 
[V,temp] = size(adj_mat); % when have real label
% [V] = size(adj_mat); % when no real label
edgeslist = GA_edges_list(adj_mat,V);% edgeslist

%% Initialize the population
chromosome = GA_initialize_variables(popsize,edgeslist,adj_mat,M,V);

%% Sort the initialized population
chromosome = GA_sort_mod(chromosome,M,V);

%% Start the evolution process

    for i = 1:gen
        % Select the parents
        % Parents are selected for reproduction to generate offspring.
        % pool - size of the mating pool. It is common to have this to be half the
        % population size.
        pool = round(popsize/2);
       
        % Selection process
        parent_chromosome = GA_roulette_selection(chromosome, pool);
        
        % Perform crossover and Mutation operator
        offspring_chromosome = GA_genetic_operator(parent_chromosome,adj_mat,edgeslist,M,V,pc,pm);
        
        % Intermediate population
        % intermediate_chromosome is a concatenation of current population and
        % the offspring population. 
        [main_pop,temp] = size(chromosome);
        [offspring_pop,temp] = size(offspring_chromosome);
        
        % temp is a dummy variable.
        clear temp
        intermediate_chromosome(1:main_pop,:) = chromosome;
        intermediate_chromosome(main_pop + 1 : main_pop + offspring_pop,1 : M+V) = ...
            offspring_chromosome;
            
        % The intermediate population is sorted again before the replacement 
        % operator is performed on the intermediate population.
        intermediate_chromosome = GA_sort_mod(intermediate_chromosome, M, V);
        
        % Once the intermediate population is sorted only the best solution is
        % selected
        chromosome = GA_replace_chromosome(intermediate_chromosome,popsize);
        
        % Display useful information
        best_clu = GA_decode(chromosome(1,1:V));
        best_clunum = max(best_clu);
      
        %fprintf('%d generations completed; %d communities are found.\n',i,best_clunum);
        %fprintf('Objective: %f\n',chromosome(1,V+M));
        m = chromosome(1,V+M);
        c = best_clunum;
        c1 = best_clu;
    end 


end



