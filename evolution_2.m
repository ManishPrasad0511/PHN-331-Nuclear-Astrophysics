t=[0 1500];
%Initial Conditions
IC1=10^24;
IC2=0;
IC3=0;
IC4=0;
IC5=10;
IC=[IC1 IC2 IC3 IC4 IC5];
[IVsol,DVsol]=ode45('rate_equations_2',t,IC);

%% Density Evolution
clf
plot(IVsol,DVsol(:,1))
hold on
plot(IVsol,DVsol(:,2))
hold on
plot(IVsol,DVsol(:,3))
hold on
plot(IVsol,DVsol(:,4))
title('Density Evolution in time')
legend('p','d','He3','He4')
xlabel('Time (s)')
ylabel('Density (nuclei/m^3)')

%% Temperature 
figure(2)
plot(IVsol,DVsol(:,5)*10^6)
title('Temperature Evolution in time')
xlabel('Time (s)')
ylabel('Temperature (K)')