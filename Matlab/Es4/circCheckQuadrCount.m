% Funzione che prende una matrice nx3 rappresentante - per righe - possibili coefficienti di circonferenze, mantiene le righe con la terza
% colonna positiva e conta quanti di questi si trovino in ogni quadrante
% ARGS:     matrice nx3 (riga: (x-a)^2+(y-b)^2=c^2  Si forniscono a,b,c) 
% RETURNS:  fixMatix: matrice nx3 (0<n<=3),  vettQuadranti: vettore (LEGENDA INDICI: 1 primo
% quad, 2 secondo, ..., 4 quarto, 5 su asse)
% COMPORTAMENTI PARTICOLARI: ho evitato di usare for e if il più possibile
% prendendo in considerazione una matrice di n righe e supponendo che lo
% "scoping" tramite vettori/matrici logiche sia un operazione lineare
% rispetto alla dimensione

function [fixMatrix, vettQuadranti] = circCheckQuadrCount(matr)
    % Definisco subito il mio vettore ret
    vettQuadranti = [0,0,0,0,0];
    % Prendo la matrice in input e creo una boolean quando l'elemento sulla
    % terza colonna è negativo (raggio minore di 0)
    rigaVeraVect = matr(:,3) > 0; % Vettore che determina quali righe abbiano il terzo coefficiente negativo
    %Prendi solo le righe che soddisfano la condizione
    fixMatrix = matr(rigaVeraVect,:); % Matrice di taglia ridotta (righe <=3)
    %devo CONTARE, non sapere quali siano, quindi ragiono in altezza della
    %risultante
    noQuad = fixMatrix(:,1) == 0 | fixMatrix(:,2) == 0;
    %Rimuovo le righe non nei quadranti per contare meglio
    quadrMatrix = fixMatrix(~noQuad,:);
    %Creo dei vettori logici che determinano quali righe siano a
    %destra e quali siano "sopra" nel piano cartesiano, quindi interseco le
    %due cose
    quadrDes = quadrMatrix(:,1) > 0;
    quadrSup = quadrMatrix(:,2) > 0;
    %Assegno i valori
    vettQuadranti(1) = nnz(and(quadrDes , quadrSup)); %destra + sopra
    vettQuadranti(2) = nnz(and(~quadrDes , quadrSup)); %non destra + sopra
    vettQuadranti(3) = nnz(and(~quadrDes , ~quadrSup)); %etc.
    vettQuadranti(4) = nnz(and(quadrDes ,~quadrSup));
    vettQuadranti(5) = nnz(noQuad); %circonferenze in nessun quadrante
end
