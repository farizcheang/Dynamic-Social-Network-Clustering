function f  = GA_genetic_operator(parent_chromosome,adj_mat,edgeslist,M,V,pc,pm)

[N,m] = size(parent_chromosome);
clear m

% crossover
p = 1;
for i = 1 : N 
    % Select the first parent
    parent_1 = ceil(N*rand(1));      
    % Select the second parent
    parent_2 = ceil(N*rand(1));     
    % Make sure both the parents are not the same. 
    while isequal(parent_chromosome(parent_1,:),parent_chromosome(parent_2,:))
        parent_2 = ceil(N*rand(1));
    end
    % Get the chromosome information for each randomnly selected parents
    parent_1 = parent_chromosome(parent_1,:);
    parent_2 = parent_chromosome(parent_2,:);
    % Initialize the children to be null vector.
    child_1 = [];
    child_2 = [];
    if rand<=pc
        % Perform corssover for each decision variable in the chromosome.
        bin_vec = round(rand(1,V));       
        for j = 1 : V
            if bin_vec(j) == 1
                child_1(j) = parent_1(j);
                child_2(j) = parent_2(j);
            else
                child_1(j) = parent_2(j);
                child_2(j) = parent_1(j);
            end
        end
        % Evaluate the objective function for the offsprings and as before
        % concatenate the offspring chromosome with objective value.
        child_1(:,V + 1: M + V) = GA_evaluate_objective(child_1,adj_mat);
        child_2(:,V + 1: M + V) = GA_evaluate_objective(child_2,adj_mat);    
    else
        child_1 = parent_1(1:V+M);
        child_2 = parent_2(1:V+M);  
    end
    f(p,:) = child_1;
    f(p+1,:) = child_2;
    p = p + 2;
end

% mutation
[NN,m] = size(f);
clear m
for i = 1 : NN
    for j = 1:V
        if rand<=pm
            if edgeslist(j).n >= 2
                temp = f(i,j);
                while 1
                    f(i,j) = edgeslist(j).e(ceil(rand*edgeslist(j).n));
                    if temp ~= f(i,j)
                        break;
                    end
                end         
            end     
        end
    end
    f(i,V + 1: M + V) = GA_evaluate_objective(f(i,1:V),adj_mat);
end

end
