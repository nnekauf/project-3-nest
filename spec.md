# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    - Reader has_many reviews and Book has_many reviews.
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - Review belongs to a reader and a book.
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    - Reader has many Books through Reviews and Book has many Readers through Reviews.
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    - Reader has many Books through Reviews and Book has many Readers through Reviews.
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    - Review has a text that the reader can submit.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - Each model has validations.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - Reader can search through books by title
- [x] Include signup (how e.g. Devise)
    - Reader controller handles signup
- [x] Include login (how e.g. Devise)
    - Sessions controller handles log in
- [x] Include logout (how e.g. Devise)
    - Sessions controlelr handles log out
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - User can sign up via Facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    - readers/:id/reviews is one example 
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    - readers/:reader_id/reviews/new is one example
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    - Validation errors are shown within errors partial

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
