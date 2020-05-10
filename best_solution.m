function [X_bit, fval] = best_solution(fun_celu_handler, N)
%% funkcja zwracająca najlepsze rozwiązania
    X_bit = de2bi(0, N);
    fval = abs(fun_celu_handler(X_bit));
    
    for i = 1 : 2 ^ N - 1
        x = de2bi(i, N);
        x = flip(x);
        y = abs(fun_celu_handler(x));
        
        if y > fval
            X_bit = x;
            fval = y;
        elseif y == fval
            X_bit = [X_bit; x];
        end
    end
end

