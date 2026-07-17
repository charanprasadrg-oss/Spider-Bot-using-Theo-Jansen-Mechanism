
clear ; clc; close all;

L1=5.5;L2=1;L3=7.5;L33=7.5;L4=4.2;L44=4.2;L5=4.0;L6=4.2;L66=7.5;L7=4.2;
A1=0;A2=pi/2:0.3:6*pi+(pi/2);
 

A2=-A2; 

%% ******************POSITION ANALYSIS*********************  

% LOCATION OF POINT B
Bx=L2.*cos(A2);
By=L2.*sin(A2);


% FIRST CASE OF 4 BARS
[A3,A4]=Caso_4b(L1,L2,L3,L4,A1,A2,'cruzado');  
A5=(pi-A4)+(pi/2);

% LOCATION OF POINT C
Cx=Bx+(L3.*cos(A3));  
Cy=L4.*sin(A4);

% LOCATION OF POINT D
Dx=L1;    Dy=0;

% SECOND CASE OF 4 BARS
p=2.*L4.*((L1.*cos(A1))-(L2.*cos(A2)));
q=2.*L4.*((L1.*sin(A1))-(L2.*sin(A2)));
r=(L1.^2)+(L2.^2)-(L33.^2)+(L44.^2)-(2.*L1.*L2.*cos(A1-A2));

A44=2.*atan((-q+sqrt((p.^2)+(q.^2)-(r.^2)))./(r-p));

d=2.*L3.*((L2.*cos(A2))-(L1.*cos(A1)));
e=2.*L3.*((L2.*sin(A2))-(L1.*sin(A1)));
f=(L1.^2)+(L2.^2)+(L33.^2)-(L44.^2)-(2.*L1.*L2.*cos(A2-A1));

A33=2.*atan((-e-sqrt((d.^2)+(e.^2)-(f.^2)))./(f-d));



% LOCATION OF POINT E
Ex=Dx+L5.*cos(pi-A5);
Ey=Dy+L5.*sin(pi-A5);



% THIRD CASE OF 4 BARS
A5=-A5;    A4=-A4;
[A6,A7]=Caso_4b(L5,L4,L6,L7,A5,A4,'cruzado');


Hx=Bx+(L33.*cos(A33));
Hy=By+L33.*sin(A33);


Fx=Hx-L6.*cos(A6);
Fy=Hy-L6.*sin(A6);



Px=Hx+L66.*cos(A6+(pi/2));
Py=Hy+L66.*sin(A6+(pi/2));


%% *******************VELOCITY ANALYSIS******************
A4=-A4;  A5=-A5;

W2=2; 

W3=-(L2.*W2.*sin(A2-A4))./(L3.*sin(A3-A4));
W4=(L2.*W2.*sin(A2-A3))./(L4.*sin(A4-A3));
W5=W4;

W33=-(L2.*W2.*sin(A2-A44))./(L33.*sin(A33-A44));
W44=(L2.*W2.*sin(A2-A33))./(L44.*sin(A44-A33));

A4=-A4;  A5=-A5;
W6=(L5.*W5.*sin(A5-A7)-L44.*W44.*sin(A44-A7))./(L6.*sin(A6-A7));
W7=(L44.*W44.*sin(A44)-L5.*W5.*sin(A5)+L6.*W6.*sin(A6))./(L7.*sin(A7));


%% *****************ACCELERATION ANALYSIS******************

A4=-A4;  A5=-A5;

Alf2=0;   
Alf3=((L2.*(W2.^2).*cos(A2-A4))+(L3.*(W3.^2).*cos(A3-A4))-(L4.*(W4.^2))-(L2.*sin(A4-A2)))./(L3.*sin(A4-A3));
Alf4=((L2.*Alf2.*sin(A3-A2))-(L2.*(W2.^2).*cos(A2-A3))-(L3.*(W3.^2))+(L4.*(W4.^2).*cos(A4-A3)))./(L4.*sin(A3-A4));
Alf5=Alf4;

Alf33=((L2.*(W2.^2).*cos(A2-A44))+(L33.*(W33.^2).*cos(A33-A44))-(L44.*(W44.^2))-(L2.*sin(A44-A2)))./(L33.*sin(A44-A33));
Alf44=((L2.*Alf2.*sin(A33-A2))-(L2.*(W2.^2).*cos(A2-A33))-(L33.*(W33.^2))+(L44.*(W44.^2).*cos(A44-A33)))./(L44.*sin(A33-A44));

A4=-A4;  A5=-A5;
Alf7=((L44.*Alf44.*sin(A44-A6))+(L44.*(W44.^2).*cos(A44-A6))+(L6.*(W6.^2))-(L5.*Alf5.*sin(A5-A6))-(L5.*(W5.^2).*cos(A5-A6))-(L7.*(W7.^2).*cos(A7-A6)))./(L7.*sin(A7-A6));
Alf6=((L5.*Alf5.*sin(A5-A7))+(L5.*(W5.^2).*cos(A5-A7))+(L7.*(W7.*2))-(L44.*Alf44.*sin(A44-A7))-(L44.*(W44.^2).*cos(A44-A7))-(L6.*(W6.^2).*cos(A6-A7)))./(L6.*sin(A6-A7));

A4=-A4;  A5=-A5;


%% ****************** SIMULATION****************

