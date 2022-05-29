t=[1 1500];
sigmav=[(10^(-26))/2,(10^(-2)),4*(10^(-26)),10^(-27),(10^(-1)),3*(10^(-26))];
p=10^24;
%Initial conditions
IC1=10^23;
IC2=0;
IC3=0;
IC4=0;
IC5=0;
IC6=0;
IC=[IC1 IC2 IC3 IC4 IC5 IC6];
[IVsol,DVsol]=ode23('rate_equations_1',t,IC);

%% Density Evolution
plot(IVsol,DVsol(:,1))
hold on
plot(IVsol,DVsol(:,2))
hold on
plot(IVsol,DVsol(:,3))
hold on
plot(IVsol,DVsol(:,4))
hold on
plot(IVsol,DVsol(:,5))
hold on
plot(IVsol,DVsol(:,6))
hold on
plot(IVsol,sum(DVsol,2))
title('Density Evolution in time')
legend('12C','13C','13N','14N','15O','15N','Total')
xlabel('Time (s)')
ylabel('Density (nuclei/m^3)')

%% Reaction Rates
r1=sigmav(1)*p*DVsol(:,1);
r2=sigmav(2)*DVsol(:,3);
r3=sigmav(3)*p*DVsol(:,2);
r4=sigmav(4)*p*DVsol(:,4);
r5=sigmav(5)*DVsol(:,5);
r6=sigmav(6)*p*DVsol(:,6);
figure(2)
plot(IVsol,r1)
hold on
plot(IVsol,r2)
hold on
plot(IVsol,r3)
hold on
plot(IVsol,r4)
hold on
plot(IVsol,r5)
hold on
plot(IVsol,r6)
title('Reaction Rate vs time')
legend('12C','13C','13N','14N','15O','15N')
xlabel('Time (s)')
ylabel('Reaction Rate (No of reactions/s/m^3)')

%% Energy
Q=[1.95 1.20 7.54 7.35 1.73 4.96];
E=(Q(1)*r1+Q(2)*r2+Q(3)*r3+Q(4)*r4+Q(5)*r5+Q(6)*r6)*(4*pi/3);
figure(3)
plot(IVsol,E)
title('Energy per unit time vs time')
xlabel('Time (s)')  
ylabel('Energy per unit time (MeV/s)')