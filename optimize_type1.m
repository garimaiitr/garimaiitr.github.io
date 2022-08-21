function J= optimize_type1(g)
X=0.98;
Y=1;
R=Y-round(rand)*(Y-X);
xxsimSetParameters('m',R);
X1=10;
Y1=15;
R1=X1+round(rand)*(Y1-X1);
xxsimSetParameters('cn',R1);
Y2=0.02;
R2=round(rand)*Y2;
Y3=0.2;
R3=round(rand)*Y3;
xxsimSetParameters('a2',R3);
xxsimSetParameters('amplitude',R2);

xxsimSetParameters('Submodel1.control1.Se1.a11',g(1));
xxsimSetParameters('Submodel1.control1.Se1.a12',g(2));
xxsimSetParameters('Submodel1.control1.Se1.a21',g(3));
xxsimSetParameters('Submodel1.control1.Se1.a22',g(4));
xxsimSetParameters('Submodel1.control1.Se1.he',g(5));
xxsimSetParameters('Submodel1.control1.Se1.hde',g(6));
xxsimSetParameters('Submodel1.control2.Se1.a11',g(7));
xxsimSetParameters('Submodel1.control2.Se1.a12',g(8));
xxsimSetParameters('Submodel1.control2.Se1.a21',g(9));
xxsimSetParameters('Submodel1.control2.Se1.a22',g(10));
xxsimSetParameters('Submodel1.control2.Se1.he',g(11));
xxsimSetParameters('Submodel1.control2.Se1.hde',g(12));
xxsimSetParameters('Submodel1.control3.Se1.a11',g(13));
xxsimSetParameters('Submodel1.control3.Se1.a12',g(14));
xxsimSetParameters('Submodel1.control3.Se1.a21',g(15));
xxsimSetParameters('Submodel1.control3.Se1.a22',g(16));
xxsimSetParameters('Submodel1.control3.Se1.he',g(17));
xxsimSetParameters('Submodel1.control3.Se1.hde',g(18));
xxsimSetParameters('Submodel4.control4.Se1.a11',g(19));
xxsimSetParameters('Submodel4.control4.Se1.a12',g(20));
xxsimSetParameters('Submodel4.control4.Se1.a21',g(21));
xxsimSetParameters('Submodel4.control4.Se1.a22',g(22));
xxsimSetParameters('Submodel4.control4.Se1.he',g(23));
xxsimSetParameters('Submodel4.control4.Se1.hde',g(24));
xxsimSetParameters('Submodel4.control5.Se1.a11',g(25));
xxsimSetParameters('Submodel4.control5.Se1.a12',g(26));
xxsimSetParameters('Submodel4.control5.Se1.a21',g(27));
xxsimSetParameters('Submodel4.control5.Se1.a22',g(28));
xxsimSetParameters('Submodel4.control5.Se1.he',g(29));
xxsimSetParameters('Submodel4.control5.Se1.hde',g(30));
xxsimSetParameters('Submodel4.control6.Se1.a11',g(31));
xxsimSetParameters('Submodel4.control6.Se1.a12',g(32));
xxsimSetParameters('Submodel4.control6.Se1.a21',g(33));
xxsimSetParameters('Submodel4.control6.Se1.a22',g(34));
xxsimSetParameters('Submodel4.control6.Se1.he',g(35));
xxsimSetParameters('Submodel4.control6.Se1.hde',g(36));
xxsimSetParameters('Submodel7.control7.Se1.a11',g(37));
xxsimSetParameters('Submodel7.control7.Se1.a12',g(38));
xxsimSetParameters('Submodel7.control7.Se1.a21',g(39));
xxsimSetParameters('Submodel7.control7.Se1.a22',g(40));
xxsimSetParameters('Submodel7.control7.Se1.he',g(41));
xxsimSetParameters('Submodel7.control7.Se1.hde',g(42));
xxsimSetParameters('Submodel7.control8.Se1.a11',g(43));
xxsimSetParameters('Submodel7.control8.Se1.a12',g(44));
xxsimSetParameters('Submodel7.control8.Se1.a21',g(45));
xxsimSetParameters('Submodel7.control8.Se1.a22',g(46));
xxsimSetParameters('Submodel7.control8.Se1.he',g(47));
xxsimSetParameters('Submodel7.control8.Se1.hde',g(48));
xxsimSetParameters('S1',g(49));
xxsimSetParameters('S2',g(50));
xxsimSetParameters('S3',g(51))
xxsimSetParameters('S4',g(52));
xxsimSetParameters('S5',g(53));
xxsimSetParameters('S6',g(54));
xxsimSetParameters('S7',g(55));
xxsimSetParameters('S8',g(56));
xxsimRun(); 
[q, a]=xxsimGetLogValues({'time','Qt'});
[v,b]=xxsimGetLogValues({'time','vt'});
qmin= min(q);
qmin1=qmin(2:end);
qmax= max(q);
qmax1=qmax(2:end);
v1=min(v(2:end));
lb=-1.6;
ub=1.6;
c1=qmin1-lb;
c2=-qmax1+ub;
c3=v1;
c=[c1,c2,c3];
CV = 0;
for i=1:19
    if c(i)<0
        CV = CV - c(i);
    end
end
c =-CV;
J=xxsimGetValue('J')+(100000*abs(c));
xxsimClearPreviousRuns();
end