# Micro-Reddit

Part of the Odin Project [curriculum](https://www.theodinproject.com/courses/ruby-on-rails). A very junior version of Reddit. Contains the back-end models necessary to support link submissions and commenting. No ability to comment on comments. There's no front end. Rails console or test:models can be used to manipulate the models without the overhead of making HTTP requests and involving controllers or views.

Summary of creation steps:
  1. Map out database models needed (data, validations, associations).
     ```
     User
       username:string [required, unique, max 64 chars]
       password:string [required, min 8 chars]
       has many posts
       has many comments
     Post
       title:string [required, max 64 chars]
       body:text [required, max 10k chars]
       belongs to a user
       has many comments
     Comment
       body:text [required, max 10k chars]
       belongs to a post
       belongs to a user
     ```
  2. Create the Rails app.
     ```
     $ rails new micro-reddit
     ```
  3. Create a User model.
     ```
     $ rails generate model User username:string password:string
     ```
  4. Create a Post model.
     ```
     $ rails generate model Post title:string body:text user:references
     ```
  5. Create a Comment model.
     ```
     $ rails generate model Comment body:text user:references post:references
     ```
  6. Migrate models to database.
     ```
     $ rails db:migrate
     ```
  7. Add validations and associations to User model app/models/users.rb
  8. Add validations and associations to Post model app/models/posts.rb
  9. Add validations and associations to Comment model app/models/comments.rb
  10. Add User model tests for validations test/models/user_test.rb
  11. Add Post model tests for validations test/models/post_test.rb
  12. Add Comment model tests for validations test/models/comment_test.rb
  13. Run model tests.
     ```
     $ rails test:models
     ```
  14. Manipulate models via the console.
     ```
     $ rails console --sandbox
     ```