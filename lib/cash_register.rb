class CashRegister
    attr_accessor :total, :discount, :last_transaction
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = []
    end
    def add_item(item, price, quantity=1)
        if quantity>1
            i=0
            while i<quantity
              @items << item
              i+=1
            end
          else
            @items << item
          end
        @last_transaction << price * quantity
        tot = price * quantity
        @total += tot
    end
    def apply_discount
        if @discount > 0
            @discount = @discount/100.to_f
            @total = @total - (@total * (@discount))
            "After the discount, the total comes to $#{@total.to_i}."
          else
            "There is no discount to apply."
          end
    end
    def items
        @items
    end
    def void_last_transaction 
        self.total = @total - @last_transaction.pop
    end
end
