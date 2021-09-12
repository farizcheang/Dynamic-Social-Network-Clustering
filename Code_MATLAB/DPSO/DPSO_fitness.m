function pop_X=DPSO_fitness(pop_X,A,chrom_size,m,N)
for k=1:N
    sum=0;
    for i=1:chrom_size
        for j=1:chrom_size
            if pop_X(k,i)==pop_X(k,j) && i~=j
               deltaij=1;
               ki=length(find(A(i,:)==1)); % calculate the degree of node i
               kj=length(find(A(j,:)==1)); % calculate the degree of node j
               sum=sum+(A(i,j)-ki*kj/(2*m))*deltaij;
            end
        end
    end
    pop_X(k,end)=1/(2*m)*sum;
end