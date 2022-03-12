% Funzione per trovare il punto medio tra due punti (nello stesso spazio
% vettoriale)
%ARGS: point1: Array di dimensione n; point2: Array di dimensione n
%RETURNS: Array di dimensione n
function middlePoint = middlePoint(point1, point2)
    %Sommo i due vettori (punti) e poi divido ogni coorinata per 2
    vectSum = point1 + point2;
    middlePoint = vectSum/2;
end