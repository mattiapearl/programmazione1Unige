% Funzione che disegna grafico di x, x^2, x^1/2
%ARGS: step: int - Distanza tra i vari punti
%VOID
function graficoXSqrtSq(step)
    %Per evitare rotture, se step è maggiore di 1 lo prendo come 0.1
    if(step > 1)
        step = 0.1;
    end
    X = -3:step:5;
    % definisco la linea delle ordinate
    sqrtX = sqrt(X);
    Y = X;
    sqX = X.^2;
    %disegna i grafici
    % divido in 3 colonne
    subplot(1,3,1);
    plot(X,Y);
    % mi sposto
    subplot(1,3,2);
    plot(X,sqrtX);
    % mi sposto
    subplot(1,3,3);
    plot(X,sqX);
end