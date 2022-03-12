% ES2
% SCOPO:            Presa una funzione a due variabili si stampa a schermo il grafico
%                   superficiale, le curve di livello, e 20 slicing del
%                   grafico stesso prima su X e poi su Y
% FUNZIONAMENTO:    Si costruisce la matrice Z rispetto alla funzione
%                   f(x,y), quindi si usano funzioni integrate per stampare
%                   superficie e curve. Per le "fette" si itera in un array
%                   -10:1:10 e si seleziona la riga (Y fissato) o colonna(X
%                   fissato) relativa al valore attuale dell'iterazione.
%                   Questa si graficano assieme questo vettore estratto e
%                   la variabile per cui cambia.

%Definisco con handle f la funzione principale
f = @(x,y) (0.5*(x.^2) - y - (3)*x.*y);
x = -10:0.5:10;
%y è trasposto per permettere surf e contour
y = (-10:0.5:10)';
%z è la mia coordinata
z = f(x,y); %ora X è costante rispetto alle righe e Y rispetto alle colonne. Fissata una riga, Y è costante - poichè y è il vettore verticale
%Stampo
%Setup finestra grafici (tile spacing per mostrare anche i titoli)
t = tiledlayout(2,2);
title(t,"$ \textrm{Grafici rispetto a: } \frac{1}{2}x^2 - y - 3xy $",'interpreter','latex');
%Grafici singoli

a= nexttile;
surf(x,y,z);
xlabel(a,"X");
ylabel(a,"Y");
zlabel(a,"Z");
title(a,"Grafico di superficie");

b = nexttile;
contour(x,y,z,20); %Il 20 determina quante curve disegnare
title(b,"Curve di livello");

%Definisco lo slice value con cui divido i grafici in subplot
slice = -10:1:10;
currentLegend = strings(1,length(slice));%Prealloco un array di 21 slot

c = nexttile;
%Rimango sullo stesso grafico. OPZIONALMENTE avrei potuto cambiare grafico
%per tutti gli slice, ma avrebbe reso MOLTO gravosa la lettura 
for i = slice
    iZ = z(:,x==i); %Prendo il vettore verticale "z(y)" con X fissato
    colValue = (i+10)/20; %Creo un generico valore tra 0 e 1 per colorare i grafici
    plot(y,iZ,"Color",[1-colValue,0.74,colValue]);
    %Aggiorno la legenda per mostrare a schermo che "taglio" sia.
    currentLegend(i+11) = strcat("X = ", num2str(i));
    hold on; %Mantengo fisso il grafico
end
hold off;
xlabel(c, "Valore di Y");
ylabel(c, "Valore di Z");
legend(currentLegend);
title(c, "Sezioni con X fissato da -10 a 10");

%Ripeto lo stesso procedimento
d = nexttile;
for i = slice
    iZ = z(y==i,:); %Prendo il vettore orizzontale "z(x)" con Y fissato
    colValue = (i+10)/20;
    plot(x,iZ,"Color",[0.5,colValue,1-colValue]);
    currentLegend(i+11) = strcat("Y = ", num2str(i));
    hold on;
end
hold off;
xlabel(d, "Valore di X");
ylabel(d, "Valore di Z");
legend(currentLegend);
title(d, "Sezioni con Y fissato da -10 a 10");