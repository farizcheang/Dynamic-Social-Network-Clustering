function f = GA_initialize_variables(N, el,adj_mat, M, V)

K = M + V;

for i = 1 : N
    
    for j = 1 : V
        f(i,j) = el(j).e(ceil(rand*el(j).n));
    end
   
    f(i,V + 1: K) = GA_evaluate_objective(f(i,1:V),adj_mat);
end

end
