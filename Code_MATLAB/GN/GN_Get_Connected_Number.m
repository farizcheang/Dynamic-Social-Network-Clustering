function [communities,communities_num] = GN_Get_Connected_Number(matrix, vertices)
%disp('enter Get_Connected_Number');
visited = zeros(1, vertices);
vertex = 1;
communities_num = 0;
while (vertex <= vertices)
    if visited(vertex) == 0
        visited(vertex) = 1;
        communities_num = communities_num + 1;
        length = 1;
        communities(communities_num,length) = vertex;
        length = length + 1;
        queue = zeros(1,vertices);
        que_in = 1;
        que_out = 1;
        queue(que_in) = vertex;
        que_in = que_in + 1;
        while(que_in - que_out > 0)
            v = queue(que_out);
            que_out = que_out + 1;
            col = 1;
            while(col <= vertices)
                if matrix(v, col) == 1 && visited(col) == 0 
                    queue(que_in) = col;
                    que_in = que_in + 1;
                    visited(col) = 1;
                    communities(communities_num, length) = col;
                    length = length + 1;
                end
                col = col + 1;
            end
        end
    end
    vertex = vertex + 1;
end                
