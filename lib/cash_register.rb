require 'pry'
class CashRegister
    attr_accessor :total, :item, :price, :quantity
    def initialize(discount=20)
        @total = 0
        @discount = discount
        apply_discount
        @items = []
        @cart = []
    end

    def discount(discount=20)
        # @total !=0 ? (@total * discount.to_f) /100 : discount # If total does not equal zero, take the total, multiply by 20 and divide by 100, otherwise return discount
       @discount = discount # we only want this method to return the discount as a instance variable. We do not need to add it to attr_accessor bc it's it's own method
    end

    def add_item(item, price, quantity=1)
        @total += price * quantity 
        @quantity = quantity
        @price = price
        # We need to add each individual item the number of quantities
        quantity.times do
            @items << item
        end 
    end

    def apply_discount
        if @total == 0
            "There is no discount to apply."
        else 
            amount_to_subtract_from_total = @total * (@discount.to_f/ 100) 
            @total = @total - amount_to_subtract_from_total
            "After the discount, the total comes to $#{@total.to_i}."
        end   
    end

    def items
        @items
    end

    def void_last_transaction
        # subtracts the last item from the total
        # Need to read the current total
        # Subtract recent transaction from total
        # @total = @total - price 

        if @items == 0
            @total = 0.0
        else 
            quantity.times do
            @total = @total - price 
            end
        end
    end

end

# We have a cash register, created by CashRegister

