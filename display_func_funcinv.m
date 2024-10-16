clear
clc

%% �������岿��
% ��˹Q�����½纯���ķ��������ʽ
Finv_LB = @(beta, y) ...
    (2.5066*y.*exp(-lambertw(-1, -(2.0944*y.^2.*(beta.^2 + beta + 1))...
    ./((beta - 1).^2))/2))./(beta - 1);

% ��˹Q�����½纯���ı��ʽ
F = @(beta, x) (beta-1)/(sqrt(2*pi)).*x.*exp(-(beta.^2 + beta + 1)/6.*x.^2);

% beta����x�ĺ������ʽ
F_b = @(x) (x+sqrt(9*x.^2 + 48))./(4*x);

%% ���㲿��
x_dB = 0:0.1:10;
x = 10.^(x_dB/20);
beta = F_b(x);

% ��˹Q�������ʽ
f_exact = qfunc(x);

% ��˹Q�����½纯�����ʽ
f_LB = F(beta, x);

% ��˹Q�������������ʽ
finv_exact = qfuncinv(f_exact);

% ��˹Q�����½纯�����������ʽ
finv_LB = Finv_LB(beta, f_LB);

%% ��ͼ����
% % ԭ��������
% figure;
% semilogy(x_dB, f_exact, 'r');hold on;
% semilogy(x_dB, f_LB, 'k')
% 
% % ԭ����ͼ����������
% xlabel('$20log_{10}(x)$', 'interpreter', 'latex');
% ylabel('$y$', 'interpreter', 'latex');
% t = legend('$Exact\ Q(x)$', '$Lower\ Bound\ Q_{LB}(x)$');
% set(t, 'interpreter', 'latex', 'FontSize', 13, 'Location', 'southwest');
% set(gca, 'FontSize', 13)

% ����������
figure;
semilogx(f_exact, 20*log10(finv_exact), 'r');hold on;
semilogx(f_LB, 20*log10(finv_LB), 'k');

% ������ͼ����������
xlabel('$y$', 'interpreter', 'latex');
ylabel('$20log_{10}(x)$', 'interpreter', 'latex');
t = legend('$Exact\ Q^{-1}(x)$', '$Lower\ Bound\ Q_{LB}^{-1}(x)$');
set(t, 'interpreter', 'latex', 'FontSize', 13, 'Location', 'southwest');
set(gca, 'FontSize', 13)
ylim([0 10])
xlim([0.001 0.15])