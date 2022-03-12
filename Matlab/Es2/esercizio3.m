disp("Funzione che trova l'area e il perimetro di un triangolo\n\n")
lati(1) =input("Inserisci la misura del primo lato (numero):");
lati(2) =input("\ndel secondo lato (numero):");
lati(3) =input("\ndel secondo lato (numero):");
[area,perimetro] = CalcolaTriangolo(lati);
disp("Area:");
disp(area);
disp("Perimetro:");
disp(perimetro);
%Chiudi il programma
return;