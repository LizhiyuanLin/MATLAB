A = rand(4)
x = [2;2;2;2];
b = A*x;
fprintf("=========================")

[B, ipivot] = GEPP(A);
B
% [B, ipivot] = lupp(A);
% B
% [B(ipivot(1),:);
%     B(ipivot(2),:);
%     B(ipivot(3),:);
%     B(ipivot(4),:)]
x = backward(B, b, ipivot)
A\b
