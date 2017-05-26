set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

linestyles = {'-','--','-.', ':'};

omega = linspace(-2 * pi, 2* pi,1000);

fig = figure;
hold on;

list_of_rho = [0,0.5,1];

P = zeros(size(omega));

for rho = list_of_rho
	Delta = rho * pi;
	for i = [1:length(omega)]
		if(abs(omega(i)) <= pi - Delta)
			P(i) = 1;
		elseif(pi - Delta < abs(omega(i)) && abs(omega(i)) < pi + Delta)
			P(i) = 1 / 2 * (1 - sin(((abs(omega(i)) - pi) * pi) / (2 * Delta)));
		else
			P(i) = 0;
		end
	end
	plot(omega,P,linestyles{find(list_of_rho == rho)});
end

legend('$0$', '$0.5$', '$1$');

ax = gca;
ax.XTick = [-2 * pi, -1.5 * pi, -pi, -0.5 * pi, 0.5 * pi, pi, 1.5 * pi, 2 * pi];
ax.XTickLabel = {'$-2 \pi$', '$-\frac{3 \pi}{2}$', '$-\pi$', '$-\frac{\pi}{2}$', '$\frac{\pi}{2}$', '$\pi$', '$\frac{3 \pi}{2}$', '$2 \pi$'}

set(fig,'Units','Inches');
pos = get(fig,'Position');
set(fig,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);

print(fig,'raised_cosine_pulses_in_frequency','-dpdf','-r0');

fig = figure;
hold on;

T = 1;

t = linspace(-5 * T, 5 * T, 1000);

p = zeros(size(t));

for rho = list_of_rho
	Delta = rho * pi;
	for i = [1:length(t)]
		p(i) = sinc(pi * t(i) / T) .* cos(rho * pi * t(i) / T) / (1 - (2 * t(i) * rho / T).^2);
	end
	plot(t,p,linestyles{find(list_of_rho == rho)});
end

legend('$0$', '$0.5$', '$1$');

set(fig,'Units','Inches');
pos = get(fig,'Position');
set(fig,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);

print(fig,'raised_cosine_pulses_in_time','-dpdf','-r0');

close all; clear; clc;
