% Funzione che prende un vettore di lettere e le codifica in
% indici alfabetici aggiungendo uno shift passato
% ARGS:     wordVect: vettore lunghezza n (string/cell), shiftVect: vettore
%           numerico lunghezza n (shiftforward per l'i-esimo indice),
%           alphabet: vettore
% RETURNS:  alphaVect: vettore numerico lungehzza n (frase codificata)
% PARTICOLARI:  Queste funzioni hanno il secondo argomento di default a 0
%               per poterle testarle
function alphaVect = stringVectToAlphaVect(wordVect,alphabet, shiftVect)
    if nargin < 3 %Se ci sono meno di due input, casta il secondo a 0. P
        shiftVect = zeros(length(wordVect),1)';
    end
    %Inizializzo alla stessa lunghezza per gestire la memoria
    alphaVect = zeros(length(wordVect),1)'; 
    %Porto tutto in lowercase
    wordVect = lower(wordVect);
    %Tengo un index poichè matlab di default itera con un "of"
    index = 1; %Parte da 1 poichè matlab...
    for i = wordVect %Serve il for perchè find opera su un solo elemento
        %Cerco l'indice della lettera/numero in strVect
        baseAlphIndex = find(alphabet == i);
        shiftAlphIndex = mod(baseAlphIndex + shiftVect(index), length(alphabet)); % Uso il modulo per impedire una facile decodifica usando il numero più alto
        alphaVect(index) = shiftAlphIndex; % Pongo nella posizione index l'indice alfabetico "shiftato"
        index = index + 1;
    end
end