clear
clc

%% Plot
figure(1)
cla
hold on

%% Line 1 
x11 = 4;                            % Line 1 - Point 1 (x)
y11 = 12;                            % Line 1 - Point 1 (y)

x12 = 8;                            % Line 1 - Point 2 (x)
y12 = 1;                           % Line 1 - Point 2 (y)

m1 = (y12 - y11) / (x12 - x11);     % Line 1 Gradient
c1 = y11 - m1*x11;                  % Line 1 y intersect
    
x1 = x11:1:x12;                     % Line 1 x values
y1 = m1 * x1 + c1;                  % Line 1 y values

scatter(x11, y11, 'ko', 'markerfacecolor', 'black')
scatter(x12, y12, 'ko', 'markerfacecolor', 'black')
plot(x1, y1, 'k--', 'linewidth', 1)

%% Line 2
x21 = -3;                           % Line 2 - Point 1 (x)
y21 = 1;                           % Line 2 - Point 1 (y)
    
x22 = 12;                           % Line 2 - Point 2 (x)
y22 = 10;                           % Line 2 - Point 2 (y)

m2 = (y22 - y21) / (x22 - x21);     % Line 2 Gradient
c2 = y21 - m2*x21;                  % Line 2 y intersect

x2 = x21:1:x22;                     % Line 2 x values 
y2 = m2 * x2 + c2;                  % Line 2 y values

scatter(x21, y21, 'ko', 'markerfacecolor', 'red')
scatter(x22, y22, 'ko', 'markerfacecolor', 'red')
plot(x2, y2, 'r--', 'linewidth', 1)

%% Calculate the intersect 
a1 = (c1*y11 - c1*y12) / (x11*y12 - x12*y11);
b1 = (a1*x12 + c1) / y12;

a2 = (c2*y21 - c2*y22) / (x21*y22 - x22*y21);
b2 = (a2*x22 + c2) / y22;

x_int = (b1*c2 - b2*c1) / (a1*b2 - a2*b1);
y_int = (a1*c2 - a2*c1) / (a1*b2 - a2*b1);

scatter(x_int, y_int, 'bo', 'markerfacecolor', 'green')

