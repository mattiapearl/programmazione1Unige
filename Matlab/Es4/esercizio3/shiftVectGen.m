% Funzione che prende un vettore e una chiave e genera uno shifting vetc
% della stessa lunghezza - basta questo in quanto qualsiasi "cambiamento"
% seguendo un codex è una permutazione
% ARGS:     vect: vettore lunghezza n, n: int (chiave condivisa)
% RETURNS:  shiftVect: vettore numerico lungehzza n 
function shiftVect = shiftVectGen(vect, n)
   % Quì si potrebbe aggiungere casualità e altri elementi di encryptazione
   % (come uno shift basato sul primo elemento passato e poi cambiato
   % ricorsivamente o similari. Magari con un vero sistema di comunicazione uno shared secret per ogni lettera, e magari qualche transposed matrix codex di dimensione n per aggiungere difficoltà) 
   % Procedo a NON intraprendere alcuna di queste strade in quanto il
   % fulcro dell'esercizio è l'algebra modulare usata sopra, quì creo un
   % basico vettore per un caesar codex.
   shiftVect = zeros(length(vect),1) + n;   
end