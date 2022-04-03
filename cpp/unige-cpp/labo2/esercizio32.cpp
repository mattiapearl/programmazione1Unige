#include <iostream>
// Per pulire efficientemente il cin
#include <limits>

int main()
{
    std::cout << "@ Questo programma fa inserire un numero di numeri reali all'utente e restituisce la somma dei positivi, dei negativi e il prodotto tra tutti quando viene inserito un input non reale (come una lettera)\n\n";
    double pos_sum{0};
    double neg_sum{0};
    double product{1};
    // Loop indefinito fino a termine degli input reali
    while (1)
    {
        double input;
        std::cout << "> Inserire il prossimo numero (o un non reale per fermarsi): ";
        if (!(std::cin >> input))
        {
            std::cout << "\n! Terminato il programma";

            std::cout << "\n I risultati sono:";
            std::cout << "\n- Somma numeri positivi: " << pos_sum;
            std::cout << "\n- Somma numeri negativi: " << neg_sum;
            std::cout << "\n- Prodotto di tutti i numeri: " << product << "\n";
            return 0;
        };
        // Aggiungi un valore al prodotto
        product *= input;
        pos_sum += (input > 0) * input;
        neg_sum += (input < 0) * input;
        // Pulishi lo stream buffer
        std::cin.clear();
        // Fino a fine linea
        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    };
    // Se arriva quì sotto qualcosa si è rotto
    return 1;
}