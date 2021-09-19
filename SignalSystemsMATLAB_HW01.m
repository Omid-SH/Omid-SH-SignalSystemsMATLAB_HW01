
%% Problem 1

%% Part 1_1
clear; clc

syms eq1 z t

% Window 1 //******************************

% defining function as symbolic, we could even define them as handle
y1(t) = sin(t);
y2(t) = cos(t)*heaviside(t);
y3(t) = sin(t) + 2*cos(2*t);

% ploting
subplot(4,18,[1:8 19:26]);
plot(-3.2:0.01:3.1, y1(-3.2:0.01:3.1), 'color', 'b','linewidth' ,2);
hold on;
plot(-3.2:0.02:3, y2(-3.2:0.02:3), 'linestyle', '--', 'color', 'r','linewidth' ,1.2);
plot(-3.2:0.05:3, y3(-3.2:0.05:3), 'o', 'color', 'g', 'linewidth' ,1.2); 

% seting features of plot window
grid on;
grid minor;
xlim([-3.2,4.0]);
ylim([-3.4,2.4]);
title('$y_i(t)$ $for$ $i$ $\epsilon$  \{$1,2,3$\} $on$ $the$ $same$ $figure$','interpreter','latex');
ylabel('y(V)','interpreter','latex');
xlabel('t(s)','interpreter','latex','fontsize',8);
legend('y1(t)', 'y2(t)', 'y3(t)');

% Window 2 //******************************

% function defining (actually my function is little different from main
% function in question but it satisfies question goal that is plot figure)
h(t) = ((0.5).^t)*heaviside(t+0.5);

% ploting
subplot(4,18,[11:18]);
stem(-10:20, h(-10:20), 'color', [0.4 0 0.8] , 'markersize' , 5 , 'linewidth' ,2);

% seting features of plot window
grid on;
grid minor;
xlim([-10,20.0]);
ylim([0,1]);  
title('$h[n]$ $=$ $(\frac{1}{2})^nu[n]$','interpreter','latex');
xlabel('n','fontsize',8);
ylabel('h[n]','interpreter','latex');

% Window 3 //******************************

% ploting
subplot(4,18,[37:44]);

% seting features of plot window
plot((0:0.1:10),sin(0:0.1:10));
text(pi,0,'\leftarrow sin(\pi) = 0  ')

% Window 4 //******************************

% ploting
subplot(4,18,[30:34 48:52]);
viscircles([4, 3], 2, 'color', [0 0 1], 'linewidth' ,0.5);
hold on;
viscircles([3, 3], 1, 'color', 'r' , 'linewidth' ,0.5);
viscircles([5, 3], 1, 'color', 'g' , 'linewidth' ,0.5);
viscircles([4, 4], 1, 'color', 'r' , 'linewidth' ,0.5);
viscircles([4, 2], 1, 'color', [0 0 0.6] , 'linewidth' ,0.5);

% seting features of plot window
grid on;
xlim([1.6, 6.4]);
ylim([1.001 4.999]);  

% Window 5 //******************************

% functino defining
eq1 = z.^2 -1.8*cos(pi/16).*z + 0.81;
p = double(solve(eq1 == 0,z));
a_1(t) = (p(1)^t)*heaviside(t+0.01);
a_2(t) = (p(2)^t)*heaviside(t+0.01);

% ploting
subplot(4,18,[55:72]);
plot(real(a_1(-50:1:50)),imag(a_1(-50:1:50)), '*', 'Color','r');
hold on;
plot(real(a_2(-50:1:50)),imag(a_2(-50:1:50)), '*', 'Color','b');

% seting features of plot window
xlim([-0.4,1.0]);
ylim([-0.5,0.5]);  
title('$a_{1}[n]$  $and$  $a_{2}[n]$','interpreter','latex');
ylabel('Im(a[n])','interpreter','latex');
xlabel('Re(a[n])','interpreter','latex');

%% Part 1_2
clear;clc

n = 50;
k = 4;
N = 500;
election_party(n,k,N);

%% Problem 2

%% Part 2_1

