function [Defeq]=rate_equations_2(I,D)
    a0=[1/5,2,1/10]*10^-26;
    T0=[5,5,8];
    Q=[1.44,5.50,12.86]*1.6*10^-13*(4/3)*pi;
    
    p=D(1);
    d=D(2);
    He3=D(3);
    He4=D(4);
    T=D(5);
    Defeq= [a0(3)*sqrt(T-T0(3))*He3*He3 - a0(1)*sqrt(T-T0(1))*p*p - a0(2)*sqrt(T-T0(2))*d*p;
            a0(1)*sqrt(T-T0(1))*p*p/2 - a0(2)*sqrt(T-T0(2))*d*p;
            a0(2)*sqrt(T-T0(2))*d*p - a0(3)*sqrt(T-T0(3))*He3*He3;
            a0(3)*sqrt(T-T0(3))*He3*He3/2;
            (Q(1)*a0(1)*sqrt(T-T0(1))*p*p/2 +Q(2)*a0(2)*sqrt(T-T0(2))*d*p + Q(3)*a0(3)*sqrt(T-T0(3))*He3*He3*0.5 - ...
            5.67067*(10^16)*4*pi*((T/2000)^4) - (-0.5*a0(1)*sqrt(T-T0(1))*p*p - ...
            a0(2)*sqrt(T-T0(2))*d*p+a0(3)*sqrt(T-T0(3))*He3*He3/2)*3*T*(4/3)*pi*1.38*10^-17)/((3*(p+d+He3+He4)*((4/3)*pi)*1.38*10^-17))];   
end