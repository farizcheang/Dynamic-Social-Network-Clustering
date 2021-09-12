function f = GA_evaluate_objective(x,adj_mat)

 clu_assignment = GA_decode(x);
 f = modularity(adj_mat,clu_assignment);

end