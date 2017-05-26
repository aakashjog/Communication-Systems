set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

x = linspace(-1,1,1000);

fig = figure;
hold on;

list_of_mu = [1,16,255];

for mu = list_of_mu
	y = sign(x) .* log(1 + mu * abs(x)) / log(1 + mu);
	plot(x,y);
end

legend('$1$', '$16$', '$255$');

set(fig,'Units','Inches');
pos = get(fig,'Position');
set(fig,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);

print(fig,'mu_law','-dpdf','-r0');
close all; clear; clc;
