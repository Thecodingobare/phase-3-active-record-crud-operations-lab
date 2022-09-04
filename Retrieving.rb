# Retrieving a Single Object
# find
#Assume we are running this commands in irb

#Find the customer with primary key (id) 10.
customer = Customer.find(10)

# Find the customers with primary keys 1 and 10.
irb> customers = Customer.find([1, 10]) # OR Customer.find(1, 10)

#<Customer id: 1, first_name: "Lifo">, #<Customer id: 10, first_name: "Ryan">]

# 2. take

#The take method retrieves a record without any implicit ordering. For example:

irb> customer = Customer.take

=> #<Customer id: 1, first_name: "Lifo">

#You can pass in a numerical argument to the take method to return up to that number of results. For example

irb> customers = Customer.take(2)
=> [#<Customer id: 1, first_name: "Lifo">, #<Customer id: 220, first_name: "Sara">]


# 3. first

irb> customer = Customer.first
=> #<Customer id: 1, first_name: "Lifo">

irb> customers = Customer.first(3)
=> [#<Customer id: 1, first_name: "Lifo">, #<Customer id: 2, first_name: "Fifo">, #<Customer id: 3, first_name: "Filo">]

#On a collection that is ordered using order, first will return the first record ordered by the specified attribute for order.

irb> customer = Customer.order(:first_name).first
=> #<Customer id: 2, first_name: "Fifo">

# 4. last works the same way as first in terms of its commands

# 4. find_by

#The find_by method finds the first record matching some conditions. For example:

irb> Customer.find_by first_name: 'Lifo'
=> #<Customer id: 1, first_name: "Lifo">

irb> Customer.find_by first_name: 'Jon'
=> nil

# Same as writing

irb> Customer.where(first_name: "Lifo").take


