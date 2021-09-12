function [c, m, c1] = main_DPSO(filename)
    
    A = csvread(filename);

    % Parameters
    N=100; % partical swarm size N
    gmax=100; % number of interations
    c1=1.494; % learning factor c1;
    c2=1.494; % learning factor c2;
    w_max=0.9; % max inertia weight
    w_min=0.4; % min inertia weight

    % Step1:population initialization via PGLP
    iters=5; % label propagation iterations
    [chrom_size,~]=size(A); % the size of chromosome
    pop_X=zeros(N,chrom_size+1);
    pop_X(:,1:end-1)=DPSO_initialize_PGLP(iters,chrom_size,N,A); % PGLP
    pop_V=zeros(N,chrom_size); % initialize velocity vectors
    m=length(find(A==1))/2; % calculate the number of edges
    pop_X=DPSO_fitness(pop_X,A,chrom_size,m,N); % calculate the fitness of swarms

    % initialize the current best position vectors
    pbest=zeros(N,chrom_size+1);
    pbest(:,1:end-1)=DPSO_initialize_PGLP(iters,chrom_size,N,A); 
    pbest=DPSO_fitness(pbest,A,chrom_size,m,N);
    pbest=DPSO_rearrange(pbest);

    % initialize the global best position vectors
    [~,gbest_index]=max(pop_X(:,end)); % calculate the index of 
                                         % the best fitness
    gbest=pop_X(gbest_index,:);

    % Step2:searching                                   
    for t=1:gmax
        w=(w_max-w_min)*(gmax-t)/gmax+w_min; % a linearly decreasing inertia
                                               % weight
        % rearrange pop_X
        pop_X=DPSO_rearrange(pop_X);
        % update velocity vectors
        pop_V=DPSO_update_V(pop_X,pop_V,pbest,gbest,c1,c2,w,N);
        % update position vectors
        pop_X=DPSO_update_X(pop_X,pop_V,A,N);
        % calculate the fitness of swarms
        pop_X=DPSO_fitness(pop_X,A,chrom_size,m,N); 
        % update pbest and gbest
        pbest=DPSO_update_pbest(pbest,pop_X);
        [~,gbest_index]=max(pbest(:,end)); % calculate the index of 
                                         % the best fitness
        gbest=pbest(gbest_index,:); % initialize the global best 
                                       % position vectors
        %fprintf('%dth generation completed/100\n',t);
        %fprintf('The modified modularity is %f\n',modularity(A,gbest(1:end-1)))
        
    end
    %fprintf('The number of clusters is %d\n',max(gbest()));

    m = modularity(A,gbest(1:end-1));
    c = max(gbest());
    c1 = gbest(1:end-1);
end