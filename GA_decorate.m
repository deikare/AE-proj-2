function [generations, x,fval,exitflag,output,population,scores] = GA_decorate(options, fun_celu_holder, N)
%% dekorator do wywoływania optymalizacji
    generations.Population = [];
    generations.Score = [];
    
    i = 1;
    
    options.OutputFcn = @output_fun;
    
    [x,fval,exitflag,output,population,scores] = ga(fun_celu_holder, N, [], [], [], [], [], [], [], options);
    
    %% wlasna funkcja output optymalizacji
    function [state,options,optchanged] = output_fun(options,state,flag)
        optchanged = false;

        switch flag
            case 'iter'
                generations.Score(i).res = state.Score;
                generations.Population(i).res = state.Population;
                i = i + 1;
            case 'interrupt'
                %nothing
            case 'init'
                %nothing
            case 'done'
                %nothing
            otherwise
        end
    end
end

