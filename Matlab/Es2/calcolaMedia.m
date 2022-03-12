% Funzione per trovare il punto medio tra due punti (nello stesso spazio
% vettoriale)
%ARGS: point1: Array di dimensione n; point2: Array di dimensione n
%RETURNS: Array di dimensione n
function calcolaMedia = calcolaMedia(A,B)
    %Sommo i due vettori (punti) e poi divido ogni coorinata per 2
    vectSum = A + B;
    calcolaMedia = vectSum/2;
end