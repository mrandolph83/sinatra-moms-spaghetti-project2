# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    Sinatra has been used from the beginning to build this application. The app was scaffolded using the Corneal gem, and customized using Ruby, HTML, and CSS fucntionality, with a SQLite3 database built with ActiveRecord
- [x] Use ActiveRecord for storing information in a database
    ActiveRecord migrations built the database structure of this application
- [x] Include more than one model class (e.g. User, Post, Category)
    This app contains 3 model classes - User, Recipe, and Review
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    A User has many recipes, a Recipe has many reviews, and a User has many reviews.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    A Recipe belongs to a User, a Review belongs to a User, a Review belongs to a Recipe.
- [x] Include user accounts with unique login attribute (username or email)
    There are currently 20 unique users in this app's database, each with an encrypted password.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    All of this CRUD functionality is included for Users submitting Recipes to the database.
- [x] Ensure that users can't modify content created by other users
    Mulltiple levels of authentication protect users from modifying other users' content
- [x] Include user input validations
    Authenticate methods using the bcrypt gem, as well as secondary authentication methods on different controller actions, validate the user at different stages. 
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    Flash messages guide the user when they have made errors at the login and signup stages, as well as when they have posted a new recipe. 

- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    The README includes all of the information described.

Confirm
- [x] You have a large number of small Git commits
    I have a large bumber of Git commits
- [x] Your commit messages are meaningful
    All git commit messages explain the updates made to the application.
- [x] You made the changes in a commit that relate to the commit message
    Correct
- [x] You don't include changes in a commit that aren't related to the commit message
    At each stage, I included what things had been added at each commit.

