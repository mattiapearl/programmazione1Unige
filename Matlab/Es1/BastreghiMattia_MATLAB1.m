%%RUNTIME
%Es1
disp("ES 1")
disp(newCoords([1,-3],[-1,1]))
disp(newCoords([-1,3],[3,0]))
disp(newCoords([0,0],[5,2]))
disp(newCoords([sqrt(3),1],[sqrt(3),sqrt(3)-1]))
%Es2
disp("ES 2")
disp(middlePoint([-3,2],[1,-4]))
disp(middlePoint([1,-1/2],[3/4,2]))
disp(middlePoint([-1/2,2/3],[3/2,-4/3]))
disp(middlePoint([sqrt(5),-1],[1-sqrt(5),6]))
%Es3
disp("ES 3")
disp(distanza([-1,0],[0,1]))
disp(distanza([-1,-7],[-1,2]))
disp(distanza([-1,1/3],[-3/2,-4/3]))
disp(distanza([-1/2,7/3],[1,1/3]))
%Es4
disp("ES 4")
disp(angolo([0,1,-1],[1,0,1]))
disp(angolo([0,0,1],[0,sqrt(3),1]))
disp(angolo([0,1,-1],[1,sqrt(3),3]))
disp(angolo([1-sqrt(3),sqrt(3),-1],[0,1,-1]))
%Es5
disp("ES 5")
disp(intersect([-2,1,1],[-3,1,2]))
disp(intersect([-1,1,0],[0,2,1]))
disp(intersect([-7,3,4],[3,2,-5]))
disp(intersect([0,sqrt(3),-1],[-sqrt(6),sqrt(3),1]))

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

% Funzione per trovare il punto medio tra due punti (nello stesso spazio
% vettoriale)
%ARGS: point1: Array di dimensione n; point2: Array di dimensione n
%RETURNS: Array di dimensione n
function middlePoint = middlePoint(point1, point2)
    %Sommo i due vettori (punti) e poi divido ogni coorinata per 2
    vectSum = point1 + point2;
    middlePoint = vectSum/2;
end


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

%Funzione per trovare l'intersezione tra due rette in R2
%ARGS: retta1,retta2: Array [termine noto, coeff x, coeff y]
%RETURNS: Array (punto di intersezione)
function intersec = intersect(retta1,retta2)
    matrSist = [retta1(2) retta1(3) ; retta2(2) retta2(3)];
    %Le prime coordinate dei vettori sono i termini noti "a sinistra"
    %dell'equazione, quindi "spostali a destra" cambiandone il segno
    vettTermNoti = [-retta1(1) ; -retta2(1)];
    %Punto soluzione sistema - Rendo un vettore lineare trasponendolo
    intersec = (linsolve(matrSist,vettTermNoti))';
end