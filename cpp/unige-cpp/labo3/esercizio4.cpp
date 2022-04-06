//  Programma per la trasformazione in esadecimale di un intero e per l'operazione inversa

#include <iostream>
#include <limits>
#include <cmath>

// La lunghezza viene castata ad int perchè di base è un longint ma suppongo un numero di caratteri minore di 32 bit

int main()
{
    std::cout << "@ Questo programma serve a convertire un numero esadecimale in decimale o fare l'operazione opposta. L'input 3 serve a terminare il codice durante la scelta dell'opzione\n";

    for (;;)
    {
        std::cout << "\n> Inserire una delle istruzioni seguenti \n- 1: Converti un numero esadecimale in un numero intero\n- 2: Converti un numero intero in esadecimale\n- 3: Esci dal programma\nComando: ";
        int directive;
        // La prima condizione esclude le altre, quindi quando vengono valutate le altre directive è obbligatoriamente già definita.
        while (!(std::cin >> directive) && directive != 1 && directive != 2 && directive != 3)
        {
            std::cout << "\nE: Input non valido, riprovare";
            // Pulishi lo stream buffer
            std::cin.clear();
            // Fino a fine linea
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
            // L'ordine di pulizia dell'input stream non conta rispetto al cout, ma logicamente avere questo sotto da idea di avere il "canale di input pronto";
            std::cout << "\n> Inserire una delle istruzioni seguenti \n - 1: Converti un numero esadecimale in un numero intero\n- 2: Converti un numero intero in esadecimale\n- 3: Esci dal programma\nComando: ";
        }
        // Numero che verrà convertito. In string per poterci iterare attraverso
        // return_string è per il x16 dall'intero
        // return_int è per l'intero dal x16
        std::string input, return_string = "";
        long return_int = 0;
        switch (directive)
        {
        case 1:
        {
            std::cout << "\nInserire il numero esadecimale da convertire in intero: ";
            while (!(std::cin >> input))
            {
                std::cout << "\nE: errore nell'inserimento, riprovare";
                std::cin.clear();
                std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
                std::cout << "\nInserire il numero da convertire: ";
            }
            // Converti numero esadecimale in stringa
            for (int i = 0; i < (int)input.length(); i++)
            {
                // Se è un numero, spostalo solo di '0'. Se non è un numero (non è tra 0 e 9) spostalo fino alle lettere maiuscole. Se non è in A-F spostalo fino alle minuscole. Se non è in a-f allora non è niente
                int basis = input[input.length() - 1 - i];
                int n = (basis - '0');
                int ma = (basis - 'A');
                int mi = (basis - 'a');
                int num_logical = (n < 10 && n > -1);
                int maiusc_logical = (ma > -1 && ma < 6);
                int minusc_logical = (mi > -1 && mi < 6);
                // Ogni numero ha 1 aggiunto per annullare il -1 di errore finale
                int j =
                    //è un numero
                    ((n + 1) * num_logical) +
                    //è una maiuscola
                    ((ma + 11) * maiusc_logical) +
                    //è una minuscola
                    ((mi + 11) * minusc_logical)
                    // non è niente
                    - 1;
                if (j == -1)
                {
                    std::cout << "\nE: Inserito un numero non esadecimale\n";
                    std::cin.clear();
                    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
                    // Ricomincia il ciclo -> chiedi le nuove istruzioni
                    break;
                }
                else
                {
                    // Gestisco la posizione in base 16
                    return_int += j * std::pow(16, i);
                }
                if (i == (int)input.length() - 1)
                {
                    std::cout << "\nR: Il numero convertito è: " << return_int << "\n";
                }
            }
            break;
        }
        case 2:
        {
            std::cout << "\nInserire il numero intero da convertire in esadecimale: ";
            while (!(std::cin >> input))
            {
                std::cout << "\nE: errore nell'inserimento, riprovare";
                std::cin.clear();
                std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
                std::cout << "\nInserire il numero da convertire: ";
            }
            // Converti stringa in numero intero
            long str_input_to_int = 0;
            for (int i = 0; i < (int)input.length(); i++)
            {
                int j = input[input.length() - 1 - i] - '0';
                // Se casto una lettera char a int, questa assume il suo valore ASCII con '0' = 0, mi basta calcolare che sia nel range 0-9 . Ref: https://en.cppreference.com/w/cpp/language/ascii
                if (j > 9 || j < 0)
                {
                    std::cout << "\nE: Non inserito un numero intero \n";
                    std::cin.clear();
                    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
                    // Ricomincia il ciclo -> chiedi le nuove istruzioni
                    break;
                }
                str_input_to_int += j * pow(10, i);
                if (i == (int)input.length() - 1)
                {
                    for (; str_input_to_int != 0;)
                    {
                        // La divisione negli interi funziona come divisione euclidea
                        // Riusa la funzione se l'intero non è 0
                        // Aggiunge un numero o una lettera se il numero è tra 10 e 16
                        return_string.insert(0, 1, (str_input_to_int % 16) + '0' * ((str_input_to_int % 16) < 10) + ('A' - 10) * ((str_input_to_int % 16) > 9));
                        // Divisione euclidea
                        str_input_to_int /= 16;
                    }
                    std::cout << "\nR: Il numero convertito è: " << return_string;
                }
            }
            break;
        }
        case 3:
        {
            std::cout << "@@ Terminando il programma\n";
            return 0;
        }
        }
    }
    // Il codice non deve mai arrivare quì
    return 1;
}