function FormattedGenerations = generationsFormatter(generations, output, maxWeight, itemsWeight)
%% funkcja liczy potrzebne wielkości statystyczne w każdym z podzbiorów:
%% - wszystkich osobników,
%% - osobników o odpowiedniej wadze
%% - pozostałych, niedopuszczalnych
    n = output.generations;
    
    for i = 1 : 3
        FormattedGenerations(i).maxValues = zeros(n, 1);
        FormattedGenerations(i).minValues = zeros(n, 1);
        FormattedGenerations(i).meanValues = zeros(n, 1);
        FormattedGenerations(i).variance = zeros(n, 1);
    end
    
    [Fit, Others] = getFitAndOthersCollection(generations, output, maxWeight, itemsWeight);
    
    for i = 1 : n
        %% all 
        FormattedGenerations(1).maxValues(i) = -min(generations.Score(i).res);
        FormattedGenerations(1).minValues(i) = -max(generations.Score(i).res);
        FormattedGenerations(1).meanValues(i) = -mean(generations.Score(i).res);
        FormattedGenerations(1).variance(i) = var(generations.Score(i).res);
        
        %% fit only
        FormattedGenerations(2).maxValues(i) = -min(Fit.Score(i).res);
        FormattedGenerations(2).minValues(i) = -max(Fit.Score(i).res);
        FormattedGenerations(2).meanValues(i) = -mean(Fit.Score(i).res);
        FormattedGenerations(2).variance(i) = var(Fit.Score(i).res);
        
        %% others
        FormattedGenerations(3).maxValues(i) = -min(Others.Score(i).res);
        FormattedGenerations(3).minValues(i) = -max(Others.Score(i).res);
        FormattedGenerations(3).meanValues(i) = -mean(Others.Score(i).res);
        FormattedGenerations(3).variance(i) = var(Others.Score(i).res);
    end
    
    FormattedGenerations(1).titleVariance = 'wszystkie';
    FormattedGenerations(1).titleValues = 'wszystkie';

    FormattedGenerations(2).titleVariance = 'pasujące';
    FormattedGenerations(2).titleValues = 'pasujące';
    
    FormattedGenerations(3).titleVariance = 'niepasujące';
    FormattedGenerations(3).titleValues = 'niepasujące';
end

