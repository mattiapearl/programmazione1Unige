% Funzione per trovare la distanza tra due punti
%ARGS: point1: Array di dimensione n; point2: Array di dimensione n
%RETURNS: float
function dist = distanza(point1,point2) %Uso italiano perchè distance è già definita
    %Sottraggo c-c (non serve val assoluto perchè elevo subito dopo)
    vectDif = point1 - point2;
    %Elevo al quadrato i cateti
    catPow = vectDif.^2;
    %Trovo l'ipotenusa come somma delle coordinate e radice delle stesse
    dist = sqrt(sum(catPow));
end