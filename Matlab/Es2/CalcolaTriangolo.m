% Funzione che date base e altezza di un rettangolo restituisce area e
% perimetro 
%ARGS: lati: Array con 3 valori: float - non ho usato 3 valori diversi per
%semplicità
%RETURNS: area: float, perimetro: float
function [area,perimetro] = CalcolaTriangolo(lati)
    %Parto da 1 in quanto matlab non segue lo standard di indice che parte
    %da 0 per i vettori/array
    perimetro = lati(1) + lati(2) + lati(3);
    %formula di Erone
    area = sqrt( ...
        (perimetro/2)* ...
        (perimetro/2 - lati(1))* ...
        (perimetro/2 - lati(2))* ...
        (perimetro/2 - lati(3)) ...
        );
end