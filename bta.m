%% 参数
x=linspace(-6,15,39);
t=10.^(x./20);

%% 实际的q函数
exactQ=qfunc(t);

%% bta原函数 
bt=(t+sqrt(9.*t.^2+48))./(4.*t);
f1=(bt-1)./sqrt(2.*pi).*t.*exp(-(bt.^2+bt+1)./6.*t.^2);
bt1=(t-sqrt(9.*t.^2+48))./(4.*t);
f2=(bt1-1)./sqrt(2.*pi).*t.*exp(-(bt1.^2+bt1+1)./6.*t.^2);
%% x=10db
btt=@(s)(s+sqrt(9.*s.^2+48))./(4.*s);

% f3=(btt(0.9)-1)./sqrt(2.*pi).*t.*exp(-(btt(0.9).^2+bt+1)./6.*t.^2);



%% 
p1=semilogy(x,exactQ,'r');
hold on
p2=semilogy(x,f1,'.-k');
semilogy(x,f2,'k--')
% p3=semilogy(x,f3,'b--');
%  axis([-6 5 0.03 0.3])
%   axis([8 15 10.^(-9) 10.^(-2)])
  legend([p1 p2],{'exactQ','our lower bound'},...
    'Location','southwest','FontSize',16)
xlabel('SNR(dB)')
ylabel('Q(x)')
set(gca,'FontSize',16)
%  axis([-6 15 10.^(-9) 0.3])