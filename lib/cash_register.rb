class CashRegister

    def initialize(discount = 0)
        @total = 0
        @discount = discount
    end

    def discount
        @discount
    end

    def apply_discount
        @total *= 1 - (@discount.to_f/100)
        puts @discount.to_f
        @discount == 0? "There is no discount to apply." : "After the discount, the total comes to $#{@total.to_i}."
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        @items ||=[]
        quantity.times do
            @items << [title, price, quantity]
        end
    end

    def total
        @total
    end

    def total=(total)
        @total = total
    end

    def items
        @items.map{|item| item[0]}
    end

    def void_last_transaction
        @total -= @items[-1][1] * @items[-1][2]
    end

end