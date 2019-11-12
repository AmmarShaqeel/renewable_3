clear all;
clc;

syms y(x);
syms f(x);

air_density = 1.25;
v_min = 2;
v_rate = 10;
v_cutoff = 20;
v_mean = 11;
blade_min = 10;
blade_max = 11;

speeds = linspace(0,30,31);

g = (pi/2)*(speeds/(v_mean^2)).*exp(-(pi/4)*(speeds.^2/11^2))*365.25*24;

y(x) = piecewise(x<v_min, 0 , v_min<=x<v_rate, 0.35*0.4*0.5*air_density*pi^2*blade_min^2*x^3, v_rate<=x<=v_cutoff, 0.35*0.4*0.5*air_density*pi^2*blade_min^2*v_rate^3 , v_cutoff<x,0 ,0);
f(x) = piecewise(x<v_min, 0 , v_min<=x<v_rate, 0.35*0.5*0.5*air_density*pi^2*blade_max^2*x^3, v_rate<=x<=v_cutoff, 0.35*0.5*0.5*air_density*pi^2*blade_max^2*v_rate^3 , v_cutoff<x,0 ,0);


p1 = y(speeds).*g/1000;
p2 = f(speeds).*g/1000;



%% Printing Image%%
width = 6;     % Width in inches
height = 4;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz = 14;      % Fontsize
lw = 1.5;      % LineWidth
msz = 8;       % MarkerSize

figure(1);
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca,'Fontname','CMU bright','Fontsize',fsz);

hold on;
% fplot(y,[0 25]);
% fplot(f,[0 25]);
plot(speeds,g);

% legend('Min Power','Location', 'East')

grid on;
grid minor;

%ylim([-100 700])
xlim([-5 35])
ylabel('Annual Hours (hrs)')
xlabel('Wind Speed (m/s)')

print(gcf,'wind3.png','-dpng','-r300');
% % % % % % % % % % % % % next part

figure(2);
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
set(gca,'Fontname','CMU bright','Fontsize',fsz);


hold on;
plot(speeds,p1);
plot(speeds,p2);

grid on;
grid minor;

ylabel('Annual Energy (kWh)')
xlabel('Wind Speed (m/s)')
legend('Annual Min','Annual Max','Location', 'East')


print(gcf,'wind4.png','-dpng','-r300');

figure(3);
plot([1 2], [sum(p1) sum(p2)]);

