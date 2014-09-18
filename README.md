#Vending Machine

A test-driven excercise to design a vending machine in Ruby.

##The Task

Design a vending machine in code. The vending machine, once a product is selected and the appropriate amount of money is inserted, should return that product. It should also return change if too much money is provided or ask for more money if there is not enough. The machine should take an initial load of products and change with denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2. There should also be a way of reloading both products and change at a later point. The machine needs to keep track of the products and money that it contains.

##Technologies

* Ruby
* RSpec

##How To Run

```
git clone https://github.com/jpatel531/vending-machine
cd vending-machine
irb
```
```ruby
require './lib/vending_machine'
```

The customer is initialized with money, in the form `{denomination_in_pence: frequency}`. The vending machine is initialized with an array of products and money in the aforementioned form. Products are initialized with a name and a price in pence.

```ruby
customer = Customer.new({200 => 1, 100 => 1})
customer.wallet

vending_machine = VendingMachine.new [Product.new("Crisps", 250)], {50 => 1}

customer.buy product: "Crisps", at: vending_machine, with: customer.wallet

#=> You have inserted £3.00
#=> Your change is £0.50
```

The customer's 'satchel' now has the product:

```ruby
customer.satchel
#=> [#<Product:0x007fad75c5bf28 @name="Crisps", @price=250>] 
```

The vending machine should have £2, £1 and no longer have 50p. Meanwhile, the customer should have the 50p and nothing else:

```ruby
vending_machine.total_money
#=> {50=>0, 200=>1, 100=>1} 

customer.wallet
#=> {50=>1, 200=> 0, 100=> 0}

```

And its list of products should be empty:

```ruby
vending_machine.products
#=> []
```

When insufficient money is paid, the vending machine prints to the console: `You have not inserted enough money`.

When the vending machine's products and change are empty, a maintenance man is in charge of replenishing them.

```ruby
maintenance_man = MaintenanceMan.new vending_machine
maintenance_man.stock_vending_machine [Product.new("Chocolate", 50), Product.new("Water", 100)]

vending_machine.products
#=> [#<Product:0x007f993ac8f020 @name="Chocolate", @price=50>, #<Product:0x007f993ac8ef80 @name="Water", @price=100>]

maintenance_man.refill_coin_box {1 => 1, 2 => 1}
vending_machine.total_money
#=> {1 => 1, 2 => 1, 50=>0, 200=>1, 100=>1} 
```

##Architecture Decisions and Limitations

* In order to make the code more manageable and to separate concerns, I decided to create modules separating out the different parts and functionalities of the vending machine. For instance, the modules making up the class are: ChangeDispenser, ProductDispenser, CoinSlot, Calculator.
* The Customer and VendingMachine classes share the Transaction module, in order to dry up repeated methods where money has to be added or subtracted.
* Exchanging money as hashes of denominations/frequency can be fairly unwieldy and do not aid readability. I took this decision as, initially, I believed it would make the rendering of change more straightforward and, to some extent, more realistic, as customers pay in change and vending machines return change.
* The VendingMachine class does perhaps too much. If I could redo the task, I would maybe add a Transaction class to separate out some of its functionality.

##How To Run Tests

```
rspec 
```



