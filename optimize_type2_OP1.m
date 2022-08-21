function J= optimize_type2_OP1(g)

xxsimSetParameters('Submodel1.control1.Se1.a1',g(1));
xxsimSetParameters('Submodel1.control1.Se1.a2',g(2));
xxsimSetParameters('Submodel1.control1.Se1.b1',g(3));
xxsimSetParameters('Submodel1.control1.Se1.b2',g(4));
xxsimSetParameters('Submodel1.control1.Se1.L1',g(5));
xxsimSetParameters('Submodel1.control1.Se1.L2',g(6));
xxsimSetParameters('Submodel1.control2.Se1.a1',g(7));
xxsimSetParameters('Submodel1.control2.Se1.a2',g(8));
xxsimSetParameters('Submodel1.control2.Se1.b1',g(9));
xxsimSetParameters('Submodel1.control2.Se1.b2',g(10));
xxsimSetParameters('Submodel1.control2.Se1.L1',g(11));
xxsimSetParameters('Submodel1.control2.Se1.L2',g(12));
xxsimSetParameters('Submodel1.control3.Se1.a1',g(13));
xxsimSetParameters('Submodel1.control3.Se1.a2',g(14));
xxsimSetParameters('Submodel1.control3.Se1.b1',g(15));
xxsimSetParameters('Submodel1.control3.Se1.b2',g(16));
xxsimSetParameters('Submodel1.control3.Se1.L1',g(17));
xxsimSetParameters('Submodel1.control3.Se1.L2',g(18));
xxsimSetParameters('Submodel4.control4.Se1.a1',g(19));
xxsimSetParameters('Submodel4.control4.Se1.a2',g(20));
xxsimSetParameters('Submodel4.control4.Se1.b1',g(21));
xxsimSetParameters('Submodel4.control4.Se1.b2',g(22));
xxsimSetParameters('Submodel4.control4.Se1.L1',g(23));
xxsimSetParameters('Submodel4.control4.Se1.L2',g(24));
xxsimSetParameters('Submodel4.control5.Se1.a1',g(25));
xxsimSetParameters('Submodel4.control5.Se1.a2',g(26));
xxsimSetParameters('Submodel4.control5.Se1.b1',g(27));
xxsimSetParameters('Submodel4.control5.Se1.b2',g(28));
xxsimSetParameters('Submodel4.control5.Se1.L1',g(29));
xxsimSetParameters('Submodel4.control5.Se1.L2',g(30));
xxsimSetParameters('Submodel4.control6.Se1.a1',g(31));
xxsimSetParameters('Submodel4.control6.Se1.a2',g(32));
xxsimSetParameters('Submodel4.control6.Se1.b1',g(33));
xxsimSetParameters('Submodel4.control6.Se1.b2',g(34));
xxsimSetParameters('Submodel4.control6.Se1.L1',g(35));
xxsimSetParameters('Submodel4.control6.Se1.L2',g(36));
xxsimSetParameters('Submodel7.control7.Se1.a1',g(37));
xxsimSetParameters('Submodel7.control7.Se1.a2',g(38));
xxsimSetParameters('Submodel7.control7.Se1.b1',g(39));
xxsimSetParameters('Submodel7.control7.Se1.b2',g(40));
xxsimSetParameters('Submodel7.control7.Se1.L1',g(41));
xxsimSetParameters('Submodel7.control7.Se1.L2',g(42));
xxsimSetParameters('Submodel7.control8.Se1.a1',g(43));
xxsimSetParameters('Submodel7.control8.Se1.a2',g(44));
xxsimSetParameters('Submodel7.control8.Se1.b1',g(45));
xxsimSetParameters('Submodel7.control8.Se1.b2',g(46));
xxsimSetParameters('Submodel7.control8.Se1.L1',g(47));
xxsimSetParameters('Submodel7.control8.Se1.L2',g(48));
xxsimSetParameters('S1',g(49));
xxsimSetParameters('S2',g(50));
xxsimSetParameters('S3',g(51));
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

 
J=xxsimGetValue('J')+(100000*abs(c));%+(100000*(d1));
xxsimClearPreviousRuns();
end