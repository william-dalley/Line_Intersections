
travel = [1,1,1,1,1,1,1,1];

A = [5,10]; B = [12,10];
C = [-3,1]; E = [5,2];

x12 = A(1); y12 = A(2);
x22 = B(1); y22 = B(2);

for i = 1:1

    x11 = E(1); y11 = E(2);
    x21 = C(1); y21 = C(2);

%     %Line 1
%     x11 = 5;                            % Line 1 - Point 1 (x)
%     y11 = 2;                            % Line 1 - Point 1 (y)
% 
%     x12 = 5;                            % Line 1 - Point 2 (x)
%     y12 = 10;                           % Line 1 - Point 2 (y)

    m1 = (y12 - y11) / (x12 - x11);     % Line 1 Gradient

    if isinf(m1)
        x1 = x11*ones(1,(y12-y11)+1);
        y1 = y11:1:y12;
        c1 = x11;
    elseif m1 == 0
        y1 = y11*ones(1,(x12-x11)+1);
        x1 = x11:1:x12;
        c1 = y11;
    else
        x1 = x11:1:x12;                 % Line 1 x values
        c1 = y11 - m1*x11;              % Line 1 y intersect
        y1 = m1 * x1 + c1;              % Line 1 y values
    end


    % Line 2
%     x21 = -3;                           % Line 2 - Point 1 (x)
%     y21 = 1;                           % Line 2 - Point 1 (y)
% 
%     x22 = 12;                           % Line 2 - Point 2 (x)
%     y22 = 10;                           % Line 2 - Point 2 (y)

    m2 = (y22 - y21) / (x22 - x21);     % Line 2 Gradient

    if isinf(m2)
        x2 = x21*ones(1,(y22-y21)+1);
        y2 = y21:1:y22;
        c2 = x21;
    elseif m2 == 0
        y2 = y21*ones(1,(x22-x21)+1);
        x2 = x21:1:x22;
        c2 = y21;
    else
        x2 = x21:1:x22;                 % Line 1 x values
        c2 = y21 - m2*x21;              % Line 1 y intersect
        y2 = m2 * x2 + c2;              % Line 1 y values
    end

    a1 = (c1*y11 - c1*y12) / (x11*y12 - x12*y11);

    if isnan(a1)
        a1 = 1;
    end

    b1 = (a1*x12 + c1) / y12;

    a2 = (c2*y21 - c2*y22) / (x21*y22 - x22*y21);

    if isnan(a2)
        a2 = 1;
    end

    b2 = (a2*x22 + c2) / y22;

    x_int = (b1*c2 - b2*c1) / (a1*b2 - a2*b1);
    y_int = (a1*c2 - a2*c1) / (a1*b2 - a2*b1);

    scatter(x_int, y_int, 'bo', 'markerfacecolor', 'green')

end