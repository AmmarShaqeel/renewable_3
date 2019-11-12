clear all;
clc;


r = -90:90;
w = r/180*pi;

hour = [-pi/2:pi/180:pi/2];


insolation = 1.367*cos(pi/4).*cos(w);

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
grid on;
grid minor;
%plot(r,altitude_deg);
plot(r,insolation);
ylabel('Solar intensity kW/m^2') % label for y axis
xlabel('Hour Angle (degrees)') % label for x axis

print(gcf,'solar1.png','-dpng','-r300');
% % % % % % % % % % % % % next part