function pop_X=DPSO_update_X(pop_X,pop_V,A,N)
for i=1:N
    for j=1:length(pop_X(i,1:end-1))
        if pop_V(i,j)==1
            neibor_size=length(find(A(j,:)==1));
            neibor=find(A(j,:)==1);
            if neibor_size>1
               temp=tabulate(pop_X(i,neibor));
               [max_count,index]=max(temp(:,2));
               temp1=find(temp(:,2)==max_count);
               if length(temp1)>1
                  rand1=round(rand*length(temp1));
                  if rand1==0
                     rand1=1;
                  end
                  pop_X(i,j)=temp1(rand1,1);
               else
                  pop_X(i,j)=temp(index,1);
               end   
%             else
            elseif neibor_size==1
                pop_X(i,j)=pop_X(i,neibor);
            end
            end
        end
    end
end