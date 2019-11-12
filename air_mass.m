
r = -90:90;
w = r/180*pi;
%time = 0:0.06649:24;
lat = 45/360*2*pi;
altitude = asin(cos(w)*cos(lat));
altitude_deg = altitude * 180 / pi;



AM = 1./(cos(pi/2 - altitude) + 0.50572.*(96.07995-(pi/2 - altitude))).^(-1.6364);

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
plot(r,AM);

ylabel('Air Mass (kg/cm^3)')
xlabel('Day Angle (degrees)')

print(gcf,'airmass.png','-dpng','-r300');
% % % % % % % % % % % % % next part
