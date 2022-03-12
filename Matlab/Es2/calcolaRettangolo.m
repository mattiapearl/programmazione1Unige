% Funzione che date base e altezza di un rettangolo restituisce area e
% perimetro 
%ARGS: altezza: float, base: float
%RETURNS: area: float, perimetro: float
function [area,perimetro] = calcolaRettangolo(altezza, base)
    perimetro = 2*altezza + 2*base;
    area = base * altezza;
end