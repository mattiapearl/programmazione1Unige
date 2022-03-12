% ES1
% SCOPO:            Dato un input i viene presa una matrice ix3 con
%                   coefficienti casuali e si ritorna una matrice con righe con coefficienti
%                   adatti ad una circonferenza e il quadrante occupato da
%                   queste
% FUNZIONAMENTO:    Viene chiesto un input all'utente, si controlla che sia
%                   numerico e naturale, si crea una matrice con numeri tra
%                   -10 e 10, si manda tutto alla funzione
%                   circCheckQuadrCount e si stampano gli output


%Loop per input
x=0;
while(x ==0)
    inp = input("\nInserisci un numero naturale per righe di una matrice (numero negativo o 0 per uscire): ");
    %Controllo che sia un numero reale - non un carattere - e poi se sia
    %intero
    if (isreal(inp) && rem(inp,1) == 0)
        %quindi controllo se sia maggiore di 0
        if(inp>0)
            randMatr = -10 + (20)*rand(inp,3);
            disp(randMatr);
            [matrCerchi, contQuadranti] = circCheckQuadrCount(randMatr);
            %Stampo a schermo
            disp("Queste righe sono i coefficienti validi per una circonferenza");
            disp(matrCerchi)
            %Uso fprintf per migliore leggibilità
            for i = 1:4
                fprintf("Nel %d° quadrante sono presenti: %d cerchi.\n",i,contQuadranti(i));
            end
            fprintf("Ci sono in totale %d cerchi il cui centro posa su un asse cartesiano.\n\n", contQuadranti(5));
        else
            %Chiudo il ciclo ponendo x diverso da 0
            x = 1;
        end
    end
end
