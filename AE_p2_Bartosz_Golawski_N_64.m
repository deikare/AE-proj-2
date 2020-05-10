%% AE - projekt nr 2
%% Bartosz Goławski
%% nr albumu 293452
%% 3.05.2020

%% zakomentowane zapisywania danych oraz wykresów

clear;
close all

params;

N = 64;

i = 1;
alfa_vec = [200, 300, 500, 700];

itemsVal = itemsVal_64;
itemsWeight = itemsWeight_64;
W = W_64;

options = optimoptions('ga','ConstraintTolerance',1e-6, 'PopulationType', 'bitstring');


for alfa = alfa_vec
    fun_celu_handler = @(x) fun_celu(itemsVal, itemsWeight, x, W, alfa);
    [generations, x,fval,exitflag,output,population,scores] = GA_decorate(options, fun_celu_handler, N);
    
    FormattedGenerations = generationsFormatter(generations, output, W, itemsWeight);
    
%     name = ['alfa=', num2str(alfa)];
%     fig = resultPlotter(FormattedGenerations, name);
%     figPath = ['data/wykresy/64/', name, '.png'];
%     saveas(fig, figPath);
    
%     dataSaver(['alfa=', num2str(alfa)], 'data/64/alfa/', FormattedGenerations)
    
    alfa_tuning(i).generations = generations;
    alfa_tuning(i).x = x;
    alfa_tuning(i).fval = fval;
    alfa_tuning(i).output = output;
    
    i = i + 1;
end
close all;

alfa = 200;

i = 1;
mutation_p_vec = [0.05, 0.1, 0.2, 0.3, 0.5, 0.8];
for mutation_p = mutation_p_vec
    options = optimoptions('ga','ConstraintTolerance',1e-6, 'PopulationType', 'bitstring', 'MutationFcn', {@mutationuniform, mutation_p});
    fun_celu_handler = @(x) fun_celu(itemsVal, itemsWeight, x, W, alfa);
    [generations, x,fval,exitflag,output,population,scores] = GA_decorate(options, fun_celu_handler, N);
    
    FormattedGenerations = generationsFormatter(generations, output, W, itemsWeight);

%     name = ['pMutacji=', num2str(mutation_p)];
%     fig = resultPlotter(FormattedGenerations, name);
%     figPath = ['data/wykresy/64/', name, '.png'];
%     saveas(fig, figPath);
    
%     dataSaver(['mutation_p=', num2str(mutation_p)], 'data/64/mutation_p/', FormattedGenerations)
    
    mutation_p_tuning(i).generations = generations;
    mutation_p_tuning(i).x = x;
    mutation_p_tuning(i).fval = fval;
    mutation_p_tuning(i).output = output;
    
    i = i + 1;
end

close all;

mutation_p = 0.05;

i = 1;
cross_vec = ["crossoverscattered", "crossoversinglepoint", "crossovertwopoint"];
for cross = cross_vec
    options = optimoptions('ga','ConstraintTolerance',1e-6, 'PopulationType', 'bitstring', 'MutationFcn', {@mutationuniform, mutation_p}, 'CrossoverFcn', cross);
    fun_celu_handler = @(x) fun_celu(itemsVal, itemsWeight, x, W, alfa);
    [generations, x,fval,exitflag,output,population,scores] = GA_decorate(options, fun_celu_handler, N);
    
    FormattedGenerations = generationsFormatter(generations, output, W, itemsWeight);
    
%     name = cross;
%     fig = resultPlotter(FormattedGenerations, name);
%     figPath = join(['data/wykresy/64/', name, '.png'], '');
%     saveas(fig, figPath);
    
%     dataSaver(cross, 'data/64/cross/', FormattedGenerations);
    
    cross_tuning(i).generations = generations;
    cross_tuning(i).x = x;
    cross_tuning(i).fval = fval;
    cross_tuning(i).output = output;
    
    i = i + 1;
end

close all;

