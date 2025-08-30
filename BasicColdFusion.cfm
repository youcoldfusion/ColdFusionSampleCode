ColdFusion is a commercial server-side scripting language primarily found on NT platforms,  
and it’s known for its ease of use and learning compared to other languages like PHP and ASP. 
However, unlike PHP and ASP, ColdFusion is not free which may limit its growth.
ColdFusion can be used to access databases for websites, enhancing the ability to add and remove content. 
It allows for the creation of a single webpage to view all articles or content, 
by passing a variable in the link, such as ID=2, which tells the database to serve the corresponding article or content.
ColdFusion uses a tag-based language, similar to HTML, which makes it easy to learn and use.
It also supports a wide range of databases, including MySQL, Oracle, and SQL Server, 
and simplifies the process of connecting web pages to a database.
The tutorial provides a step-by-step guide on how to create a 
fully database integrated ColdFusion website, including setting up a database,
constructing and using basic SQL statements, creating a webpage, and working with ColdFusion Query and CFOUTPUT tags.
Introduction:
The time will eventually come when you need to work with a database for a website. 
Using a database greatly enhances your ability to add and remove content, and all in all it requires less work to set up.
Take this website for example. With its many articles without the use of a database a separate web page would have to be made for
each and every article. Sure you could automate things with SSI but you would still have to make a separate page for each article.
With a database this is different, you can simply make a single page to view all of your articles. 
You simply pass a variable in the link such as ID=2 and that tells the database to serve article number 2. 
How to do this will be explained in this article.
There are 3 main programming languages used to access databases. 
PHP, which is normally found on unix/linux platforms, ASP, which is a creation of Microsoft and is found mostly on NT platforms,
and ColdFusion(CF), which is found mostly on NT platforms as well.
This article will show you how to use ColdFusion to access a database from a website and use it to display information.
About ColdFusion
ColdFusion was created as a commercial product by the Allaire Corporation. 
As a commercial product it has some features different from other Server Side Scripting Languages. 
The first major difference is that ColdFusion scripts do not have to display their source code like every other scripting language,
it is possible to run encrypted versions of the scripts. This allows for individuals to sell their own scripts without fear of piracy, 
however it has the side effect of stemming the flow of free open source CF scripts for use by the learning webmaster. 
The second major difference is that ColdFusion costs money. A server side scripting language works with an interpreter. 
Depending on the extension of the filename to be served, .php .asp or .cfm, 
the server will first send the file to an interpreter which is what dynamically generates your page.
So to use these languages you need to install them on your server. PHP is free, ASP is free,
but CF costs money, and that may be the reason why it is growing only slowly.
However most NT hosting packages do already include ColdFusion so for the person who
does not own their own server this pricing difference will not have much affect.

As to the language itself, I have worked with both ASP and PHP before and it is my opinion that ColdFusion is the easiest to learn and use.

About Databases
The database is the backend of any CF website. For the purposes of this tutorial we will be using Microsoft Access.
Microsoft Access is a relational database which means you can relate the tables to one another. 
Now this article assumes you know how to work a database and are familiar with basic terms such as Field, Row, and Table.

When accessing a relational database from a website regardless if its Oracle, Microsoft, or MySQL, 
and regardless if you’re using CF, PHP, or ASP, you will use a language called SQL. 
SQL is the bridge between the frontend of your website and the backend. 
In this article you will be shown how to construct and use basic SQL statements 
which can be applied to any server side scripting language, not only CF.
To let CF access a database you will need to set up a DSN on the server.
To do this first upload the database file and then tell your server administrator 
you need a DSN set up with XXXX name using Microsoft Access Drivers, and tell them the location of the database file.

Basic ColdFusion
For starters name all of your CF files with a .cfm extension.
ColdFusion is a lot like HTML in that it uses tags to define many functions, this may make it easier to learn.
Look at the following Example:

Figure 1. Form.html
<form method = "post" action = "name.cfm">
<input type = "text" size = "20" name = "name">
<input type = "submit" value = "Submit">
</form>

Figure 2. Name.cfm
<CFOUTPUT>
Hello, #name#, Welcome to my website!
</CFOUTPUT>
Now lets examine it. In name.cfm the first tag you see is a <CFOUTPUT> tag. 
This tag can be put anywhere in a webpage, it can be put in the middle of an HTML tag it does not matter,
what this does if tell the CF interpreter that you are going to display a variable. 
The variable itself is enclosed in #’s which is how CF marks its variables.
This causes a problem in some instances when you use #’s on your website, such as when declaring colors. 
This is very simple to fix, you can simply move the <CFOUTPUT> tags directly to the sides of the variable as in the following example.

Figure 3. Name.cfm
Hello, <CFOUTPUT> #name#</CFOUTPUT>, Welcome to my website!

