#======================================================================
param Model symbolic := "Sieciowe_produkcja_dystrybucja";
param Wagi symbolic := "Wyniki_symulacji.csv";
param Wartosci symbolic := "Wyniki_symulacji.csv";
#======================================================================
param N := 64; 

set Indeksy := 1..N;

#======================================================================
param Waga 		{Indeksy} >= 0;
param Wartosc 		{Indeksy} >= 0;

table T_Zapotrzebowanie1 IN "CSV" "wartosci_N64.csv":
	[Przedmiot],  Wartosc~Wartosc;
table T_Zapotrzebowanie2 IN "CSV" "wagi_N64.csv":
	[Przedmiot],  Waga~Waga;

#======================================================================
var X {Indeksy} binary;

var Suma_czasow;
var W_max;
#======================================================================

maximize FC_Suma_czasow:
					Suma_czasow;

#======================================================================
subject to

	Ogr_Suma_czasow:
		Suma_czasow = 
			(sum {i in Indeksy} (Wartosc[i] * X[i]));
	
	Waga_max:
		W_max = 
			0.3 * (sum {i in Indeksy} (Waga[i]));
	
	Ogr_wagi:
		sum{i in Indeksy} (Waga[i] * X[i]) <= W_max;
	
	

solve;

	printf "\n\n\n#=====================================\n";
	printf "Wyniki symulacji\n";
	printf "wartosc = %s\n", Suma_czasow;
	printf "waga_max = %s\n", W_max;
	printf "waga_rozw = %s\n", sum{i in Indeksy} (Waga[i] * X[i]);

	
	printf "X = ";
	for {i in Indeksy} {
		printf "%s ", X[i];
	}
	
	printf "\n";
	
end;