%% 2_1_1
clear; clc

% defining X1(z) & X2(z)
X_1 = tf([1 0],[1 -0.8],1,'variable','z^-1');
X_2 = tf([1 0],[1 -0.2],1,'variable','z^-1');

% ploting
subplot(2,2,1)
impulse(X_1)
title('H_1(z)');
xlim([0 50]);
xlabel('n');

subplot(2,2,2)
impulse(X_2)
title('H_2(z)');
xlim([0 50]);
xlabel('n');

subplot(2,2,3)
pzmap(X_1);
title('Pole-Zero Map X_1(z)');

subplot(2,2,4)
pzmap(X_2);
title('Pole-Zero Map X_2(z)');

% displaying properties of signals in command window
disp('Properties Of X1');
damp(X_1)
disp(' ');
disp('Properties Of X2');
damp(X_2)

%% 2_1_2
clear; clc

% defining X3(z) & X4(z)
X_3 = tf([1 0],[1 -1.2],1,'variable','z^-1');
X_4 = tf([1 0],[1 -4.8],1,'variable','z^-1');

% ploting
subplot(2,2,1)
impulse(X_3)
title('H_3(z)');
xlim([0 50]);
xlabel('n');

subplot(2,2,2)
impulse(X_4)
title('H_4(z)');
xlim([0 50]);
xlabel('n');

subplot(2,2,3)
pzmap(X_3);
title('Pole-Zero Map X_3(z)');

subplot(2,2,4)
pzmap(X_4);
title('Pole-Zero Map X_4(z)');

% displaying properties of signals in command window
disp('Properties Of X3');
damp(X_3)
disp(' ');
disp('Properties Of X4');
damp(X_4)

%% 2_1_3
clear; clc

% defining X5(z) & X6(z)
X_5 = tf([1 0],[1 -1],1,'variable','z^-1');
X_6 = tf([1 0 0],[1 -2 1],1,'variable','z^-1');

% ploting
subplot(2,2,1)
impulse(X_5)
title('H_5(z)');
xlim([0 50]);
xlabel('n');

subplot(2,2,2)
impulse(X_6)
title('H_6(z)');
xlim([0 50]);
xlabel('n');

subplot(2,2,3)
pzmap(X_5);
title('Pole-Zero Map X_5(z)');

subplot(2,2,4)
pzmap(X_6);
title('Pole-Zero Map X_6(z)');

% displaying properties of signals in command window
disp('Properties Of X5');
damp(X_5)
disp(' ');
disp('Properties Of X6');
damp(X_6)

%% 2_1_4
clear; clc

% defining X7(z) & X8(z)
X_7 = tf([0 0.5 0],[1 -1 0.5],1,'variable','z^-1');
X_8 = tf([0 1 0],[1 -2 2],1,'variable','z^-1');

% ploting
subplot(2,2,1)
impulse(X_7)
title('H_7(z)');
xlim([0 50]);
xlabel('n');

subplot(2,2,2)
impulse(X_8)
title('H_8(z)');
xlim([0 50]);
xlabel('n');

subplot(2,2,3)
pzmap(X_7);
title('Pole-Zero Map X_7(z)');

subplot(2,2,4)
pzmap(X_8);
title('Pole-Zero Map X_8(z)');

% displaying properties of signals in command window
disp('Properties Of X7');
damp(X_7)
disp(' ');
disp('Properties Of X8');
damp(X_8)

%% Part 2_2

%% 2_2_1
clear;clc

% defining symbolic function
syms n
h = cos(n*pi/4); 
X = ztrans(h);
pretty(X)

% collecting coefficients to make function as transfer function
X2 = collect(X);
[num,den] = numden(X2);
H = tf(sym2poly(num),sym2poly(den),1,'variable','z^-1');

% ploting
subplot(2,1,1)
impulse(H)
title('H(z)');
xlim([0 50]);
xlabel('n');

subplot(2,1,2)
pzmap(H);
title('Pole-Zero Map H(z)');

% displaying properties of signals in command window
disp('Properties Of H (2.2.1)');
damp(H)

