% Sistema di encrypting decrypting da utilizzare in coppia con un altro
% utente

%%% Comportamenti particolari:  Matlab non tiene in memoria i numeri grandi 
%%%                             quando calcolati, il che rende impossibile
%%%                             (senza sviluppare qualche algoritmo di
%%%                             elevazione a potenza alquanto complicato)
%%%                             computare il modulo di potenze "grandi",
%%%                             quindi se si utilizzano primi tropo elevati
%%%                             c'è il rischio che il tutto non funzioni.

%%%                             Utilizzare 13 e 2


% Usato per cryptare e decryptare
alphabet = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"," "];

% Si scelgano pubblicamente un numero primo p (Come 97, 101, 1999, 2003, 2011 ... -
% ce ne sono tanti) e un numero a loro coprimo g ( 2, 3, 5 etc. Un generatore
% del gruppo moltiplicativo Zp, quindi un qualsiasi numero minore di p e
% maggiore di 1)

% Scelti arbitrariamente 
goOn = true; % Condizione di uscita
fprintf("!!!!!\n! DISCLAIMER\n! Inserire primi grandi e generatori superiori al 2 'rompe' l'algoritmo di approssimazione di matlab, quindi utilizzare 13 come base e 2 come generatore\n!!!!!\n\n");

while(goOn) % Ciclo infinito
    p = input("> Inserire base prima comune (13 se non si conoscono generatori di altri) (-1 per uscire): "); % Input checking

    if (isreal(p) && rem(p,1) == 0 && p>0 && isprime(p))
        while(true)
            g = input("> Inserire generatore comune (cercare su internet o 2 se usato 13) (-1 per uscire): ");
            if(isreal(g) && rem(g,1) == 0 && g>1 && g<p) 
                %Ora abbiamo sia un p che un g validi
                %Facciamo inserire il segreto all'utente
                while(true)
                    a = mod(input("> Inserire SEGRETO (numero intero > 1) (-1 per uscire): "),p); % Quì la magnitudine non ci interessa in quanto il periodo di g è proprio p, quindi g^n = g^(p+n)
                    if(isreal(a) && rem(a,1) == 0 && a>1)
                        %%%%%%%%%%%%%
                        % ALGORITMO %
                        %%%%%%%%%%%%%
                        % Calcola chiave pubblica da passare
                        k = mod((g^a), p); %Resto della divisione tra gen^segreto e base
                        fprintf("\n!!!!\n! Chiave pubblica generata: %d\n!\n! Condividila con il tuo interlocutore \n!!!!\n", k);
                        oK = input("> Inserire chiave pubblica interlocutore: "); %oK sta per outsideKey
                        % Crea la chiave condivisa
                        sK = mod((oK^a), p); %Ora, è la stessa da entrambe le parti
                        % disp(sK) %debug
                        disp(">> Connessione stabilita, chiave condivisa generata")
                        % Chiedi come input il vettore:
                        %%! NON FACCIO INPUT CHECKING DA QUI IN AVANTI
                        while(true)
                            decrIn = input("> Cryptare o deCryptare? (C/D) (Q per uscire): ", "s"); % Se non C decrypto
                            if(lower(decrIn) == "c") %
                                vect = input("> Inserire stringa da cryptare: ","s"); 
                                %Tramuto in celle. Non rimuovo gli spazi
                                %perchè sembra che matlab li "tolleri"
                                vect = num2cell(vect);
                                shiftVect = shiftVectGen(vect,sK); % Genera vettore per CCodex
                                out = strjoin(string(stringVectToAlphaVect(vect,alphabet,shiftVect)),"-");
                                disp("OUT>>> Versione codificata: ");
                                disp(out);
                            elseif(lower(decrIn)=="d")
                                vect = input("> Inserire stringa da decryptare: ","s");
                                vect = split(strrep(vect,' ',''),'-'); %Quando encripto tengo i numeri separati con una sbarretta
                                shiftVect = shiftVectGen(vect,sK); % Genera vettore per CCodex
                                out = strjoin(string(alphVectToStringVect(vect,alphabet,shiftVect)),"");
                                disp("OUT>>> Versione decodificata: ");
                                disp(out);
                            else % Di nuovo accetto qualsiasi cosa non sia c o d
                                goOn = false;
                                break %Fine loop interno, ricomincia
                            end
                        end
                        %Prendi la lunghezza del vettore e genera un 
                    elseif(isreal(a) && rem(a,1) == 0 && a<0)
                        goOn = false;
                        break
                    else
                        fprintf("\n!Inserire un numero maggiore di 1 (intero)!\n");
                    end
                    break % Fine del loop interno, ricomincia
                end
                break % Fine del loop interno, ricomincia
            elseif(isreal(g) && rem(g,1) == 0 && g<0)
                goOn = false;
                break
            else
                fprintf("\n!Inserire un numero minore di %d e maggiore di 1 (intero)!\n",p);
            end
        end
    elseif(isreal(p) && rem(p,1) == 0 && p<0)
        goOn = false;
    else
        fprintf("\n!Inserire un numero primo (intero positivo)!\n");
    end
end
disp("- FINE PROGRAMMA -");

% Note sulla sicurezza: Seppure il sistema "a se" presenti un livello di
% sicurezza alquanto elevato, l'associazione con termini dell'alfabeto
% aggiunge una debolezza, facilitando "intelligent guesses" provenienti alla
% frequenze di certe lettere in una lingua e quindi alla rottura della codifica (basata
% inoltre sulla resistenza dello shiftvector del caso)