%% 参数 
syms y m a s
x=linspace(10,40,20);
t=10.^(x./10);
%% exact by numerical integration   p1实际的Q函数
F1=1./sqrt(2.*pi).*exp(-a.^2./2);
f=int(F1,sqrt(m),10000);
f1=@(m)f./(t.*gamma(1)).*exp(-m./t);
f2=@(m)f.*2.5.^2.5.*m.^1.5./(t.^2.5.*gamma(2.5)).*exp(-2.5.*m./t);     
j1=int(f1(m),0,10);
j2=int(f2(m),0,10);
%% A12 VST and G09 SAB  p4   p4上界
q_a12ub=@(m)(exp(-y)./50+(exp(-y./2)./(2.*(sqrt(y)+1))))...
    .*(m.^m.*y.^(m-1))./(t.^m.*gamma(m)).*exp(-m.*y./t);
 q_a123=int(q_a12ub(1),y,0,10);
 q_a124=int(q_a12ub(2.5),y,0,10);
 
 %% A19 CST p5 and p6  p6上界
 
 q_a19u=@(m)(exp(-y./2)./(sqrt(2.*pi.*y)).*(1-1./y))...
    .*(m.^m.*y.^(m-1))./(t.^m.*gamma(m)).*exp(-m.*y./t);
q_a193=int(q_a19u(1),y,0,10);
q_a194=int(q_a19u(2.5),y,0,10);

%% H11 CS  p14     p14上界
q_h11=@(m)((1./2).*exp(-y./2))...
    .*(m.^m.*y.^(m-1))./(t.^m.*gamma(m)).*exp(-m.*y./t);
q_h117=int(q_h11(1),y,0,10);
q_h118=int(q_h11(2.5),y,0,10);
%% 画画
grid on
p1=semilogy(x,j1,'r'); 
hold on
   semilogy(x,j2,'r');
p4=semilogy(x,q_a123,'b--');
  semilogy(x,q_a124,'b--');   
p6=semilogy(x,q_a193,'k');
  semilogy(x,q_a194,'k');
p13=semilogy(x,q_h117,'b');
   semilogy(x,q_h118,'b');
xlabel('SNR(dB)')
ylabel('l')
legend([p1 p4 p6 p13],{'exact by numerical integration','G09 TOC',...
    'A19 CST','H11 CS'},...
    'Location','southwest','FontSize',12)

 axis([10 40 10^(-6) 0.04]);   
    