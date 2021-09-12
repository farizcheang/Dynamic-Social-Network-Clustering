function pop_X=rearrange(pop_X)
[index11,~]=size(pop_X);
for i=1:index11
    class=unique(pop_X(i,1:end-1));
    index1=zeros(1,length(class));
    for j=1:length(class)
        index1(1,j)=find(pop_X(i,1:end-1)==class(1,j), 1 );
    end
    [~,index2]=sort(index1);
    for k=1:length(class)
        pop_X(i,pop_X(i,1:end-1)==class(1,index2(1,k)))=k;
    end
end