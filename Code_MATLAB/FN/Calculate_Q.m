function value_Q = Calculate_Q(matrix,best_community,edges)
%disp('enter Calculate_Q');
%disp(best_community);
value_Q = 0;

row = size(best_community,1);
matrix_q = zeros(row,row);
step_row_1 = 1;
edge_between = zeros(row, row);
while(step_row_1 <= row)
    step_row_2 = step_row_1;
    while(step_row_2 <= row)
        len1 = length(best_community(step_row_1,:));
        step_col_1 = 1;
        while(step_col_1 <= len1)
            step_col_2 = 1;
            len2 = length(best_community(step_row_2,:));
            while(step_col_2 <= len2)
                if best_community(step_row_1,step_col_1) ~= 0 && best_community(step_row_2,step_col_2) ~= 0
                    if matrix(best_community(step_row_1,step_col_1), best_community(step_row_2, step_col_2))==1
                        edge_between(step_row_1,step_row_2) = edge_between(step_row_1,step_row_2) + 1;
                    end
                end
                step_col_2 = step_col_2 + 1;
            end
            step_col_1 = step_col_1 + 1;
        end
        edge_between(step_row_2, step_row_1) = edge_between(step_row_1,step_row_2);
        if step_row_2 == step_row_1
            edge_between(step_row_1, step_row_2) = edge_between(step_row_1,step_row_2) / 2;
        end
        step_row_2 = step_row_2 + 1;
    end
    step_row_1 = step_row_1 + 1;
end
matrix_q = edge_between / edges;
step_row = 1;
e = 0;
a = zeros(1,row);
while(step_row <= row)
    e = e + matrix_q(step_row,step_row);
    step_col = 1;
    while(step_col <= row)
        a(step_row) = a(step_row) + matrix_q(step_row,step_col);
        step_col = step_col + 1;
    end
    step_row = step_row + 1;
end
value_Q = e;
step_row = 1;
while(step_row <= row)
    value_Q = value_Q - a(step_row) * a(step_row);
    step_row = step_row + 1;
end

        