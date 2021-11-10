function x = backward(B, b, ipivot)
    b_size = size(b);
    n = b_size(1);
    x = zeros(n, 1);
    y = zeros(n, 1);
    %solve y
    for k=1:n
        sigma_akj_xj = 0;
        for j = k-1:-1:1
            sigma_akj_xj = sigma_akj_xj+B(ipivot(k),j)*y(ipivot(j));
        end
        y(ipivot(k)) = b(ipivot(k))-sigma_akj_xj;
    end
    %solve x
    for k=n:-1:1
        sigma_akj_xj = 0;
        for j = k+1:n
            sigma_akj_xj = sigma_akj_xj+B(ipivot(k),j)*x(ipivot(j));
        end
        x(ipivot(k)) = (y(ipivot(k))-sigma_akj_xj)/B(ipivot(k),k);
    end
end