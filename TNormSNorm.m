close all
clear all
x=-15:0.1:15;

A = 1./(1+((x+5)/7.5).^4);
B = 1./(1+((x-5)/5).^2);

%T-norm
Tmm = min(A,B);
Tap = A.*B;
Tbd = max(0, A+B-1);
Tdp = zeros(size(x));


for i=1:length(x)
    if B(i) == 1
        Tdp(i) = A(i);
    elseif A(i) == 1
       Tdp(i) = B(i);
    else
        Tdp(i) = 0;
    end
end

figure()

subplot(221)
plot(Tmm,'*g')
hold on
plot(A,'r')
hold on 
plot(B,'b')
title("Minimum Product")
legend('Tmin','A','B')

subplot(222)
plot(Tap,'*g')
hold on
plot(A,'r')
hold on 
plot(B,'b')
title("Algebraic Product")
legend('Tap','A','B')

subplot(223)
plot(Tbd,'*g')
hold on
plot(A,'r')
hold on 
plot(B,'b')
title("Bound Product")
legend('Tbp','A','B')

subplot(224)
plot(Tdp,'-g')
hold on
plot(A,'r')
hold on 
plot(B,'b')
hold on
title("Drastic Product")
legend('Tdp','A','B')

sgtitle('T-Norm Operations');

%s-norm 
Smax = max(A,B);
Sas =  A + B - A .* B;
Sbs = min(A + B, 1);

Sds = zeros(size(A));
for i = 1:length(x)
    if (A(i) > 0) && (B(i) > 0)  
        Sds(i) = 1;
    elseif (A(i) == 0)
        Sds(i) = B(i);
    elseif (B(i) == 0) 
        Sds(i) = A(i);
    end
end
figure()
subplot(221)
plot(A,'r')
hold on
plot(B,'b')
hold on
plot(Smax,'*g');
hold on 
title("Maximum")
legend('r','b','Smax')


subplot(222)
plot(A,'r')
hold on
plot(B,'b')
hold on
plot(Sas,'*g');
hold on 
title("Algebraic Sum")
legend('r','b','Sas')

subplot(223)
plot(A,'r')
hold on
plot(B,'b')
hold on
plot(Sbs,'*g');
hold on 
title("Bound sum")
legend('r','b','Sbs')

subplot(224)
plot(A,'r')
hold on
plot(B,'b')
hold on
plot(Sds,'g');
hold on 
title("Drastic Sum")
legend('r','b','Sds')

sgtitle("S-Norm Operations")