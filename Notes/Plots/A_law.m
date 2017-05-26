set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

x = linspace(-1,1,1000);

fig = figure;
hold on;

list_of_A = [1,16,255];

y = zeros(size(x));

for A = list_of_A
	for i = [1:length(x)]
		if abs(x(i)) < 1 / A
			y(i) = (A * abs(x(i))) / (1 + log(A)) .* sign(x(i));
		else
			y(i) = (1 + log(A * abs(x(i)))) / (1 + log(A)) .* sign(x(i));
		end
	end
	plot(x,y);
end

legend('$1$', '$16$', '$255$');

set(fig,'Units','Inches');
pos = get(fig,'Position');
set(fig,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);

print(fig,'A_law','-dpdf','-r0');
close all; clear; clc;
