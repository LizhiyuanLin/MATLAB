f = @(x)sin(x)
i = 0:20
x2 = pi*cos((2*i+1)/(2*20+2)*pi)
p2 = polyfit(x2,f(x2),20)
%i2 = 0:40;
%xx2 = pi*cos((2*i2+1)/(2*40+2)*pi)
xx2 = linspace(-pi,pi,41)
y2 = f(xx2)
plot(xx2,y2,xx2,polyval(p2,xx2),'o')
legend("f(x)","p(x)","Location","northwest")
xlabel("x")
hold off
error = abs(y2-polyval(p2,xx2))
plot(xx2,error)
legend("the error|f(x)-p(x)|","Location","northwest")
xlabel("x")
ylabel("error") 