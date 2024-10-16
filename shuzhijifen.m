% %% 参数
% syms t c
% % x=linspace(20,40,21);
% y=0;
% 
% %% exact g(x)
% b=[];
% t=0:0.1:5;
% ste=0.01;
% for i=1:length(t)
%     y=0;
%     for x=t(i):ste:5
%         y=(x.^2.*ste+y);
%     end
%     b(end+1)=y;
% end
% 
% 
% plot(t,b)
% gx=1./(gamma(10).*2.^5).*s.^(10/2-1).*exp(-s./2);
%% 参数
clc
clear
syms t c
% x=linspace(20,40,21);
y=0;

%% exact g(x)
b=[];
t=0:0.1:5;
ste=0.01;
for i=1:length(t)
    y=0;
    for x=t(i):ste:5
        y=(x.^2.*ste+y);
    end
    b(i)=y;
end
plot(t,b)

