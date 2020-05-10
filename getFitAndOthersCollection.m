function [Fit, Others] = getFitAndOthersCollection(generations, output, maxWeight, itemsWeight)
%% funkcja dzielącą każdą z generacji na podzbiory:
%% - osobników o odpowiedniej wadze
%% - pozostałych, niedopuszczalnych
    n = output.generations;
    
    Fit.Score = [];
    Fit.Population = [];
    
    Others.Score = [];
    Others.Population = [];

    for i = 1 : n
        others_iter = 1;
        fit_iter = 1;
        for j = 1 : length(generations.Score(i).res)
            if getItemWeight(generations.Population(i).res(j, :), itemsWeight) > maxWeight
                Others.Score(i).res(others_iter, :) = generations.Score(i).res(j, :);
                Others.Population(i).res(others_iter, :) = generations.Population(i).res(j, :);
                others_iter = others_iter + 1;
            else
                Fit.Score(i).res(fit_iter, :) = generations.Score(i).res(j, :);
                Fit.Population(i).res(fit_iter, :) = generations.Population(i).res(j, :);
                fit_iter = fit_iter + 1;
            end
        end
        
    end
end

