% Specifico una funzione che prende come argomenti due array - immaginati
% come punti - e restituisce la differenza numerica tra i due
%ARGS: initialPoint: Array di dimensione n; newCenter: Array di dimensione
%n
%RETURNS: Array di dimensione n
function newCoords = newCoords(initialPoint, newCenter)
    % Applico la trasformazione geometrica restituendo la differenza tra il
    % punto richiesto e il mio nuovo centro
    newCoords = (initialPoint-newCenter);
end