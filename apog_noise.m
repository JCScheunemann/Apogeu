close all;
N=64;
pressn=press;%+10.*rand(length(press),1);%.*rand(length(press),1);
y=zeros(length(pressn),1);
z=zeros(length(pressn),1);
cy=0;cz=0;
e1=0;
e2=0;
med=0;
medn=0;
tol=std(pressn(1:N*2));
%tol=50;
flag=0;
cont=0;
for i =N+1:length(press)
  medn=med;
  med=mean(pressn(i-N:i));
  e1=sum(pressn(i-N:i-N/2)-med);
  e2=sum(pressn(i-N/2:i)-med);
  if(e1>(e2+tol) && abs(e1)>std(pressn(i-N:i))*N/5)
      flag=1;
  end
  if((e1>(e2-tol)) && (e1<(e2+tol)) && flag)
    y(i)=100;
    cy=cy+1;
  end
  if((e1<e2) && flag)
    z(i)=100;
    cz=cz+1;
  end

  
end
 subplot(2,1,1);plot(time./1000,pressn); grid;legend('pressao(mbar)');
 subplot(2,1,2); stem(y); hold on; grid; stem(z,'r'); legend('apogeu','queda');
 cy
 cz