cross = "crossoverscattered";

i = 1;
sel_vec = ["selectionremainder", "selectiontournament", "selectionstochunif"];
for sel = sel_vec
    if sel == "selectiontournament"
        options = optimoptions('ga','ConstraintTolerance',1e-6, 'PopulationType', 'bitstring', 'MutationFcn', {@mutationuniform, mutation_p}, 'CrossoverFcn', cross, 'SelectionFcn', {@selectiontournament, 4});
    else
        options = optimoptions('ga','ConstraintTolerance',1e-6, 'PopulationType', 'bitstring', 'MutationFcn', {@mutationuniform, mutation_p}, 'CrossoverFcn', cross, 'SelectionFcn', sel);
    end
    
    fun_celu_handler = @(x) fun_celu(itemsVal, itemsWeight, x, W, alfa);
    [generations, x,fval,exitflag,output,population,scores] = GA_decorate(options, fun_celu_handler, N);
    
    FormattedGenerations = generationsFormatter(generations, output, W, itemsWeight);
    
%     name = sel;
%     fig = resultPlotter(FormattedGenerations, name);
%     figPath = join(['data/wykresy/64/', name, '.png'], '');
%     saveas(fig, figPath);
    
%     dataSaver(sel, 'data/64/sel/', FormattedGenerations);
    
    sel_tuning(i).generations = generations;
    sel_tuning(i).x = x;
    sel_tuning(i).fval = fval;
    sel_tuning(i).output = output;
    
    i = i + 1;
end

sel = {@selectiontournament, 4};

close all;

%% testowanie ograniczneia na fitness >= -1980
options = optimoptions('ga','ConstraintTolerance',1e-6, 'PopulationType', 'bitstring', 'MutationFcn', {@mutationuniform, mutation_p}, 'CrossoverFcn', cross, 'SelectionFcn', sel, 'FitnessLimit', -1980);
fun_celu_handler = @(x) fun_celu(itemsVal, itemsWeight, x, W, alfa);
[generations, x,fval,exitflag,output,population,scores] = GA_decorate(options, fun_celu_handler, N);

FormattedGenerations = generationsFormatter(generations, output, W, itemsWeight);

% name = ['fitness=', num2str(1980)];
% fig = resultPlotter(FormattedGenerations, name);
% figPath = ['data/wykresy/64/', name, '.png'];
% saveas(fig, figPath);
% 
% dataSaver('fitness', 'data/64/sel/', FormattedGenerations);

fitness.generations = generations;
fitness.x = x;
fitness.fval = fval;
fitness.output = output;

i = 1;
cross_frac_vec = [0.1, 0.3, 0.5, 0.8, 0.9, 0.95];
for cross_frac = cross_frac_vec
    options = optimoptions('ga','ConstraintTolerance',1e-6, 'PopulationType', 'bitstring', 'MutationFcn', {@mutationuniform, mutation_p}, 'CrossoverFcn', cross, 'SelectionFcn', sel, 'CrossoverFraction', cross_frac);
    fun_celu_handler = @(x) fun_celu(itemsVal, itemsWeight, x, W, alfa);
    [generations, x,fval,exitflag,output,population,scores] = GA_decorate(options, fun_celu_handler, N);
    
    FormattedGenerations = generationsFormatter(generations, output, W, itemsWeight);
    
%     name = ['pCross=', num2str(cross_frac)];
%     fig = resultPlotter(FormattedGenerations, name);
%     figPath = ['data/wykresy/64/', name, '.png'];
%     saveas(fig, figPath);
%     
%     dataSaver(['cross_frac=', num2str(cross_frac)], 'data/64/cross_frac/', FormattedGenerations);
    
    cross_frac_tuning(i).generations = generations;
    cross_frac_tuning(i).x = x;
    cross_frac_tuning(i).fval = fval;
    cross_frac_tuning(i).output = output;
    
    i = i + 1;
end

cross_frac = 0.9;


