function cost = netbp2(neurons, data, labels, niter, lr, file)
%NETBP  Uses backpropagation to train a network 
[~,num_of_points] = size(data);
% Initialize weights and biases 
rng(5000);
W2 = 0.5*randn(neurons(1),2); W3 = 0.5*randn(neurons(2),neurons(1)); W4 = 0.5*randn(2,neurons(2));
b2 = 0.5*randn(neurons(1),1); b3 = 0.5*randn(neurons(2),1); b4 = 0.5*randn(2,1);

% Forward and Back propagate 
cost = zeros(niter,1); % value of cost function at each iteration
for counter = 1:niter
    k = randi(num_of_points);         % choose a training point at random
    x = data(k);
    % Forward pass
    a2 = activate(x,W2,b2);
    a3 = activate(a2,W3,b3);
    a4 = activate(a3,W4,b4);
    % Backward pass
    delta4 = a4.*(1-a4).*(a4-labels(:,k));
    delta3 = a3.*(1-a3).*(W4'*delta4);
    delta2 = a2.*(1-a2).*(W3'*delta3);
    % Gradient step
    W2 = W2 - lr*delta2*x';
    W3 = W3 - lr*delta3*a2';
    W4 = W4 - lr*delta4*a3';
    b2 = b2 - lr*delta2;
    b3 = b3 - lr*delta3;
    b4 = b4 - lr*delta4;
    % Monitor progress
    newcost = cost_function(W2,W3,W4,b2,b3,b4) ;  % display cost to screen
    cost(counter) = newcost;
    fprintf("i=%d  %e\n", counter, newcost); 
end

save(file,'W2','W3','W4','b2','b3','b4');

% Show decay of cost function  
save costvec
semilogy([1:1e4:niter],cost(1:1e4:niter))

  function costval = cost_function(W2,W3,W4,b2,b3,b4)
     costvec = zeros(num_of_points,1); 
     for i = 1:num_of_points
         x = data(k);
         a2 = activate(x,W2,b2);
         a3 = activate(a2,W3,b3);
         a4 = activate(a3,W4,b4);
         costvec(i) = norm(labels(:,i) - a4,2);
     end
     costval = norm(costvec,2)^2;
  end % of nested function

end
