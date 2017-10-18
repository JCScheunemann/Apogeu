w=3;
h=tf([1],[1 w]);
H=h^3;
hd=c2d(H,1/20);
[num den] = tfdata(hd);
P=filter(cell2mat(num),cell2mat(den),pressn);
plot(P(100:length(P)));