Or you can simply put a double ## when you need to use a pound sign for another purpose. 
Finally we see the </CFOUTPUT> tag, and just like HTML you need an end tag for most CF tags.

Basic SQL
Now that you know some basic CF you need to learn some basic SQL.
SQL is a very straightforward language. Look at the following statement:

Figure 4. Basic SQL
SELECT Name Height Weight Sex
FROM Friends

Now lets examine it.
Suppose you had a database of all your friends, 
you would name the table Friends and name the form fields Name, 
Height, Weight, and Sex. What this SQL statement would do is return a list of 
your friends, along with their Height, Weight, and Sex. Now look at the next statement:

Figure 5. Where Statement
SELECT Name Height Weight
FROM Friends
WHERE Sex LIKE 'Male'

Now lets examine it. What this statement would do is return all your male friends.
Notice the line beginning with WHERE, 
this is referred to as the criteria expression.
The word LIKE is a search clause. See Table 1 for other search clauses.

Table 1. Search Clauses
= Equal to LastName = ‘Smith’
<> Not Equal to FirstName
<> ‘Kim'< Less Than Age < ’20’
<= Less Than or Equal to Age <= ’20’
> Greater than Age > ’20’
>= Greater Than or Equal to Age >= ’20’
Between Tests inclusiveness Age between ’20’ and ’30’
Exists Test for Existence FavMovie Exists
In Tests for list of values LastName IN (‘Smith’, ‘Jones’)
Is Null Tests for Null Value FavMovie IS NULL
Is Not Null Tests for value FavMovie IS NOT NULL
Like Tests for pattern FavMovie like “Braveheart”

In addition you can include a wildcard for these criteria expressions. 
For instance if you wanted all of your friends who had a name that began with an “A” you would use the following example:

Figure 6. Wildcard
SELECT FirstName, LastName
FROM Friends
WHERE FirstName LIKE 'A%'

Basic Database Setup
When creating your Database there are some things you should know. 
First of all never include a space in your field names. 
This will cause problems later. Second never name a field name using a reserved keyword 
such as ‘text’ or ‘date’ this will also cause problems. 
Finally you must correctly specify the field datatype.
What follows is a list of datatypes and what is commonly used to input into them.

Table 2. Datatypes
Text 255 Character Limit – Radio, Select, Text, Password
Number Number Only – Radio, Select, Text, Password
Date/Time Date or Time(mm/dd/yy) – Radio, Select, Text
Yes/No True or False Value – Checkbox
AutoNumber Automatically Numbers Rows – None
Currency Formats for Currency – Radio, Select, Text
Memo Text without limit – Textarea

There are some notes on the above table. 
First of all The autonumber datatype is perfect for numbering articles. Everytime a 
new article is added it will simply generate an ID for it which can be used for a
variety of purposes since each article will have a unique ID. 
The second note is that the memo datatype does have a limit, however it is so large you will likely never reach it.

ColdFusion Database Integration
Now that you know the basics of what you need to create a database integrated website it is time to put everything together.
Create a Database named Friends, and a table within it named Friends. Create the following Fields and Datatypes:

FirstName – Text
LastName – Text
Age – Number
FriendID – AutoNumber
Sex – Text
FavMovie – Text
FavColor – Text
Car – Text
Comments – Memo

Learn to Code with JavaScript
Then fill in the appropriate values for a number of people. 
Upload it to your server and tell your Server Admin to create a DSN named “Friends” for it using Microsoft Access Drivers.

Now we have the database, lets make a website for it. First lets make a page that lets people search the database.

Figure 7. Search.htm
<form method = "post" action = "results.cfm">
<h1>Search For Friends</h1>
<select name = "Sex">
<option value = "male">Male
<option value = "female">Female
</select>
<input type = "Submit" value = "Submit">
</form>

We have our simple search page, now we need the results page:

Figure 8. Results.cfm
<CFQUERY DATASOURCE = "Friends" NAME = "MAIN">
SELECT FirstName, LastName, Age, FriendID
FROM Friends
Where Sex LIKE '#sex#'
</CFQUERY>
<div align = “center”>
<b>You Found the Following Friends</b><br>
<table border = “1”>
<tr>
<td>
First Name
</td>
<td>
Last Name
</td>
<td>
Age
</td>
<td>
More Info
</td>
</tr>

<CFOUTPUT QUERY = “MAIN”>

<tr>
<td>
#FirstName#
</td>
<td>
#LastName#
</td>
<td>
#Age#
</td>
<td>
<a href = “info.cfm?ID=#FriendID#>Click Here!</a>
</td>
</tr>

</CFOUTPUT>
</table>
</div>

Now lets examine the above. As you can see to perform a ColdFusion Query you just 
fill in the CFQUERY tags with your SQL statement and you’re good to go. 
Any part of the SQL statement can be substituted with a variable passed
from a previous page as I did with the sex variable. 
Then notice the CFOUTPUT tags have a query argument, 
this tells it that it is drawing info from a query and also sometimes you will use multiple queries on one page,
this tells it which query to use.

