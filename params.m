%% skrypt generujący stałe

%% Wpisz numer albumu
numerAlbumu = 293452;
rng(numerAlbumu);

N = 32; 
items(:,1) = round(0.1+0.9*rand(N,1),1);
items(:,2) = round(1+99*rand(N,1));

itemsWeight_32 = items(:, 1);
itemsVal_32 = items(:, 2);

W_32 = 0.3 * sum(itemsWeight_32);

alfa_32 = 200; %% od 200 zaczyna dobrze działać

fun_celu_handler_32 = @(x) fun_celu(itemsVal_32, itemsWeight_32, x, W_32, alfa_32);
options_32 = optimoptions('ga','ConstraintTolerance',1e-6, 'PopulationType', 'bitstring', 'MutationFcn', {@mutationuniform, 0.01});

%% potrzeba kilka godzin na znalezienie
% if exist('best_solution_32.mat', 'file')
%     load('best_solution_32.mat');
% else
%     [X_bit_32, best_fval_32] = best_solution(fun_celu_handler, N);
%     save('best_solution_32.mat', 'X_bit_32', 'best_fval_32');
% end

N = 64;
items = [];
items(:,1) = round(0.1+0.9*rand(N,1),1);
items(:,2) = round(1+99*rand(N,1));

itemsWeight_64 = items(:, 1);
itemsVal_64 = items(:, 2);

W_64 = 0.3 * sum(itemsWeight_64);

alfa_64 = 1000;

fun_celu_handler64 = @(x) fun_celu(itemsVal_64, itemsWeight_64, x, W_64, alfa_64);
options_64 = optimoptions('ga','ConstraintTolerance',1e-6, 'PopulationType', 'bitstring', 'MutationFcn', {@mutationuniform, 0.01});

%% potrzeba kilka godzin na znalezienie
% if exist('best_solution_64.mat', 'file')
%     load('best_solution_64.mat');
% else
%     [X_bit_64, best_fval_64] = best_solution(fun_celu_handler, N);
%     save('best_solution_64.mat', 'X_bit_64', 'best_fval_64');
% end

%% wektory optymalnych parametrów
X_64 = [0 1 0 1 0 0 0 0 1 1 1 1 0 1 1 0 0 0 1 0 0 1 1 1 0 1 1 0 1 1 0 0 1 0 0 0 0 1 0 1 1 0 0 0 0 0 1 0 1 1 1 0 1 0 0 1 0 0 1 0 0 1 0 0]';

X_32 = [0 1 1 0 1 1 0 0 1 0 0 1 0 1 0 0 0 0 0 0 1 0 1 0 0 1 0 1 1 0 1 1]';

%% wywołania generujące pliki .csv potrzebne solverowi GLPK do znalezienia optimum
% 
% csvProvider(itemsWeight_32, ['wagi_N=', num2str(32), '.csv'], 'Przedmiot', 'Waga', '%f');
% csvProvider(itemsVal_32, ['wartosci_N=', num2str(32), '.csv'], 'Przedmiot', 'Wartosc', '%d');
% 
% csvProvider(itemsWeight_64, ['wagi_N=', num2str(64), '.csv'], 'Przedmiot', 'Waga', '%f');
% csvProvider(itemsVal_64, ['wartosci_N=', num2str(64), '.csv'], 'Przedmiot', 'Wartosc', '%d');
