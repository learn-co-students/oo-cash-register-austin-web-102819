require 'pry'
class CashRegister
    attr_accessor :total, :items, :cart
    attr_reader 

    @last_item_price = 0
    @qty = 0

    def initialize(discount=20)
        @total = 0
        @discount = discount
        apply_discount
        @items = []
        @cart = []
    end

    def discount=(discount=20)
        @discount = discount
    end

    def discount
        @discount
    end

    def add_item(title, price, qty=1)
        @total += (price * qty)
        @last_item_price = price
        @qty = qty

        qty.times do
            @items << title
        end

        
    end

    def apply_discount
        @total = @total - ((@discount.to_f / 100) * @total)
        @total == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{@total.to_i}."
    end

    def void_last_transaction

        @qty.times do
            @items.shift
        end

        if @items.empty? then
            @total = 0.0 
        else
            @total = @total - (@last_item_price * @qty) 
        end
    end
end
