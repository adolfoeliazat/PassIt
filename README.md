#PassIt


![codecov.io](https://codecov.io/github/akaifi/PassIt/branch.svg?branch=master)



##The idea:##
Do you have a drill or screwdriver at home? When was the last time you used it? You may use the drill once a year, and then it will be untouched for many years. The idea of our project is to make use of these equipment by making them available to be rented in your neighborhood. We will design a web application similar to http://streetbank.com

##Goal:##
To design and implement a PASS IT web application that provides lending services of household items to the neighbourhood.

##Major Classes:##
* UserProfile (name, addressX, addressY)
* System Users From the authentication system (username, password)
* Product (name, pic, states, condition, payment Method(cash/paypal), availability/states)
* Transaction (Rent History, Payment Method)
* Reservation/RentQueue if more than one person want the same product 
* Reviews  (comment_id, user_id, product_id, comment, rating, datetime)

##Use Cases:##
###Borrower/Searcher role###
If a Borrower wants a drill, he/she has to signin  the website.  After signing in, he/she can search the item that  wanted to be rent/borrow in 10m or so of the neighborhood 
a list of available items shows on the map with more details about that item and who owns it the user choose one from Jack who lives across the street and fill in how many days and name the price.  An email is received if the offer is accepted.  If the payment method is paypal, the borrower pays and transaction is completed.

###Product Owner Role###
The PO supposed to register first  and choose post a product and enter the product details.  An email is received if an offer is made. Owner can accept or reject the offer or even make that order as a gift for 1st time.  When owner accepts an offer, and chooses payment method as PayPal, payment is sent to owner.

##The Additional Features:##
* Pagination
* Twitter-Bootstrap
* Google Maps Integration
* Mashups with local stores
* FAQ
* PayPal Integration

### What is this repository for? ###
* The Platform:
Ruby  v 2.1.2  on Rails  v 4.1.5

### How do I get set up? ###

* Summary of set up
    * a working ruby version 2.1.2 recommended 
    * Rails v4.1.5
    * reguler setup process 
    bundle install
    rake db:migrate
    rake db:seed

### Contribution ###

any ideas/improvements are welcome 
give us an introductory and we will accept your pull requiste 

### Who do I talk to? ###

* Repo owner or admin
     * [Ahmad Kaifi](http://akaifi.github.io)
     * Hassan Althobaiti
     * Vijayalakshmi Selvamani

* Other community or team contact
not yet
