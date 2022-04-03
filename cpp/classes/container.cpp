import<iostream>

    class Container
{
public:
    virtual double &operator[](int) = 0;
    virtual int size() const = 0;
    virtual ~Container() {}
};

void use(Container &c)
{
    const int sz = c.size();

    for (int i = 0; i != sz; ++i)
    {
        std::cout << c[i] << "\n";
    }
};

class Vector_container : public Container
{
public:
    Vector_container(int s) : v(s) {}
    ~Vector_container() {}
    // Override is optional, but it clearly shows the intent of overriding the pre-defined superclass functions of Container
    // Also for the container: you can't override if the basic function doesn't exist (so you will catch spelling errors)
    double &operator[](int i) override { return v[i] }
    int size() const override { return v.size() }

private:
    Vector v;
}
