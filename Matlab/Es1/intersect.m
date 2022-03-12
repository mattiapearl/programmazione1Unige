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