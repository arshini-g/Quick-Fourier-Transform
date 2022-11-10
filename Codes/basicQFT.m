function X = basicQFT(x,N)

u = real(x);
v = imag(x);
X = zeros(1,N);
uN = zeros(1,N);
vN = zeros(1,N);
Se = zeros(N/2+1,N/2);
So = zeros(N/2+1,N/2);

uN(1) = u(1);
for index = 2:N
    uN(index) = u(N-index+2);
end

vN(1) = v(1);
for index = 2:N
    vN(index) = v(N-index+2);
end

ue = (u + uN)/2;
uo = (u - uN)/2;
ve = (v + vN)/2;
vo = (v - vN)/2;

for k = 1:N/2+1
for n = 1:N/2
    Se(k,n) = (ue(n)+1i*ve(n))*cos(2*pi*(n-1)*(k-1)/N);
    So(k,n) = (vo(n)-1i*uo(n))*sin(2*pi*(n-1)*(k-1)/N);
end
end

for k = 1:N/2+1
for n = 1:N/2
   X(k) = X(k) + Se(k,n)+So(k,n);
end
X(k) = X(k)*2;
end
for k = 1:N/2-1
for n = 1:N/2
   X(N/2+1+k) = X(N/2+1+k) + Se(N/2-k+1,n)-So(N/2-k+1,n);
end
X(N/2+1+k) = X(N/2+1+k)*2;
end

end
