function X_new = limit_matrix_rows(X, limit)
    [n, m] = size(X);  
    if n > limit
        X_new = X(1:limit,:);
    else
        X_new = X;
    end
end
