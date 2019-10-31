require 'pry'

class CashRegister
attr_accessor :total, :discount, :price, :items, :last_transaction

def initialize(discount = 0) 
    @items = []
    @total = 0 
    @discount = discount
end    

def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times do
        items << title
      end
    self.last_transaction = price * quantity
end
    

def apply_discount
    if @discount == 0 
        p "There is no discount to apply."
    else
    self.total = (total * (100 - self.discount)) / 100
    p "After the discount, the total comes to $#{self.total}."
    end
end

def void_last_transaction
    self.total -= self.last_transaction
end

end
