%% 参数
x=linspace(-6,10,18);
t=10.^(x./20);
syms s 
%% 实际的q函数
exactQ=qfunc(t);

%% 吴老师的函数
 Qlbkw1=exp((-2./pi).*t.^2)./4;						%自己的一项
% Qlbkw2=exp((-2.*(3.^0.5)./pi).*t.^2)./6+exp((-3.^0.5./pi).*t.^2)./6;		%自己的两项
Qlbkw3=exp(-6.*(3.^0.5-1).*t.^2/pi)/12+exp(-2.*(3-3.^0.5).*t.^2./pi)/12+...
    exp(-3^0.5.*t.^2./pi)./6;

%% 在60度展开；展开式三项；
s3=sqrt(3)/2 + 1/2*(s - pi/3) - 1/4*sqrt(3)*(s - pi/3).^2;

qt1=exp(-t.^2./(2.*s3.^2))./pi;
 q1=int(qt1,s,0,pi./2); 
 %% 90
% s2=1 - 1/2.*(s - pi./2).^2 + 1/24*(s - pi/2).^4;
% qt2=exp(-t.^2./(2.*s2.^2))./pi;
%  q2=int(qt2,s,0,pi-pi./2); 

 %% 45
%  s4=sqrt(2)/2 + 1./2.*sqrt(2).*(s - pi/4)- 1/4.*sqrt(2).*(s - pi./4).^2;
%  qt3=exp(-t.^2./(2.*s4.^2))./pi;
%  q3=int(qt3,s,0,pi./2); 
 %% 30
%  s6=1/2 + 1/2.*sqrt(3).*(s - pi/6) - 1/4.*(s - pi/6).^2;
%   qt4=exp(-t.^2./(2.*s6.^2))./pi;
%    q4=int(qt3,s,0,pi./2); 
   
 %% 不等式

 ss=@(c)-c.^4/8 + ((sqrt(3)/2 + pi/3).*c.^3)/3 + ((3/4 - sqrt(3).*pi./6 - pi.^2/18)*c.^2)/2;
 s11=ss(pi/4)-ss(0);
 s12=ss(pi/2)-ss(pi/4);
 
 q5=exp(-t.^2/(2.*s11))./4+exp(-t.^2/(2.*s12))./4;
 
 %% 不等式
 sss=@(c)pi/8 + (pi/4 + 1/2)*(c- pi/4) + (c - pi/4).^2 - 1/6*pi.*(c - pi/4).^3;
 s21=sss(pi/2)-ss(0);

  q6=exp(-t.^2/(2.*s21))./2;
  
  
%% 画画

semilogy(x,exactQ,'r')
hold on
% semilogy(x,Qlbkw1,'-k')
% semilogy(x,Qlbkw2,'.-k')
 semilogy(x,Qlbkw3,'k-+')
 semilogy(x,Qlbkw1,'k-+')
% semilogy(x,q1,'k-')
% semilogy(x,q2,'b--')
% semilogy(x,q3,'g')
semilogy(x,q5,'b--')
semilogy(x,q6,'k')
% semilogy(x,Qt2,'b:')
 axis([-6 5 0.03 0.3])
