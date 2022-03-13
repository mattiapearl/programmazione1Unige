% Funzione che prende un vettore di indici alfabetici e li decodifica in
% lettere usando uno shift passato
% ARGS:     alphaVect: vettore lunghezza n stringhe(indici alfabetici),
%           alphabet: vettore, shiftBackVect: vettore numerico lunghezza n 
%           (shiftback per l'i-esimo indice)
%           
% RETURNS:  wordVect: vettore stringa lungehzza n (frase "vettorizzata")
% PARTICOLARI:  Queste funzioni hanno il secondo argomento di default a 0
%               per poterle testarle
function wordVect = alphVectToStringVect(alphaVect, alphabet,shiftBackVect )
    
    if nargin < 3 %Se ci sono meno di due input, casta il secondo a 0. 
        shiftBackVect = zeros(length(alphaVect),1)';
    end
    %Rendo l'array input di celle/stringe in un array di numeri
    alphaVect = str2double(alphaVect);
    %Tengo un index poichè matlab di default itera con un "of"
    % Popolo l'elemento relativo a quello di vect
    realAlphIndex = mod(alphaVect - shiftBackVect, length(alphabet));
    %Se capita la lettera z, si trova esattamente sulla "Lunghezza", quindi
    %ha indice 0 come modulo. In quel caso la castiamo 36
    realAlphIndex(realAlphIndex == 0) = length(alphabet);
    wordVect = alphabet(realAlphIndex);
end