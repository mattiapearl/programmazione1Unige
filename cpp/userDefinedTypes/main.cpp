#include <iostream>

using namespace std;

class Vector
{
public:
    Vector(int s) : elem{new double[s]}, sz{s} {}
    double &operator[](int i) { return elem[i]; }
    int size() { return sz; }

private:
    double *elem;
    int sz;
};

double read_and_sum(int s)
{
    Vector v(s);
    cout << "Creando vettore di " << s << " elementi\n";
    for (int i = 0; i != s; ++i)
    {
        cout << "\nInserisci il " << i + 1 << "° valore: ";
        cin >> v[i];
    }

    double sum = 0;
    for (int i = 0; i != v.size(); ++i)
    {
        sum += v[i];
    }
    return sum;
}

int main()
{
    int s;
    cout << "Scegli la lunghezza del vettore: ";
    cin >> s;
    cout << endl;
    double somma = read_and_sum(s);
    cout << "\n>> La somma è: " << somma << "\n";
    return 0;
}