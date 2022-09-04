# 3. Conditions

#The where method allows you to specify conditions to limit the records returned, representing the WHERE-part of the SQL statement. Conditions can either be specified as a string, array, or hash.

# 3.1 Pure String Conditions

#If you'd like to add conditions to your find, you could just specify them in there, just like Book.where("title = 'Introduction to Algorithms'"). This will find all books where the title field value is 'Introduction to Algorithms'.

#Building your own conditions as pure strings can leave you vulnerable to SQL injection exploits. For example, Book.where("title LIKE '%#{params[:title]}%'") is not safe. See the next section for the preferred way to handle conditions using an array.


# 3.2 Array Conditions

Show.where("title = ?","pass the name of the title")
[#<Show:0x00005620fbccc848
id: 3,
name: "Anabellua2",
network: "Networkua2",
day: "Thursday2",
rating: 9,
season: "Season 2">]

#Specifying multiple conditions
Show.where("name = ? AND out_of_print = ?", "pass the name of the title", false)

#In this example, the first question mark will be replaced with the value in params[:title] and the second will be replaced with the SQL representation of false, which depends on the adapter.


#3.2.1 Placeholder Conditions

#Similar to the (?) replacement style of params, you can also specify keys in your conditions string along with a corresponding keys/values hash:


#3.2.2 Conditions That Use LIKE

Show.where("name = ? LIKE","A" + "%")

# In the above code, the intent is to match titles that start with a user-specified string. However, any occurrences of % or _ in params[:title] will be treated as wildcards, leading to surprising query results. In some circumstances, this may also prevent the database from using an intended index, leading to a much slower query.

# To avoid these problems, use sanitize_sql_like to escape wildcard characters in the relevant portion of the argument:

Show.where("name LIKE ?",
    Show.sanitize_sql_like("Ana") + "%")

=begin

[#<Show:0x00005572aadacb78
  id: 1,
  name: "Anabellua",
  network: "Networkua",
  day: "Thursday",
  rating: 8,
  season: "Season 1">,

 #<Show:0x00005572aadaca88
  id: 2,
  name: "Anabelly",
  network: "Networkua1",
  day: "Thursday1",
  rating: 8,
  season: "Season 1.1">,

 #<Show:0x00005572aadac998
  id: 3,
  name: "Anabellua2",
  network: "Networkua2",
  day: "Thursday2",
  rating: 9,
  season: "Season 2">]


=end


#  3.3 Hash Conditions

# Active Record also allows you to pass in hash conditions which can increase the readability of your conditions syntax. With hash conditions, you pass in a hash with keys of the fields you want qualified and the values of how you want to qualify them:

# Only equality, range, and subset checking are possible with Hash conditions.

# 3.3.1 Equality Conditions

Book.where(out_of_print: true)

#same

Book.where('out_of_print' => true)




    