%% 2_2_2
clear;clc

% defining symbolic function
syms n
h = n.*cos(n*pi/4); 
X = ztrans(h);
pretty(X)

% collecting coefficients to make function as transfer function
X2 = collect(X);
[num,den] = numden(X2);
H = tf(sym2poly(num),sym2poly(den),1,'variable','z^-1');

% ploting
subplot(2,1,1)
impulse(H)
title('H(z)');
xlim([0 50]);
xlabel('n');

subplot(2,1,2)
pzmap(H);
title('Pole-Zero Map H(z)');

% displaying properties of signals in command window
disp('Properties Of H (2.2.2)');
damp(H)

%% 2_2_3
clear;clc

% defining symbolic function
syms n z
h = cos(n*pi/4); 
X = ztrans(h,z^2);

% collecting coefficients to make function as transfer function
X2 = collect(X);
[num,den] = numden(X2);
H = tf(sym2poly(num),sym2poly(den),1,'variable','z^-1');

% ploting
subplot(2,1,1)
impulse(H)
title('H(z)');
xlim([0 50]);
xlabel('n');

subplot(2,1,2)
pzmap(H);
title('Pole-Zero Map H(z)');

h(n) = iztrans(X);
figure(2)
stem(h(0:50));
xlim([0 50]);
title('x_2[n]');
xlabel('n');

%% Part 2_3

%% 2_3_1
clear; clc

% defining transfer function
H = tf([1 0.4*sqrt(2) 0],[1 -0.8*sqrt(2) 0.64],1,'variable','z^-1');
figure(1);

% ploting
subplot(2,1,1)
impulse(H)
title('H(z)');
xlim([0 50]);
xlabel('n');

subplot(2,1,2)
pzmap(H);
title('Pole-Zero Map H(z)');

% displaying properties of signals in command window
disp('Properties Of H');
damp(H)

% ROC calculation
syms z
H = (1+0.4*sqrt(2).*power(z,-1)) ./ (1-0.8*sqrt(2).*power(z,-1)+0.64.*power(z,-2));
p = poles(H);
max_p = double(abs(max(p)));
disp(' ');
disp(['ROC : |Z|> ' , num2str(max_p)])

%% 2_3_2
clear; clc

% H = tf([1 0.4*sqrt(2) 0],[1 -0.8*sqrt(2) 0.64],1,'variable','z^-1');
[r,p,k] = residuez([1 0.4*sqrt(2) 0],[1 -0.8*sqrt(2) 0.64])

%% 2_3_3
clear; clc

[r,p,k] = residuez([1 0.4*sqrt(2) 0],[1 -0.8*sqrt(2) 0.64]);

% First calculating iztrans using symbolic function
syms n z
H = (1+0.4*sqrt(2).*power(z,-1)) ./ (1-0.8*sqrt(2).*power(z,-1)+0.64.*power(z,-2));
disp('H(z):')
pretty(H)
disp(' ')
disp('h[n]:')
h(n) = iztrans(H);
pretty(h(n))

% Second calculating iztrans using r&p 
syms n z
H = r(1) ./ (1-p(1).*power(z,-1)) +  r(2) ./ (1-p(2).*power(z,-1));
disp('H(z):')
pretty(H)
disp(' ')
disp('h[n]:')
h(n) = iztrans(H);
pretty(h(n))

% defining my theory calculated function ( symbolic )
my_h(n) = (0.5-i).*(0.4.*sqrt(2).*(1+1i)).^n + (0.5+i).*(0.4.*sqrt(2).*(1-1i)).^n;

% ploting
subplot(3,1,1)
stem(h(0:50));
xlim([0 50]);
title('x[n] calculated by iztrans');
xlabel('n');

subplot(3,1,2)
stem(my_h(0:50));
xlim([0 50]);
title('x[n] calculated theoretically');
xlabel('n');

subplot(3,1,3)
stem(h(0:50));
hold on;
stem(my_h(0:50));
xlim([0 50]);
legend('iztrans','theoretically');
title('both x[n]s are same!');
xlabel('n');

