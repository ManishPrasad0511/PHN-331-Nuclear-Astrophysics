function [Defeq]=rate_equations_1(I,D)
    sigmav=[(10^(-26))/2,(10^(-2)),4*(10^(-26)),10^(-27),(10^(-1)),3*(10^(-26))];
    p=10^24;
    
    c12=D(1);
    c13=D(2);
    n13=D(3);
    n14=D(4);
    o15=D(5);
    n15=D(6);
    Defeq= [-sigmav(1)*p*c12+sigmav(6)*p*n15;
             sigmav(2)*n13-sigmav(3)*p*c13;
             sigmav(1)*p*c12-sigmav(2)*n13;
             sigmav(3)*p*c13-sigmav(4)*n14*p; 
             sigmav(4)*n14*p-sigmav(5)*o15;
             sigmav(5)*o15-sigmav(6)*p*n15];
end