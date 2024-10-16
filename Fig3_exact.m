%% 定义参数
clc
clear
syms t m n gm_a
y=0;

%% 第一层积分
Q=[];

gm_a_dB=10:0.03:40;
gma_a=10.^(gm_a_dB./10);
step=0.01;
m=1;
for i=1:length(gm_a_dB)
    y=0;
    for x=0:step:100
        gm_a=gma_a(i);
        y=((qfunc(sqrt(x))).*m.^m.*x.^(m-1)./((gm_a).^(m).*gamma(m)).*exp(-m.*x./gm_a)).*step+y;
    end
    Q(end+1)=y;
end
semilogy(gm_a_dB,Q,'r')

legend({'exact by numerical integration'},'Location','southwest','FontSize',16,"FontName","Times New Roman")

axis([10 40 10^(-6) 0.04]);
xlabel('SNR(dB)',"FontName","Times New Roman")
ylabel('I',"FontName","Times New Roman")
set(gca,'FontSize',16,"FontName","Times New Roman")
set(gca,'FontSize',13,'Fontangle','italic',"FontName",'Times New Roman');
% semilogy(gm_dB,Q)
%% 第二层积分
% p=[];
% gm_a_dB=0:0.1:10;
% gm_a=10.^(gm_a_dB./10);
% % pdf_gm=@(m) m.^m.*gm_a.^(m-1)./(gm_a).^(m)./gamma(m).*exp(-m.*gm_a./gma);
% step=0.01;
% m=1;
% for i=1:10
%     z=0;
%     for x=0:step:10
%         z=@(gm_a)+z;
%     end
% end
% figure
% semilogy(gm_dB,z(gm_a))








