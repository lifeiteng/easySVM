function [optW cost]= svm5step(X, y, lambda)
%% Linear-SVM Minimize(Cost + lambda*Penalty)
% X: N¡Ádim
% y: {-1,+1}
% lambda: coefficient for Penalty part  
% By LiFeiteng Email:lifeiteng0422@gmail.com 

[N dim] = size(X);
w = rand(dim+1,1);
X = [ones(N,1) X]; % x = [1 x]

% minFunc From: http://www.di.ens.fr/~mschmidt/Software/minFunc.html
options.Method = 'lbfgs';%lbfgs
options.maxIter = 100;	  
options.display = 'on';
[optW, cost] = minFunc( @(p) svmCost(p, X, y, lambda), w, options);

end

function [cost grad] = svmCost(w, X, y, lambda)
% cost = HingeLoss^2 + lambda*||w||^2
% 1 2 3 4 5 step
yp = X*w;
idx = find(yp.*y<1);
err = yp(idx)-y(idx);
cost = err'*err + lambda*w'*w;
grad = 2*X(idx,:)'*err + 2*lambda*w;
end