for i=1:length(A2)
    
   plot(Bx,By,'--b');   
   hold on
   
       
   plot(0,0,'or'); 
   axis([-7 15 -12 6]); 
   plot(Bx(i),By(i),'or');   
   plot(Cx(i),Cy(i),'or');    
   plot(Dx,Dy,'or'); 
   plot(Ex(i),Ey(i),'or');
   plot(Hx(i),Hy(i),'or');
   plot(Fx(i),Fy(i),'or');
   plot(Px(i),Py(i),'or');
   
 
  
   plot([0 Dx],[0 0],'-.k','LineWidth',0.001); 
   plot([0 Bx(i)],[0 By(i)],'-k','LineWidth',1); 
   plot([Bx(i) Cx(i)],[By(i) Cy(i)],'-k','LineWidth',1);  
   plot([Dx Cx(i)],[Dy Cy(i)],'-k','LineWidth',1);
   plot([Dx Ex(i)],[Dy Ey(i)],'-k','LineWidth',1);
   plot([Cx(i) Ex(i)],[Cy(i) Ey(i)],'-k','LineWidth',1);
   plot([Bx(i) Hx(i)],[By(i) Hy(i)],'-k','LineWidth',1);
   plot([Dx Hx(i)],[Dy Hy(i)],'-k','LineWidth',1);
   plot([Ex(i) Fx(i)],[Ey(i) Fy(i)],'-k','LineWidth',1);
   plot([Hx(i) Fx(i)],[Hy(i) Fy(i)],'-k','LineWidth',1);
   
       
   patch([Dx,Cx(i),Ex(i)],[Dy,Cy(i),Ey(i)],'m')
   patch([Hx(i),Px(i),Fx(i)],[Hy(i),Py(i),Fy(i)],'m')
   
      
  

   title('THEO JANSEN MECHANISM');
   
   
   set(gcf,'color','W')
   set(gca,'xcolor','W')
   set(gca,'ycolor','W')
   set(gca,'color','W')
    
    
   plot(Px(1:i),Py(1:i),'-.b');  
   
   
  
   [Sopx,Sopy]=Soporte(0,0,5);
   plot(Sopx,Sopy,'r')
   [Sopx,Sopy]=Soporte(Dx,Dy,5);
   plot(Sopx,Sopy,'r')  
  
   
    
   text(-1,-0.8,'A'); 
   text(Bx(i)+0.1*L2,By(i)+0.1*L2,'B'); 
   text(Cx(i)+0.1*(L3/2),Cy(i)+0.1*(L3/2),'C'); 
   text(5.8,-0.8,'D'); 
   text(Ex(i)+0.1*L5,Ey(i)+0.1*L5,'E'); 
   text(Hx(i)+0.1*(L3/2),Hy(i)+0.1*(L3/2),'H');
   text(Fx(i)+0.1*(L3/2),Fy(i)+0.1*(L3/2),'F');
   
 
   pause(0.1);   

   hold off;  
end


%% *******GRAPHS FOR POSITION, VELOCITY AND ACCELERATION*******

figure(2);
subplot(2,2,1),plot(A2,A3,'k',A2,W3,'b',A2,Alf3,'r');
grid on;title('bar L3')

legend('Pos','Vel','Ace');
subplot(2,2,2),plot(A2,A4,'k',A2,W4,'b',A2,Alf4,'r');
grid on;title('bar L4')
legend('Pos','Vel','Ace');
subplot(2,2,3),plot(A2,A33,'k',A2,W33,'b',A2,Alf33,'r');
grid on;title('bar L33')
legend('Pos','Vel','Ace');
subplot(2,2,4),plot(A2,A44,'k',A2,W44,'b',A2,Alf44,'r');
grid on;title('bar L44')
legend('Pos','Vel','Ace');

figure(3);
set(gcf,'color','W')
set(gca,'xcolor','W')
set(gca,'ycolor','W')
set(gca,'color','W')

subplot(2,2,1),plot(A2,A6,'k',A2,W6,'b',A2,Alf6,'r');
grid on;title('bar L6')
legend('Pos','Vel','Ace');
subplot(2,2,2),plot(A2,A7,'k',A2,W7,'b',A2,Alf7,'r');
grid on;title('bar L7')
legend('Pos','Vel','Ace');


figure(4);

subplot(2,2,1),plot(Hx,Hy,'k')
grid on;title('Pos H')
xlabel('Hx');ylabel('Hy')
subplot(2,2,2),plot(Px,Py,'b')
grid on;title('Pos P')
xlabel('Px');ylabel('Py')



figure(5)
subplot(2,2,1),plot(Bx,By,'k')
grid on;title('Pos B')
xlabel('Bx');ylabel('By')
subplot(2,2,2),plot(Cx,Cy,'b')
grid on;title('Pos C')
xlabel('Cx');ylabel('Cy')
subplot(2,2,3),plot(Ex,Ey,'r')
grid on;title('Pos E')
xlabel('Ex');ylabel('Ey')
subplot(2,2,4),plot(Fx,Fy,'g')
grid on;title('Pos F')
xlabel('Fx');ylabel('Fy')

figure(6);

subplot(2,2,1),plot(A2,Px,'r')
grid on;title('Angle vs Locus')
xlabel('A2');ylabel('Px')
subplot(2,2,2),plot(A2,Py,'g')
grid on;title('Angle vs Locus')
xlabel('A2');ylabel('Py')

