function B = GE(A)
    A_size = size(A);
    n = A_size(1);
    B = zeros(n,n);
    for k = 1:n
        %store U
        for j = k:n
            sum = 0;
            for s = 1:k-1
                sum = sum + B(k, s) * B(s, j);
            end
            B(k, j) = A(k, j) - sum;
        end
        %store L
        for i = k+1:n
            sum = 0;
            for s = 1:k-1
                sum = sum + B(i, s) * B(s, k);
            end
            B(i, k) = (A(i, k) - sum) / B(k, k);
        end
    end
end