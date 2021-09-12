function f = GA_roulette_selection(chromosome, pool_size)
    [pop, objective] = size(chromosome);
    
    objective_sum = sum(chromosome(:,objective));
    objective_p = chromosome(:,objective)/objective_sum;
    objective_qp = zeros(pop,1);
    objective_qp(1) = objective_p(1);
    
    for i = 2:pop
        objective_qp(i) = objective_qp(i-1) + objective_p(i);
    end
    
    for i = 1:pool_size
        randnum = rand;
        index = find(objective_qp >= randnum);
        f(i,:) = chromosome(index(1),:);
    end
end

