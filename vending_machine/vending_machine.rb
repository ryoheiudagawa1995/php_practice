class Drink
  attr_reader :name, :price
  attr_accessor :stock

  def initialize(name, price, stock)
    @name = name
    @price = price
    @stock = stock
  end
end

class VendingMachine
  attr_reader :slot_money, :sales, :drinks
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @slot_money = 0
    @sales = 0
    @drinks = [ Drink.new("cola", 120, 5)]
  end

  def add_drink(name,price,stock)
    choose_drink(name)
    @drink.nil? ?  @drinks << Drink.new(name, price, stock) : @drink.stock += stock
  end

  def add_money(money)
    return false unless MONEY.include?(money)
    @slot_money += money
    puts @slot_money
    available_drinks(@drinks)
    @drinks.map{|drink| drink_information(drink.name) }
  end

  def available_drinks(drinks)
    @drinks.map{|drink| puts "#{drink.name}買えます" if drink.price <= @slot_money && drink.stock > 0 }
  end

  def return_money
    puts "お釣り：#{@slot_money}円"
    @slot_money = 0
  end


  def drink_information(name)
    @drinks.map{|drink|   puts "名前：#{drink.name} 値段：#{drink.price} 在庫：#{drink.stock}" }
  end


  def buy_drink(name)
    choose_drink(name)
    if  @drink.stock > 0  && @slot_money >= @drink.price
      drink.stock -= 1
      @slot_money -= drink.price
      @sales += drink.price
      return_money
    end
  end

  def choose_drink(name)
    @drink = @drinks.find {|drink| drink.name == name}
  end
end
