require('pry-byebug')
require('pg')

class Pizza

  attr_reader(:id, :first_name, :last_name, :topping, :quantity)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @topping = options['topping']
    @quantity = options['quantity'].to_i
  end

  def save
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost' })
    sql = "INSERT INTO pizzas (
          first_name,
          last_name,
          topping,
          quantity) VALUES(
          '#{ @first_name }',
          '#{ @last_name }',
          '#{ @topping }',
          '#{ @quantity }'
          )"
    db.exec(sql)
    db.close
  end

  def self.all()
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost' })
    sql = "SELECT * FROM pizzas"
    pizzas = db.exec(sql)
    db.close
    return pizzas.map {|pizza| Pizza.new(pizza)}
  end

  def self.update(area_to_update, update, search_area, name)
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost' })
    sql = "UPDATE pizzas SET 
          #{area_to_update} = '#{update}' WHERE #{search_area} = '#{name}'"
    db.exec(sql)
    db.close
  end

  #try these with just passing in id

  def self.update_all(area_to_update, update)
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost' })
    sql = "UPDATE pizzas SET 
          #{area_to_update} = '#{update}'"
    db.exec(sql)
    db.close
  end

  def self.delete(search_area, name)
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost' })
    sql = "DELETE FROM pizzas WHERE #{search_area} = '#{name}'"
    db.exec(sql)
    db.close
  end

end

pizza1 = Pizza.new({'first_name' => 'Luke', 'last_name' => 'Skywalker', 'topping' => 'Calzone', 'quantity' => '4'})

pizza2 = Pizza.new({'first_name' => 'Darth', 'last_name' => 'Vader', 'topping' => 'Calzone', 'quantity' => '2'})

# pizza1.save()
# pizza2.save()
binding.pry
nil