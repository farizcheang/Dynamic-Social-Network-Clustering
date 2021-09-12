function f = GA_sort_mod(x, M, V)
    [N, ~] = size(x);
    [~,index] = sort(x(:,M + V),'descend');
    for i = 1 : N
        f(i,:) = x(index(i),:);
    end
end

