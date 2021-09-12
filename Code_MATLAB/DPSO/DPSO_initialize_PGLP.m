function population = DPSO_initialize_PGLP(iters, chrom_size,N,A)
population = zeros(N,chrom_size); % initialize the population

% firstly assign a unique label to each node
for i=1:chrom_size
    population(:,i)=i;
end

% secondly, for every vertex, update labels of each node via label
% propagation
for i=1:N
    for j=1:iters
        for k=1:chrom_size
            neighbor_size=length(find(A(k,:)==1)); % calculate the size of 
                                       %  neighbor of every vertex
            neighbor=find(A(k,:)==1); % find the neighbors
            if neighbor_size>1
                     % label propagation operation
                     temp=tabulate(population(i,neighbor));
                     [max_count,index]=max(temp(:,2));
                     temp1=find(temp(:,2)==max_count);
                     if length(temp1)>1
                        rand1=round(rand*length(temp1));
                        if rand1==0
                            rand1=1;
                        end
                        population(i,k)=temp1(rand1,1);
                     else
                         population(i,k)=temp(index,1);
                     end
            elseif neighbor_size==1
                population(i,k)=population(i,neighbor);
            end
            end
     end
  end
end
