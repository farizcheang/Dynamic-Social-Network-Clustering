function [deleted_edge,pos1,pos2,position] = GN_ver4(edges_array, tri_edges,number_per_row,tri_number,vertices,edges)
% as we update our program for many a time, here is the 4 edition, you can
% change the name of this procedure as you like.

% to accomoplish the algorithm in a linear time, here we just use a array
% to record the message of every edges in the form of 
% (vertex1, vertex2,% weight),thus the time complexity is O(m) instead of
% O(n*n) when traversal the matrix to find each edge.

% in our program we use two edges array, one is the edges_array, which
% contains all the edges of every vertex, thus it has vertices * 16 rows,
% with the degree of every vertex is 16. the other is the tri_edges array,
% whhich means the upper_tri-edges_array, the reason is: we have to give
% each edge a serial number, and we just give them the number in the
% following ways: all the edges be numbered from the first row of the
% adjacency matrix to the last row, to avoid being repeated, the same edge
% is ingored by only record the edges when the column is large than the
% row. Yes, we just use the upper_triangular half of the whole adjacency
% matrix. 
% Accordingly, the edges_array is used to find the predecessors of a
% vertex, and the tri-edges array is used to find the place of a certain
% edges in the weihth_array in the circulation when every vertex be as the
% source vertex to calculate the total weight of a edges. 

source = 1;
edge_dependency = zeros(edges/2,3); %to store the two vertex of the edge and its edgebetweenness.

% all vertexes be as the source vertex for one time.
while (source <= vertices)    
    % the array distance is used to record the distance of every vertex in
    % the traversal. in fact the distence of every vertex is the steps we
    % take to get the vertex from the source vertex. and all the values is
    % initialed -1.
    vertex_dependency = zeros(1,vertices);
    distance = zeros(1,vertices);
    distance = distance - 1;
    % the array weight is uesd to record the weitht of each vertex, in fact
    % its value is the number of routes go through the vertex.
    % and the value is calculated when we trace back from the leaf_vertex
    % to the source vertex.
    weight = zeros(1,vertices);
    % we use a array to imitate the queue, using in the breadth first
    % traverse.
    queue = zeros(1,vertices);
    que_in = 1;
    que_out = 1;
    distance(source) = 0;
    weight(source) = 1;
    queue(que_in) = source;
    que_in = que_in + 1;
    % here is the very importance of our implement: as you known we have to
    % calculate the weight of every edges and the value is calculated by
    % dividing the weight of the upper vertex by the lowwer vertex's. so we
    % have to record every vertex and its prodromous vertex. at first,a
    % stack is consedered, but after carefully thinking. we changed out
    % mind.
    % here we just make a short cut by just record the sequence of our
    % traverse in the BFS(breadth first traverse), and trace back just the
    % reverse order of the very same edges we do in the BFS.
    % thus the time complexity is O(n*(m + m) + 4n*(n+14)/m),the former 'm'means the queue in
    % BFS, and the latter 'm' is  
    edges_order = zeros(edges/2,2);
    i = 1;
    while (que_in - que_out > 0)        
        v = queue(que_out);
        que_out = que_out + 1;            
        step = 1;
        pos = 1;
        while(step < v)
            pos = pos + number_per_row(step);
            step = step + 1;
        end
        while (pos <= edges && edges_array(pos,1) == v)            
            w = edges_array(pos,2);
            if distance(w) < 0 
                queue(que_in) = w;
                que_in = que_in + 1;
                distance(w) = distance(v) + 1;
            end
            if distance(w) == distance(v) + 1
                weight(w) = weight(w) + weight(v);
                edges_order(i,1) = v;
                edges_order(i,2) = w;
                i = i + 1;
            end
            pos =  pos + 1;
        end
    end % end of the queue circulation
    
    
    i = i - 1;
    while(i >= 1)
        w = edges_order(i,2);
        while (i >= 1 && edges_order(i,2) == w)
            v = edges_order(i,1);
            partialdependency = weight(v) / weight(w);
            partialdependency = partialdependency * (1 + vertex_dependency(w));
            vertex_dependency(v) = vertex_dependency(v) + partialdependency;
            row_here = w;
            col_here = v;
            if w > v
                row_here = v;
                col_here = w;
            end
            row = 1;
            place = 1;
            % here is where the time complexity O(4n*(n+14)/m) happens.
            % I try to calculate the whole time complexity with the help of
            % the upper_tri_edges_array, but in fact I make a referrence to
            % the original sparse matrix.remember the degree of each vertex
            % is 16.
            % the time complexity of find the place of the the 
            % first row is: 0+0, 0+1, ... ...,0+15
            % the second  : 1+0, 1+1, ... ...,1+15
            %               ... ... ... ... ...
            % the last:    (n-1)+0,(n-1)_1,... ...(n-1)+15
            % and the the probability of every edges is 1/(2*m)
            % so the whole time complexity is 
            %1/(2*m)+(0+0 + 0+1 + ... + 0+15 +
            %         1+0 + 1+1 + ... + 1+15 +
            %         ... ... ... ...
            %         (n-1)+0 + (n-1)+1 + (n-1)+15 )
            % thus we get 4n*(n+14)/m. in the whole circulation when every
            % vertex be considered to be the source vertex.
            
            while (row < row_here)
                place = place + tri_number(row);
                row = row + 1;
            end
            while(place <= edges/2 && tri_edges(place,2) ~= col_here)
                place = place + 1;
            end
            edge_dependency(place, 3) = edge_dependency(place, 3) + partialdependency;
            edge_dependency(place, 1) = row_here;
            edge_dependency(place, 2) = col_here;
            i = i - 1;
        end
    end        
 
    source = source + 1;
end % while (source ...)
max = edge_dependency(1,3);
step = 1;
position = 1;
while(step <= edges/2)
    if edge_dependency(step,3) > max
        position = step;
        max = edge_dependency(step,3);
    end
    step = step + 1;
end
pos1 = 0;
pos2 = 0;
step = 1;
temp = edge_dependency(position,:);
while(step <= edges)
    if sum(edges_array(step,:) == temp(1:2)) == 2
        pos1 = step;
    end
    if edges_array(step,1) == temp(2) && edges_array(step,2) == temp(1)
        pos2 = step;
    end
    if pos1 > 0 && pos2 > 0
        break;
    end
    step = step + 1;
end
deleted_edge = edge_dependency(position,:);

