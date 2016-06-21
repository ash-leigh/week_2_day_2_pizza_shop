require('minitest/autorun')
require_relative('../models/sales')

class TestSales < Minitest::Test

  def setup
    pizza1 = Pizza.new({"first_name" => "Val", "last_name" => "Gibson", "topping" => "Calzone", "quantity" => "4"})
    pizza2 = Pizza.new({"first_name" => "Jay", "last_name" => "Chetty", "topping" => "Calzone", "quantity" => "2"})

    @sales = Sales.new([pizza1, pizza2])
  end

  def test_total_revenue
    result = @sales.total_revenue()
    assert_equal(60, result)
  end

  def test_number_of_pizza_by_topping
    result = @sales.total_sales_by_topping('Calzone')
    assert_equal(2, result)
  end




end