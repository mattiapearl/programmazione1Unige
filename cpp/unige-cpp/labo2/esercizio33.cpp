#include <iostream>

int main()
{
    std::cout << "@ Questo programma chiede all'utente un numero di popolazione iniziale, un obbiettivo da raggiungere e calcola il numero di anni richiesti affinche ciò avvenga. La legge usata duplica la popolazione ogni anno e la fa calare di un terzo l'anno dopo\n\n";

    int pop_size;
    int pop_obj;

    std::cout << "Inserire la popolazione di partenza: ";
    if (!(std::cin >> pop_size))
    {
        std::cout << "Inserito un numero non valido di persone\n";
        return 1;
    }
    std::cout << "Inserire la popolazione da raggiungere: ";
    // Se il primo elemento è vero, allora il secondo è definito e può essere falso
    if (!(std::cin >> pop_obj) || pop_obj < pop_size)
    {
        std::cout << "Inserito un valore di popolazione obbiettivo non valido (non numerico o minore della popolazione di partenza\n";
        return 1;
    }
    // Uso un ciclo for per avere un indice che incrementa da se, ometto la break-condition
    for (auto i{0};; ++i)
    {
        // Uso i valori di Z2 0 e 1 per evitare if verbosi.
        // pop_size incrementa di 1*pop_size se siamo in anni pari
        pop_size += ((i + 1) % 2) * pop_size;
        // Si riduce di 1*pop_size/3 se siamo in anni dispari
        pop_size += -(i % 2) * (pop_size / 3);
        if (pop_size >= pop_obj)
        {
            std::cout << "Per raggiungere l'obbiettivo la popolazione impiega anni: " << i + 1 << "\n";
            break;
        };
    }
    return 0;
}