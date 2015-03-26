class CartItem:
    def __init__(self, name, price):
        self.name = name
        self.price = price


class Cart:
    def __init__(self):
        self.items = []

    def add(self, item):
        self.items.append(item)

    def __iter__(self):
        return self.items.__iter__()



def main():
    cart = Cart()

    cart.add(CartItem('Bread', 2.99))
    cart.add(CartItem('Milk', 4.99))
    cart.add(CartItem('Tesla', 120000))

    total = 0
    for i in cart:
        total += i.price

    print("The total is {0:,} today.".format(total))


main()















