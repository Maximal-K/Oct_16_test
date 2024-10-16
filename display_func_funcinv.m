clear
clc

%% 函数定义部分
% 高斯Q函数下界函数的反函数表达式
Finv_LB = @(beta, y) ...
    (2.5066*y.*exp(-lambertw(-1, -(2.0944*y.^2.*(beta.^2 + beta + 1))...
    ./((beta - 1).^2))/2))./(beta - 1);

% 高斯Q函数下界函数的表达式
F = @(beta, x) (beta-1)/(sqrt(2*pi)).*x.*exp(-(beta.^2 + beta + 1)/6.*x.^2);

% beta关于x的函数表达式
F_b = @(x) (x+sqrt(9*x.^2 + 48))./(4*x);

%% 计算部分
x_dB = 0:0.1:10;
x = 10.^(x_dB/20);
beta = F_b(x);

% 高斯Q函数表达式
f_exact = qfunc(x);

% 高斯Q函数下界函数表达式
f_LB = F(beta, x);

% 高斯Q函数反函数表达式
finv_exact = qfuncinv(f_exact);

% 高斯Q函数下界函数反函数表达式
finv_LB = Finv_LB(beta, f_LB);

%% 绘图部分
% % 原函数部分
% figure;
% semilogy(x_dB, f_exact, 'r');hold on;
% semilogy(x_dB, f_LB, 'k')
% 
% % 原函数图窗调整部分
% xlabel('$20log_{10}(x)$', 'interpreter', 'latex');
% ylabel('$y$', 'interpreter', 'latex');
% t = legend('$Exact\ Q(x)$', '$Lower\ Bound\ Q_{LB}(x)$');
% set(t, 'interpreter', 'latex', 'FontSize', 13, 'Location', 'southwest');
% set(gca, 'FontSize', 13)

% 反函数部分
figure;
semilogx(f_exact, 20*log10(finv_exact), 'r');hold on;
semilogx(f_LB, 20*log10(finv_LB), 'k');

% 反函数图窗调整部分
xlabel('$y$', 'interpreter', 'latex');
ylabel('$20log_{10}(x)$', 'interpreter', 'latex');
t = legend('$Exact\ Q^{-1}(x)$', '$Lower\ Bound\ Q_{LB}^{-1}(x)$');
set(t, 'interpreter', 'latex', 'FontSize', 13, 'Location', 'southwest');
set(gca, 'FontSize', 13)
ylim([0 10])
xlim([0.001 0.15])