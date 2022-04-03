#include <string>
#include <variant>

using namespace std;

enum class Field // Underlying type: int
{
    Q,
    R,
    C,
    Z2,
    Z3,
    Z5,
    Z7,
    Z11
};

Field &operator++(Field&f){
    switch (f)
    {
    case Field::Q:
        return f = Field::R;
    case Field::Q:
        return f = Field::R;
    case Field::Q:
        return f = Field::R;
    case Field::R:
        return f = Field::C;

    default:
        break;
    }
}

struct matrix
{
    int n_rows;
    int n_columns;
    Field f;
    int field_molteplicity;
    bool by_rows;

};