%% 2_3_4

% No code because iztrans just works for causal functions

%% Part 2_4

%% 2_4_1
clear; clc

[r,p,k] = residuez([1 1/2 0],[1 -1.8*cos(pi/16) 0.81])

% First calculating iztrans using symbolic function
syms n z
H = (1+0.5.*power(z,-1)) ./ (1--1.8*cos(pi/16).*power(z,-1)+0.81.*power(z,-2));
disp('H(z):')
pretty(H)
disp(' ')
disp('h[n]:')
h(n) = iztrans(H);
pretty(h(n))

% Second calculating iztrans using r&p 
syms n z
H = r(1) ./ (1-p(1).*power(z,-1)) +  r(2) ./ (1-p(2).*power(z,-1));
disp('H(z):')
pretty(H)
disp(' ')
disp('h[n]:')
h(n) = iztrans(H);
pretty(h(n))

% defining my theory calculated function ( symbolic )
my_h(n) = (0.5-3.9375i).*(0.8827+0.1756i).^n + (0.5+3.9375i).*(0.8827-0.1756i).^n;

% ploting
subplot(3,1,1)
stem(h(0:50));
xlim([0 50]);
title('x[n] calculated by iztrans');
xlabel('n');

subplot(3,1,2)
stem(my_h(0:50));
xlim([0 50]);
title('x[n] calculated theoretically');
xlabel('n');

subplot(3,1,3)
stem(h(0:50));
hold on;
stem(my_h(0:50));
xlim([0 50]);
legend('iztrans','theoretically');
title('both x[n]s are same!');
xlabel('n');


%% 2_4_2
clear; clc

% definig symbolic transfer function
syms n z
H(z) = (1+0.5*sqrt(2).*power(z,-1)) ./ (1-1.8.*cos(pi/16).*power(z,-1)+0.81.*power(z,-2));

% calculating poles of H(z) [ p1 & p2 ]
p = double(poles(H));

% alpha*1 + betha*1 = H(inf) , alpha/(1-p1) + betha/(1-p2) = H(1)
% => A = [1 1; 1/(1-p1) 1/(1-p2)] B = [ H(inf) H(1) ]
A = [ 1 1 ; 1/(1-p(1)) 1/(1-p(2)) ];
B = [ double(H(inf)) ; double(H(1)) ];
coef = A^-1*B;

% calculating x[n] with 2 ways
h(n) = iztrans(H);
my_h(n) = coef(1).*p(1).^n + coef(2).*p(2).^n;

% ploting
subplot(3,1,1)
stem(h(0:50));
xlim([0 50]);
title('x[n] calculated by iztrans');
xlabel('n');

subplot(3,1,2)
stem(my_h(0:50));
xlim([0 50]);
title('x[n] = ( \alphap_1^n + \betap_2^n ) u[n]');
xlabel('n');

subplot(3,1,3)
stem(h(0:50));
hold on;
stem(my_h(0:50));
xlim([0 50]);
legend('iztrans','theoretically');
title('both x[n]s are same!');
xlabel('n');


% 2_4_3
% definig symbolic transfer function
syms n z
H(z) = (1+0.5*sqrt(2).*power(z,-1)) ./ (1-1.8.*cos(pi/16).*power(z,-1)+0.81.*power(z,-2));

% calculating x[n] with 2 ways
h(n) = iztrans(H);

x = [1 , zeros(1,49)];
b = [1 0.5*sqrt(2) 0];
a = [1 -1.8.*cos(pi/16) 0.81];
my_h = filter(b,a,x);

% ploting
subplot(3,1,1)
stem(h(0:50));
xlim([0 50]);
title('x[n] calculated by iztrans');
xlabel('n');

subplot(3,1,2)
stem(my_h);
xlim([0 50]);
title('x[n] calculated by filter');
xlabel('n');

subplot(3,1,3)
stem(h(0:50));
hold on;
stem(my_h);
xlim([0 50]);
legend('iztrans','with filter');
title('both x[n]s are same!');
xlabel('n');
