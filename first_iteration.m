clc;
clear;
number=zeros(1,8);
xf=zeros(1,8);
xc=[];
for i=1:8
    number(i)=qfunc(i);
x=i;
c=(sqrt(x.^4+6*x.^2+1)+x.^2+1)/4;
y=number(i);
xc=sqrt(-(4*c)./(2*c+1)*log(sqrt(pi/(exp(1)*c))*(2*c+1)*y));
xf(i)=xc;
if (i==1)
    x=sqrt(-pi./2.*log(4.*y));
else 
    c=(sqrt((x-1).^4+6*(x-1).^2+1)+(x-1).^2+1)/4;
    x=sqrt(-(4*(c))/(2*(c)+1)*log(sqrt(pi/(exp(1)*(c-1)))*(2*(c)+1)*y));
end
while (xc-x)>10^(-3)
xf(i)=xc;
end 

end
xf
