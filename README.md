# AE-proj-2

## Opis plików
- params.m - skrypt ładujący stałe
- AE_p2_Bartosz_Golawski_N... - skrypty uruchamiające rozwiązania projektu
- fun_celu.m - funkcja celu
- best_solution.m - funkcja zwracająca wektor najlepszych rozwiązań
- csvProvider.m - funkcja drukująca wektor do formatu pliku .csv
- dataSaver.m - funkcja zapisująca wyniki optymalizacji do pliku
- generationsFormatter.m - funkcja liczy potrzebne wielkości statystyczne w każdym z podzbiorów generacji
- getFitAndOthersCollection.m - funkcja dzielącą każdą z generacji na podzbiory osobników o odpowiedniej wadze i pozostałych
- getItemWeight.m - funkcja zwraca wagę osobnika
- print_to_file.m - funkcja zapisująca wektor do .txt 
- resultPlotter.m - funkcja plotująca wszystkie potrzebne wykresy
- GA_decorate.m - dekorator do optymalizatora z customową funkcją output do optymalizatora

- pliki .csv - pliki z danymi potrzebne solverowi GLPK
- plik .mod - plik modelu do solvera GLPK
