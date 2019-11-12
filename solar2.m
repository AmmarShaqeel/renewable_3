clear all;
clc;

r = -90:90;
w = r/180*pi;
%time = 0:0.06649:24;
lat = 45/360*2*pi;
altitude = asin(cos(w)*cos(lat));
altitude_deg = altitude * 180 / pi;

x = r;
y = 2.4e-06.*x.^4 + 2.8e-22.*x.^3 - 0.1.*x.^2 + 1.1e-16.*x + 6.8e+02;



%plot(x,y);
%plot(x,y);
hold on
grid on

I0 = 1367;
Airmass = 1 / cos(lat);

Insolation = I0*sin(altitude)/ Airmass;

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
plot(r,Insolation);

ylabel('Solar Intensity (W/m^2)')
xlabel('Angle (degrees)')

print(gcf,'solar1.png','-dpng','-r300');
% % % % % % % % % % % % % next part
