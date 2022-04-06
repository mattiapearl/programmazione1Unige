//  Programma per la trasformazione in binario di un intero e per l'operazione inversa

#include <iostream>
#include <limits>
#include <cmath>

// La lunghezza viene castata ad int perchè di base è un longint ma suppongo un numero di caratteri minore di 32 bit

int main()
{
    std::cout << "@ Questo programma serve a convertire un numero binario in decimale o fare l'operazione opposta. L'input 3 serve a terminare il codice durante la scelta dell'opzione\n";

    for (;;)
    {
        std::cout << "\n> Inserire una delle istruzioni seguenti \n- 1: Converti un numero binario in un numero intero\n- 2: Converti un numero intero in binario\n- 3: Esci dal programma\nComando: ";
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
            std::cout << "\n> Inserire una delle istruzioni seguenti \n - 1: Converti un numero binario in un numero intero\n- 2: Converti un numero intero in binario\n- 3: Esci dal programma\nComando: ";
        }
        // Numero che verrà convertito. In string per poterci iterare attraverso
        // return_string è per il 01 dall'intero - serve poichè si eccede rapidamente il formato supportato
        // return_int è per l'intero dal 01s
        std::string input, return_string = "";
        long return_int = 0;
        switch (directive)
        {
        case 1:
        {
            std::cout << "\nInserire il numero binario da convertire in intero: ";
            while (!(std::cin >> input))
            {
                std::cout << "\nE: errore nell'inserimento, riprovare";
                std::cin.clear();
                std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
                std::cout << "\nInserire il numero da convertire: ";
            }
            // Converti numero binario in stringa
            for (int i = 0; i < (int)input.length(); i++)
            {
                int j = input[input.length() - 1 - i] - '0';
                if (j != 0 && j != 1)
                {
                    std::cout << "\nE: Inserito un numero non binario\n";
                    std::cin.clear();
                    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
                    // Ricomincia il ciclo -> chiedi le nuove istruzioni
                    break;
                }
                else
                {
                    // J è 0 o 1
                    return_int += j * std::pow(2, i);
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
            std::cout << "\nInserire il numero intero da convertire in binario: ";
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
                        return_string.insert(0, 1, (str_input_to_int % 2) + '0');
                        // Divisione euclidea
                        str_input_to_int /= 2;
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