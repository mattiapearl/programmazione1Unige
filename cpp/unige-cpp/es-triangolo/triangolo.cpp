#include <iostream>
#include <cmath>
#include <limits>

using namespace std;

struct Triangolo
{
    double lati[3];
};

// Sorting Carino, ma inutile

void __ordina_triangolo(Triangolo &t)
{
    // Posiziono in ordine decrescente la misura dei lati

    // Alla prima iterazione nel peggiore dei casi sposto l'ultimo elemento alla seconda posizione
    // Alla seconda iterazione sono nel caso favorevole in cui nel caso peggiore ho mm-M-m, che quindi diventa M-mm-m e poi M-m-mm, che è la corretta posizione
    for (auto j = 0; j != 2; ++j)
    {
        for (auto i = 0; i != 2; ++i)
        {
            if (t.lati[i] < t.lati[i + 1])
            {
                auto temp = t.lati[i];
                t.lati[i] = t.lati[i + 1];
                t.lati[i + 1] = temp;
            }
        }
    }
}

bool valida_triangolo(const Triangolo &t)
{
    for (auto i = 0; i != 2; i++)
    {
        auto &altroLato1 = t.lati[(i + 1) % 2];
        auto &altroLato2 = t.lati[(i + 2) % 2];

        if (t.lati[i] > altroLato1 + altroLato2 || t.lati[i] < abs(altroLato1 - altroLato2))
        {
            return false;
        };
    }
    return true;
}

double perimetro_triangolo(Triangolo t)
{
    double perimetro = 0;
    // Calcola perimetro

    for (auto l : t.lati)
    {
        perimetro += l;
    }
    return perimetro;
};

double area_triangolo(double per, Triangolo t)
{
    double area{per / 2};
    for (auto l : t.lati)
    {
        double semiProd{(per / 2) - l};
        area *= semiProd;
    }
    return sqrt(area);
}

int main()
{
    cout << "\nProgramma per calcolare area e perimetro di un triangolo\n";
    Triangolo t;
    for (;;)
    {
        for (auto i = 0; i != 3; i++)
        {
            cout << "\nInserire il " << i + 1 << "° lato del triangolo (reale positivo): ";
            for (;;)
            {
                if (cin >> t.lati[i] && t.lati[i] > 0)
                {
                    break;
                }
                else
                {
                    cout << "\nPerfavore, inserire un numero reale positivo: ";
                    cin.clear();
                    cin.ignore(numeric_limits<streamsize>::max(), '\n');
                }
            }
        }
        if (valida_triangolo(t))
        {
            break;
        }
        else
        {
            cout << "\n--- I lati passati non sono lati di un triangolo, riprovare ---";
        }
    }
    auto perimetro = perimetro_triangolo(t);
    cout << "\nIl perimetro del triangolo è: " << perimetro;
    cout << "\nL'area del triangolo è " << area_triangolo(perimetro, t) << "\n";
    return 0;
}