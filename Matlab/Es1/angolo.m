%Funzione per trovare l'angolo tra due rette fornite in formato array
%ARGS: retta1,retta2: Array [termine noto, coeff x, coeff y]
%RETURNS: int (gradi angolo)
function angle = angolo(retta1,retta2)
    % Prendo il coeff x, moltiplico per -1 (cambio lato equazione), e
    % divido per il coefficiente di y
    coeffAng1 = retta1(2) * -1 * (1/retta1(3));
    coeffAng2 = retta2(2) * -1 * (1/retta2(3));
    % Se il caso è asintotico, arbitrariamente ritorna 90°
    if(coeffAng2 == coeffAng1)
        angle = 0;
    elseif(abs(coeffAng1 * coeffAng2) == 1)
        angle = 90;
    else
        % Tangente della differenza
        coeffAngRes = abs((coeffAng2 - coeffAng1)/(1+ coeffAng1 * coeffAng2));
        angle = rad2deg(atan(coeffAngRes));
    end
end