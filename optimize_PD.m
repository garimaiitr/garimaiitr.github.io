function J= optimize_PD(g)
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
xxsimSetParameters('Submodel1.control1.Gain1.K',g(1));
xxsimSetParameters('Submodel1.control1.Gain2.K',g(2));
xxsimSetParameters('Submodel1.control2.Gain3.K',g(3));
xxsimSetParameters('Submodel1.control2.Gain4.K',g(4));
xxsimSetParameters('Submodel1.control3.Gain3.K',g(5));
xxsimSetParameters('Submodel1.control3.Gain4.K',g(6));
xxsimSetParameters('Submodel4.control4.Gain3.K',g(7));
xxsimSetParameters('Submodel4.control4.Gain4.K',g(8));
xxsimSetParameters('Submodel4.control5.Gain3.K',g(9));
xxsimSetParameters('Submodel4.control5.Gain4.K',g(10));
xxsimSetParameters('Submodel4.control6.Gain3.K',g(11));
xxsimSetParameters('Submodel4.control6.Gain1.K',g(12));
xxsimSetParameters('Submodel7.control7.Gain3.K',g(13));
xxsimSetParameters('Submodel7.control7.Gain4.K',g(14));
xxsimSetParameters('Submodel7.control8.Gain3.K',g(15));
xxsimSetParameters('Submodel7.control8.Gain4.K',g(16));
[q, a]=xxsimGetLogValues({'time','Qt'});
[v,b]=xxsimGetLogValues({'time','vt'});
qmin= min(q);
qmin1=qmin(2:end);
qmax= max(q);
qmax1=qmax(2:end);
v1=min(v(2:end));
%q1=q(:,2:end);
lb=-1.6;
ub=1.6;
%sz=size(q1);
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
xxsimRun(); 
J=xxsimGetValue('J')+(100000*abs(c));
xxsimClearPreviousRuns();
end