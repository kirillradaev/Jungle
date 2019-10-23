# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Final Product

###### Home Page

!["Home page"](https://github.com/kirillradaev/Jungle/blob/master/docs/home_page.png?raw=true)

###### About Page

!["About page"](https://github.com/kirillradaev/Jungle/blob/master/docs/about_page.png?raw=true)

###### Empty Cart

!["Empty cart"](https://github.com/kirillradaev/Jungle/blob/master/docs/empty_cart.png?raw=true)

###### Cart with products

!["Cart with products"](https://github.com/kirillradaev/Jungle/blob/master/docs/cart_with_products.png?raw=true)

###### SignUp page

!["Signup page"](https://github.com/kirillradaev/Jungle/blob/master/docs/signup.png?raw=true)

###### Login

!["Login"](https://github.com/kirillradaev/Jungle/blob/master/docs/login.png?raw=true)

###### Navbar when logged in

!["Navbar when logged in"](https://github.com/kirillradaev/Jungle/blob/master/docs/navbar_loggedin.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
