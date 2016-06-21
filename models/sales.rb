require_relative('pizza')

class Sales

  def initialize(pizzas)
    @pizzas = pizzas
  end

  def total_revenue
    total = 0
    @pizzas.each { |pizza| total += (pizza.quantity * 10)}
    return total
  end

  def total_sales_by_topping(topping)
    pizza_type = @pizzas.select {|pizza| pizza.topping == topping}
    pizza = pizza_type.map {|pizza| pizza}
    return pizza.count
  end

end
