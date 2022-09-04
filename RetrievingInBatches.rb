#2.2 Retrieving Multiple Objects in Batches

#We often need to iterate over a large set of records, as when we send a newsletter to a large set of customers, or when we export data.

# find_each

#The find_each method retrieves records in batches and then yields each one to the block. In the following example, find_each retrieves customers in batches of 1000 and yields them to the block one by one:

