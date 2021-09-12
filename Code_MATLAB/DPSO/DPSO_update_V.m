function pop_V=DPSO_update_V(pop_X,pop_V,pbest,gbest,c1,c2,w,N)
% "position-position" operator
temp1=pbest(:,1:end-1)-pop_X(:,1:end-1);
temp1(temp1~=0)=1;

Gbest=repmat(gbest,[N,1]);
temp2=Gbest(:,1:end-1)-pop_X(:,1:end-1);
temp2(temp2~=0)=1;

temp3=c1*rand*temp1+c2*rand*temp2;
% "velocity+velocity" operator
temp4=w.*pop_V+temp3;
for i=1:N
    temp4(i,temp4(i,:)>=1)=1;
    temp4(i,temp4(i,:)<1)=0;
end
pop_V=temp4;
    