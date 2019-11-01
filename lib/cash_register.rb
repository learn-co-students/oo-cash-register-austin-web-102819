

require "pry"

class CashRegister


    attr_accessor :discount , :total , :items , :last_transaction 
# "optionally takes a discount" so TAKES means it will be an
#argument, and OPTIONALLY means the variable will be optional
# we need to set it to 0 to start with
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items  = []
      
    end


    def add_item (title , price, quantity=1)
        
        self.total += price * quantity 
        quantity.times do
        @items << title
        end
     self.last_transaction = price * quantity   
    end


    def apply_discount
 if @discount > 0   
 self.total = (total * (100- self.discount)) / 100   
 "After the discount, the total comes to $#{total}." 
 else 
    "There is no discount to apply."
 end
    end


def items 
   @items

end

def void_last_transaction
    self.total = self.total - self.last_transaction
end




  
    

end