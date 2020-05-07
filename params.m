%% Wpisz numer albumu

clear;
numerAlbumu = 293452;
rng(numerAlbumu);

% N = 32; 
N = 64;
% N = 5;
items(:,1) = round(0.1+0.9*rand(N,1),1);
items(:,2) = round(1+99*rand(N,1));

itemsWeight = items(:, 1);
itemsVal = items(:, 2);

W = 0.3 * sum(itemsWeight);

fun_celu_handler = @(x) fun_celu(itemsVal, itemsWeight, x, W);
options = optimoptions('ga','ConstraintTolerance',1e-6,'PlotFcn', @gaplotbestf);

IntCon = 1 : N;

lb = zeros(1, N);
ub = zeros(1, N) + 1;

A = itemsWeight';
b = W;

% [x,fval,exitflag,output,population,scores] = ga(fun_celu_handler, N, A, b, [], [], lb, ub, [], IntCon, options);

[x,fval,exitflag,output] = intlinprog(-itemsVal,IntCon,A,b,[],[],lb,ub);

csvProvider(itemsWeight, ['wagi_N=', num2str(N), '.csv'], 'przedmiot', 'waga', '%f');
csvProvider(itemsVal, ['wartosci_N=', num2str(N), '.csv'], 'przedmiot', 'wartosc', '%d');