Then you’ll notice I only had to include one table row between the CFOUTPUT tags,
this is because ColdFusion will duplicate whatever is in the
CFOUTPUT tags once for every row returned by the query.
Finally notice what is in the More Info column. 
This is a link to another page that also passes the FriendID as an argument. Lets take a look at that page now.

Figure 9. info.cfm
<CFQUERY DATASOURCE = "Friends" NAME = "INFO">
SELECT *
FROM Friends
WHERE FriendID = '#ID#'
</CFQUERY>
<div align = “center”>
<CFOUTPUT QUERY = “INFO”>
<h1>Friend Info For #FirstName# #LastName#</h1>
<P>
<b>Sex: #sex#</b><br>
<b>Age: #age#</b><br>
<b>Favorite Movie: #FavMovie#</b><br>
<b>Favorite Color: #FavColor#</b><br>
<b>Car: #car#</b><br>
Comments:<br>

#ParagraphFormat(Comments)#
</cfoutput>
</div>

Now lets examine the above. In the Select statement 
I use an * because I want to select all of the fields.
Then in the where statement I am using the ID variable I passed in the URL.
This time for the output I do not put it in a table since each ID is unique and I know only one row will be returned. Then I list the variables as before with one exception. For the comment variable I include the ParagraphFormat function. What this function does is recognize the 2 blank lines between paragraphs and inserts a <p> tag there so that it is displayed correctly on the page.

Conclusion
You should now be able to create a fully database integrated ColdFusion website. 
Stay tuned for my next article which will cover advanced intermediate coding techniques and more advanced SQL.

Frequently Asked Questions (FAQs) about ColdFusion
What is the difference between ColdFusion and other programming languages?
ColdFusion, developed by Adobe, is a unique programming language 
that is designed to simplify the connection of HTML pages to a database. 
Unlike other languages such as PHP or Java, 
ColdFusion is tag-based which makes it easier to use and understand, 
especially for beginners. It also has built-in capabilities for many common tasks, 
such as sending emails, working with databases, and handling sessions, which can reduce the amount of code you need to write.

How can I start learning ColdFusion?
The best way to start learning ColdFusion is by understanding its basics. 
You can start by reading tutorials and guides, like the one provided on our website.
It’s also beneficial to practice coding in ColdFusion to get a hands-on experience.
Adobe provides a free developer edition of ColdFusion that you can download and use for learning and development purposes.

Is ColdFusion still relevant today?
Yes, ColdFusion is still relevant today.
Despite the emergence of new programming languages, 
ColdFusion remains a reliable choice for many developers due to its simplicity and efficiency.
It is widely used in enterprise applications and is supported by a strong community of developers.

What are some common uses of ColdFusion?
ColdFusion is commonly used to build and manage dynamic websites, applications, and web services. 
It’s particularly useful for creating data-driven websites,
as it simplifies the process of connecting web pages to a database.
ColdFusion can also be used for tasks such as sending emails, handling file uploads, and managing sessions.

Can I use ColdFusion for mobile app development?
Yes, you can use ColdFusion for mobile app development.
Adobe provides a set of tools and features in ColdFusion that make it easier to develop,
test, and deploy mobile apps. These include support for RESTful web services, 
client-side database integration and server-sidea Information.

How does ColdFusion handle databases?
ColdFusion simplifies the process of working with databases. 
It uses tags to interact with databases, which makes it easier to perform common tasks such as querying a database, 
retrieving data, and updating records. 
ColdFusion supports a wide range of databases, including MySQL, Oracle, and SQL Server.

What is ColdFusion Markup Language (CFML)?
ColdFusion Markup Language (CFML) is the scripting language used in ColdFusion. 
It is a tag-based language, similar to HTML, which makes it easy to learn and use. 
CFML includes tags for a wide range of tasks, from basic HTML rendering to complex business information.

Is ColdFusion secure?
Yes, ColdFusion is secure. Adobe provides a range of security features in ColdFusion, 
including secure session management, input validation, 
and protection against cross-site scripting and SQL injection attacks. 
However, like any programming language, the security of a ColdFusion application also depends on the developer’s practices.

Can I integrate ColdFusion with other Adobe products?
Yes, ColdFusion can be integrated with other Adobe products. For example, you can use ColdFusion with 
Adobe Dreamweaver to create and manage web pages, or with Adobe Flash for creating rich internet applications.
  
What resources are available for learning ColdFusion?
There are many resources available for learning ColdFusion. These include online tutorials and guides, books, and training courses. Adobe also provides a range of resources, including documentation, 
a developer edition of ColdFusion, and a community forum where you can ask questions and share knowledge with other developers.
 
