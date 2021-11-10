function [B, ipivot] = GEPP(A)
    n = length(A);
    ipivot = 1:n;
    L = zeros(n,n);
    for k = 1:n
        max = 0;
        q = 0;
        for i=k:n
            if abs(A(ipivot(i),k)) > max
                max = abs(A(ipivot(i),k));
                q = i;
            end
        end
        ipivot([q k]) = ipivot([k q]);
        for i = k+1:n
            L(ipivot(i), k) = A(ipivot(i), k) / A(ipivot(k), k);
            A(ipivot(i), :) = A(ipivot(i), :) - A(ipivot(k), :)*L(ipivot(i), k);
        end
    end
    B = L+A;
end