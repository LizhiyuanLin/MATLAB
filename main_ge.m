n = 2000;
x = ones(n,1);

num_of_matrices = 5;
A = rand(n,n,num_of_matrices);
b = zeros(n,num_of_matrices);
for i=1:num_of_matrices
    b(:,i) = A(:,:,i)*x;
end

fprintf("exp# \t A\\b \t no pivoting \t pivoting \t cond(A) \n");
for i=1:num_of_matrices
    B = GE(A(:,:,i));
    x_GE=backward(B,b(:,i),1:n);
    [B,ipivot] = GEPP(A(:,:,i));
    x_GEPP=backward(B,b(:,i),ipivot);
    fprintf("%i \t % .2e \t % .2e \t % .2e \t %i \n", i, norm(x-A(:,:,i)\b(:,i))/norm(x), norm(x-x_GE)/norm(x), norm(x-x_GEPP)/norm(x), cond(A(:,:,i)));
end