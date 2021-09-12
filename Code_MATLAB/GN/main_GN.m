function [c, m, c1] = main_FN(filename)
    global matrix;

    matrix = csvread(filename);

    matrix_ = matrix;
    % edgesarray = sum(matrix_);
    edgesarray = sum(matrix);
    global edges;
    global vertices;
    vertices = size(matrix, 1);
    edges = sum(edgesarray);
    edges = edges / 2;
    deleted_edge = zeros(edges, 3);
    deleted_edge_number = 1;
    disp(edges);
    community = zeros(1, vertices);
    best_matrix = zeros(vertices,vertices);
    community_number = zeros(1,edges);
    number_community = 0;
    best_community = 0;
    k_max = 0;
    q_max = 0 - Inf;
    edges_copy = edges;
    edges_array = zeros(edges*2,2);
    tri_edges = zeros(edges,2);
    number_tri_row = zeros(vertices,1);
    number_row = zeros(vertices,1);
    row = 1;
    step = 1;
    tri_step = 1;
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
    while(row <= vertices)
        col = 1;
        while(col <= vertices)
            if matrix_(row,col) == 1
                edges_array(step,1) = row;
                edges_array(step,2) = col;
                step = step + 1;
                if (col > row)
                    number_tri_row(row) = number_tri_row(row) + 1;
                    tri_edges(tri_step,1) = row;
                    tri_edges(tri_step,2) = col;
                    tri_step = tri_step + 1;
                end
                number_row(row) = number_row(row) + 1;
            end
            col = col + 1;
        end
        row = row + 1;
    end
    num = 1;
    % here we just begin the G_N algorithm.
    % while (edges > 0 && num < 4)% case for cluster 4 group
    while (edges > 0 ) %case for more than 4 clusters
        t0 = clock;  % to calculate the time of the program.
        % the G_N algotithm just return 4 parameters, the deleted_edge,with the
        % information its two vertex and weight in the form (vertex1, vertex2,
        % weight) while vertex1 is always smaller than vertex2 on purpose.
        % and pos1 the deleged edges(vertex1,vertex2) and pos2 the edge(vertex2,vetex1) 
        % in the edges_array should be deleted, and pos the deleted
        % edge(vertex1, vertex2) should be deleted in the tri_edges array as
        % the G_N algorithm goes.
        [temp,pos1,pos2,pos] = GN_ver4(edges_array,tri_edges,number_row,number_tri_row,vertices, edges*2); 
        deleted_edge(deleted_edge_number,:) = temp;
        % we also need to update the adjacency matrix as we need to calculate
        % the number of the connected component of the current graph.
        matrix(temp(1), temp(2)) = 0;
        matrix(temp(2), temp(1)) = 0;  
        tri_edges(pos,:) = [];
        edges_array(pos1,:) = [];
        edges_array(pos2 - 1,:) = [];
        min = temp(1);
        if min > temp(2)
            min = temp(2);
        end
        % we also use a special matrix to record the numbered edges of every
        % vertex in order to find each edge's positon as same as we do to record a sparse matrix.
        number_tri_row(min) = number_tri_row(min) - 1;
        number_row(temp(1)) = number_row(temp(1)) - 1;
        number_row(temp(2)) = number_row(temp(2)) - 1;
        [community,num] = GN_Get_Connected_Number(matrix, vertices);
        community_number(deleted_edge_number) = num;        
        % if we just want to get 4 communities, we could stop when there is 4
        % connected component, if we want to get the maximum value of Q, well
        % you can just make a little change. that's easy.
    %     if num == 4 %> number_community% case for only four groups
                number_community = num;
                quantity = Calculate_Q(matrix_,community,edges_copy);
                if quantity > q_max
                    q_max = quantity;
                    best_matrix = matrix;
                    k_max = num;
                    best_community = community;
                end
    %     end
        deleted_edge_number = deleted_edge_number + 1;
        % after every circulation, one more edges is deleted. thus change the
        % data 'edges' accordingly.
        edges = edges - 1;        
    end
    [row, col] = size(best_community);
    %fprintf('Cluster: %d\n',row);
    
    clusters = zeros(length(matrix),1);
    k = 1;
    for i=1:row
        for j = 1:col
            if best_community(i,j) == 0
                k = k +1;
                break;
            end
            clusters(best_community(i,j)) = k;
            
        end
    end
               
    %fprintf('q: %f\n',q_max);
    %fprintf('cluster: %d\n',k_max);
    c = k_max;
    m = q_max;
    c1 = transpose(clusters);
end
