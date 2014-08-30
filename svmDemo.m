clear
close all
addpath([pwd '\minFunc'])

x0 = [1 4]';
x1 = [4 1]';

X0 = [];
X1 = [];
for i = 1:40
    X0 = [X0 normrnd(x0, 1)];
    X1 = [X1 normrnd(x1, 1)];
end
X = [X0 X1]';
y = [-ones(size(X0,2),1); ones(size(X1,2),1)];
save data X0 X1 X y

plot(X0(1,:),X0(2,:), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
hold on
plot(X1(1,:),X1(2,:), 'k+','LineWidth', 2, 'MarkerSize', 7);

lambda = 0.01;
w = svm5step(X, y, lambda)
k = -w(2)/w(3); b = -w(1)/w(3);
h = refline(k,b); %已知斜率w 截距b 画直线
set(h, 'Color', 'r')

b = -(w(1)+1)/w(3);
h = refline(k,b); %已知斜率w 截距b 画直线
b = -(w(1)-1)/w(3);
h = refline(k,b); %已知斜率w 截距b 画直线
title(['5 steps Linear-SVM: \lambda = ' num2str(lambda)] )



