clear all;
clc;

syms y(x);

air_density = 1.25;
v_min = 3;
v_rate = 10;
v_cutoff = 20;
blade_min = 10;
blade_max = 11;

y(x) = piecewise(x<v_min, 0 , v_min<=x<v_rate, 0.4*0.5*air_density*pi^2*blade_min^2*x^3, v_rate<=x<=v_cutoff, 0.4*0.5*air_density*pi^2*blade_min^2*v_rate^3 , v_cutoff<x,0 ,0);
f(x) = piecewise(x<v_min, 0 , v_min<=x<v_rate, 0.5*0.5*air_density*pi^2*blade_max^2*x^3, v_rate<=x<=v_cutoff, 0.5*0.5*air_density*pi^2*blade_max^2*v_rate^3 , v_cutoff<x,0 ,0);

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
fplot(y,[0 25]);
fplot(f,[0 25]);

legend('Min Power','Max Power','Location', 'East')

grid on;
grid minor;

% ylim([0 70])
% xlim([-180 180])
ylabel('Power Extracted (W)')
xlabel('Wind Speed (m/s)')

print(gcf,'wind.png','-dpng','-r300');
% % % % % % % % % % % % % next part
