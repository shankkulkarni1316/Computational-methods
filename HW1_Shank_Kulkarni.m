% Shank Kulkarni  @ 08/30/17
%Homework-1, question 3
%Computational methods 

clear all

h = [10^-5,5*10^-5,10^-4,5*10^-4,10^-3,5*10^-3,10^-2,5*10^-2,10^-1,5*10^-1,1,5,10]; % range of h
x0 = [0,1]; % derivative for these two points

f_x = @(x) (exp(-5.*x.*x)).*(cos(pi.*x)); % Given function
f_x_dash = @(x) (exp(-5*x*x))*((-pi*sin(pi*x))-(10*x*cos(pi*x))); % Exact Derivative of given function

% Initializing all parameters
a = size(x0); b = size(h);
f_dash_x_approx_1 = zeros(a(2),b(2)); f_dash_x_approx_11 = zeros(a(2),b(2)); f_dash_x_approx_2 = zeros(a(2),b(2)); f_dash_x_approx_4 = zeros(a(2),b(2));
error_1_forward = zeros(a(2),b(2)); error_1_backward = zeros(a(2),b(2)); error_2 = zeros(a(2),b(2)); error_4 = zeros(a(2),b(2));

for i = 1:a(2) % loop for different points
    for j = 1:b(2) % loop for range of h
        
        f_dash_abs =  f_x_dash(x0(i));% absolute value of derivative 
    
        % 1st Order (Forward)
        f_dash_x_approx_1(i,j) = (f_x(x0(i)+h(j)) - f_x(x0(i)))/(h(j));
        error_1_forward(i,j) = abs(f_dash_abs - f_dash_x_approx_1(i,j));
        
        % 1st Order (Backward)
        f_dash_x_approx_11(i,j) = (f_x(x0(i)) - f_x(x0(i)-h(j)))/(h(j));
        error_1_backward(i,j) = abs(f_dash_abs - f_dash_x_approx_11(i,j));
        
        % 2st Order (Centered)
        f_dash_x_approx_2(i,j) = (f_x(x0(i)+h(j)) - f_x(x0(i)-h(j)))/(2*h(j));
        error_2(i,j) = abs(f_dash_abs - f_dash_x_approx_2(i,j));
        
        % 4st Order (Centered)
        f_dash_x_approx_4(i,j) = ((f_x(x0(i)-2*h(j)))+((8*f_x(x0(i)+h(j))-8*f_x(x0(i)-h(j))))-(f_x(x0(i)+2*h(j))))/(12*h(j));
        error_4(i,j) = abs(f_dash_abs - f_dash_x_approx_4(i,j));
    end
    figure
    p=loglog(h,error_1_forward(i,:),'o-','DisplayName','1st order (forward)'); hold on;p(1).LineWidth = 2;
    p=loglog(h,error_1_backward(i,:),'d-','DisplayName','1st order (backward)'); hold on;p(1).LineWidth = 2;
    p=loglog(h,error_2(i,:),'^-','DisplayName','2nd order (centered)'); hold on;p(1).LineWidth = 2;
    p=loglog(h,error_4(i,:),'s:','DisplayName','4th order (centered)'); hold on;p(1).LineWidth = 2;
    grid on
    xlabel('\Delta x'); ylabel('Approximation error');
    set(gca,'FontSize',30)
    set(gca,'fontname','times new roman')
    legend('show','Location','southeast');
    xticks([10^-5 10^-4 10^-3 10^-2 10^-1 10^0 10^1 ])
    xticklabels({'10^{-5}','10^{-4}','10^{-3}','10^{-2}','10^{-1}','10^{0}','10^{1}'})
    if (i==1)
        title('Graph of Approximation error e(x) at x = 0')
        xlim([10^-5,10]); ylim([10^-5,10^1]);
    else
        title('Graph of Approximation error e(x) at x = 1')
        xlim([10^-5,10]); ylim([10^-16,10^1]);
    end
end

%ploting function (to assure its even function)
x1 = -2:0.01:2;
y1 = f_x(x1);
figure
p=plot(x1,y1); grid on;
xlabel('x'); ylabel('f(x)'); p(1).LineWidth = 2;
set(gca,'FontSize',30)
set(gca,'fontname','times new roman')
xlim([-2,2]); ylim([-0.2,1.2]);
title('plot of fucntion f(x)')

% semilog plot of aproximation error at x=0 (to show error = 0)
figure
p=semilogx(h,error_1_forward(1,:),'o-','DisplayName','1st order (forward)'); hold on;p(1).LineWidth = 2;
p=semilogx(h,error_1_backward(1,:),'d-','DisplayName','1st order (backward)'); hold on;p(1).LineWidth = 2;
p=semilogx(h,error_2(1,:),'^-','DisplayName','2nd order (centered)'); hold on;p(1).LineWidth = 2;
p=semilogx(h,error_4(1,:),'s:','DisplayName','4th order (centered)'); hold on;p(1).LineWidth = 2;
xlabel('\Delta x'); ylabel('Approximation error'); grid on; ylim([-0.2,2]); xlim([10^-5,10]);
set(gca,'FontSize',30)
set(gca,'fontname','times new roman')
legend('show','Location','northwest');
xticks([10^-5 10^-4 10^-3 10^-2 10^-1 10^0 10^1 ])
xticklabels({'10^{-5}','10^{-4}','10^{-3}','10^{-2}','10^{-1}','10^{0}','10^{1}'})