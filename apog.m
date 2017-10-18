N=16;
y=zeros(length(press),1);
z=zeros(length(press),1);
e1=0;
e2=0;
med=0;
tol=5;
flag=0;
for i =17:length(press)
  med=mean(press(i-N:i));
  e1=sum(press(i-N:i-N/2)-med);
  e2=sum(press(i-N/2:i)-med);
  if(e1>(e2+tol) && abs(e1)>10)
      flag=1;
  end
  if((e1>(e2-tol)) && (e1<(e2+tol)) && flag)
    y(i)=100;
  end
  if((e1<e2) && flag)
    z(i)=100;
  end
end
 subplot(2,1,1);plot(press); grid;legend('pressao(mbar)');
 subplot(2,1,2); stem(y); hold on; grid; stem(z,'r'); legend('apogeu','queda');