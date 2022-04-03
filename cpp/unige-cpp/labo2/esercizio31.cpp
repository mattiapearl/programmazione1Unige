#include <iostream>

int main()
{
    std::cout << "@ Questo programma chiede un numero di input, quindi fa inserire un numero di numeri reali all'utente e restituisce la somma dei positivi, dei negativi e il prodotto tra tutti\n\n";
    // Dichiara
    int sz;
    std::cout << "Inserire il numero di numeri da prendere come input: ";
    // Se l'input non rispetta il typing di sz allora termina il programma
    if (!(std::cin >> sz))
    {
        std::cout << "\n--Inserito numero non naturale positivo--\n";
        return 1;
    };
    double pos_sum{0};
    double neg_sum{0};
    double product{1};
    for (auto i{0}; i != sz; i++)
    {
        double input;
        std::cout << "> Inserire il " << i + 1 << "° numero: ";
        if (!(std::cin >> input))
        {
            std::cout << "\n! Inserire un numero reale";
            return 1;
        };
        // Aggiungi un valore al prodotto
        product *= input;
        pos_sum += (input > 0) * input;
        neg_sum += (input < 0) * input;
        //
    }
    std::cout << "\n I risultati sono:";
    std::cout << "\n- Somma numeri positivi: " << pos_sum;
    std::cout << "\n- Somma numeri negativi: " << neg_sum;
    std::cout << "\n- Prodotto di tutti i numeri: " << product << "\n";
}