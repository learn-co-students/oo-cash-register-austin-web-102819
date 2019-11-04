class CashRegister
    attr_accessor :discount, :total, :items

    def initialize(discount = 0.0)
        @discount = discount.to_f
        @total = 0.0
        @items = []
        @last_item_price = 0
    end

    def add_item(title, price, quantity = 1)
        quantity.times do    
            @items.push(title)
        end
        @last_item_price = price * quantity
        @total += price * quantity
    end

    def apply_discount
        if @discount > 0
            @total = @total - @total * (@discount / 100)
            "After the discount, the total comes to $#{@total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total = @total - @last_item_price
    end
end

