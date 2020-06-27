clc
close all
clear all


disp('Plotting the data...\n');
data=load('ex1data1.txt');
X=data(:,1); % input
y=data(:,2); % output
m=length(X); % number of training samples

plot(X,y,'rx','MarkerSize',10);
xlabel('Population in the city in 10,000 rupees');
ylabel('profit in 10,000s');

X=[ones(m,1),data(:,1)]; % adding rows of one into the data
theta=[-1;2]; % Initialize the theta

iter=1500;
alpha=0.01;



for i=1:iter
    
    predictions=X*theta;
    sqrErrors=((predictions-y).^2);
    J_history(iter,1)=(1/(2*m)).*(sum(sqrErrors));
    
    J1=1/(m).*sum(predictions-y);
    J2=1/(m).*sum((predictions-y).*X(:,2));
    Jacobian=[J1;J2];
    
    theta=theta-alpha.*Jacobian;
    
end

