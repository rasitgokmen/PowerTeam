% 
% syms R rc rl L D C;
% %  A1=[-(R*rc+R*rl+rc*rl)/(L*(R+rc)), -R/(L*(R+rc));R/(C*(R+rc)), -1/(C*(R+rc))];
% %  B1=[1/L;0]; %state equations are same for on and off states
% %  B=B1*D;
% %  A2=A1;
% %  C1=[R*rc/(R+rc), R/(R+rc)];
% %  C2=C1;
% %  C_m=C1;
% %  B2=[0 0];       
% A=[-(rc+rl)/L, -1/L; 1/C, -1/(C*R)];
%  A1=A;
%  A2=A;
%  C_m=[rc, 1];
%  C1=C;
%  C2=C;
 
Vd=48;
Vo=23.6;
rl=0.002;
L=1e-5;
rc=0.001;
C=100e-5;
R=5;
Fs=150000;

syms s;
t=tf(21*Vd*[rc*C 1],[1 1/(C*R)+(rc+rl)/L 1/(L*C) 0]*(L*C));
 bode(t);
 t1=tf(11*[1 909],[1 110000]);
 oltf1=t*t1;
 bode(oltf1);
 cltf1=oltf1/(1+oltf1);
 rlocus(cltf1)