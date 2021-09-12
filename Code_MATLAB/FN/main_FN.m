function [c, m, c1] = main_FN(filename)


    %matrix = csvread(filename);
    matrix = csvread(filename);

    % calculate the number of edges and vertices
    vertices = size(matrix,1);
    edges = (sum(sum(matrix))) / 2;

    % initial array a to record the ratio and e the ratio of edges among communities to all edges.  
    % and to realize it more convinient, we just multiply the by (2 * edges).
    a = zeros(vertices,1);
    e = matrix;
    e_row = vertices;

    % allocate delta_Q to record the best delta_q in every merge.and
    % sum_delta-Q the total delta_q for the finished k times merge.
    delta_Q = zeros(vertices-1,1);
    sum_delta_Q = 0;
    upper_tri_edges_array = zeros(edges,4);

    % initial the community as all sole vertex and at last the community maybe
    % merged into a whole one, so it sizes vertices * vertices.
    communities = zeros(vertices,vertices);
    c_step = 1;
    while(c_step <= vertices)
        community(c_step,1) = c_step;
        c_step = c_step + 1;
    end
    numbers_per_community = ones(vertices,1);

    % allocate the best_communiy to record the best community when the Q is at
    % its maximum.
    best_community = 0;

    % calculate the raw Q.
    Q = Calculate_Q(matrix,community,edges);

    % as we use a sparse matrix, in order to accomplish the algorithm in a
    % linear time, we just record the necessary massege of the edges, which is
    % record in the array 'upper_tri_edges_array'.
    % now we just initial a and the array.
    best_pos = 0;
    row_step = 1;
    edges_step = 1;
    while(row_step <= vertices)
        col_step = row_step + 1;
        a(row_step) = sum(matrix(row_step,:));
        while(col_step <= vertices)
            if matrix(row_step,col_step) == 1
                upper_tri_edges_array(edges_step,1) = row_step;
                upper_tri_edges_array(edges_step,2) = row_step;
                upper_tri_edges_array(edges_step,3) = col_step;
                upper_tri_edges_array(edges_step,4) = col_step;
                edges_step = edges_step + 1;
            end
            col_step = col_step + 1;
        end
        row_step = row_step + 1;
    end

    % now is the very essence of the algorithm.
    % there is at most (vertices - 1) times merge. and after very merge the
    % number of communities will be minus by 1, and the edges between the tow
    % communities merged this time should be deleted from the
    % upper_tri_edges_array. that means we need to update the edges array after
    % each merge, so are the comunities array, the e array, the a array, the
    % delta_Q array and etc.
    times = 1;
    edges_number = edges;
    while(times < vertices && edges_number > 0)    
        t0 = clock;
        pos = 1;
        % according to the greedy algorithm, in each times circulation we just
        % calculate all the possible merge and choose the best one, here we
        % choose the one which increase the Q at most if any or the one
        % decrease the least. thus have to record the best delta_Q and the best
        % position when the merge occurs.
        max = 0;
        min = 0 - Inf;
        pos_max = 1;
        pos_min = 1;
        edges_step = 1;
        while(edges_step <= edges_number)
            % here is the accomplishment of the greedy algorithm, we travesal
            % all the possible merge and record the probobal best ones.
            i = upper_tri_edges_array(edges_step,2);
            j = upper_tri_edges_array(edges_step,4);
            q = 2*(e(i,j) - a(i)*a(j)/(2*edges));
            if q >= 0
                if q > max
                    max = q;
                    pos_max = edges_step;
                end
            else
                if q > min
                    min = q;
                    pos_min = edges_step;
                end
            end
            edges_step = edges_step + 1;
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if max > 0
            delta_Q(times) = max;
            pos = pos_max;
        elseif min > (0-Inf)
            delta_Q(times) = min;
            pos = pos_min;
        end

        % in our realization of the algorithm, I merge the two communities to
        % be one with the minimum number of them two and just discard the
        % larger one.thus update all the other data structute accordingly.
        c_min = upper_tri_edges_array(pos,2);
        c_max = upper_tri_edges_array(pos,4);
        if c_min > c_max
            temp = c_min;
            c_min = c_max;
            c_max = temp;
        end
        % here we updata the e array by add the c_max row and column to the
        % c_min row and column. and delete the former two.
        e_step = 1;    
        while(e_step <= e_row)
            e(e_step,c_min) = e(e_step,c_min) + e(e_step,c_max);
            e(c_min,e_step) = e(c_min,e_step) + e(c_max,e_step);
            e_step = e_step + 1;
        end    
        e(c_min,c_min) = e(c_min,c_min) - e(c_max,c_min) - e(c_max,c_max);
        e(c_max,:) = [];
        e(:,c_max) = [];
        e_row = e_row - 1;
        a(c_min) = a(c_min) + a(c_max);
        a(c_max,:) = [];

        %update the communities array and merge the two ocmmunity, as the
        %community record the vertices within.
        c_step = 1;
        limit = numbers_per_community(c_max);
        p = numbers_per_community(c_min);
        while(c_step <= limit)
            community(c_min,p+c_step) = community(c_max,c_step);
            c_step = c_step + 1;
        end
        numbers_per_community(c_min) = numbers_per_community(c_min) + numbers_per_community(c_max);
        community(c_max,:) = [];
        numbers_per_community(c_max,:) = [];
        upper_tri_edges_array(pos,:) = [];
        edges_number = edges_number - 1;  
        c_row = size(community,1);

        % the most important update of all the data structures, as the
        % upper_tri_edges_array will affect the times of the inferior
        % circulation and the time complexity of our realization.
        e_step = 1;
        while(e_step <= edges_number)
            if upper_tri_edges_array(e_step,2) == c_max
                upper_tri_edges_array(e_step,2) = c_min;
            end
            if upper_tri_edges_array(e_step,2) > c_max
                upper_tri_edges_array(e_step,2) = upper_tri_edges_array(e_step,2) - 1;
            end
            if upper_tri_edges_array(e_step,4) == c_max
                upper_tri_edges_array(e_step,4) = c_min;
            end
            if upper_tri_edges_array(e_step,4) > c_max
                upper_tri_edges_array(e_step,4) = upper_tri_edges_array(e_step,4) - 1;
            end
            if upper_tri_edges_array(e_step,2) == upper_tri_edges_array(e_step,4)
                upper_tri_edges_array(e_step,:) = [];
                edges_number = edges_number - 1;
            else
                e_step = e_step + 1;
            end
        end

        % if this times of merge still increase the Q, we'll continue,
        % otherwise we just, er ,,, break!
        if sum_delta_Q < sum_delta_Q + delta_Q(times)
            best_community = community;
            best_pos = times;
        else
            break;
        end
        sum_delta_Q = sum_delta_Q + delta_Q(times);
        time = etime(clock,t0);
        times = times + 1;
    end
    % here we are, we just arrive at the destination. Just output your result. 
    Q = Q + sum_delta_Q/(2*edges);
    %fprintf('Q: %f\n',Q);
    
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
    c = row;
    m = Q;
    c1 = transpose(clusters);
    %best_community
end

% save('result.mat','best_community');










