# Create users and seed data to test

#Create 2 users

matt = User.create(name: "Matt Smith", username: "mrandolph83", password: "password")
christy = User.create(name: "Christy Smith", username: "christylynnsmith", password: "password")

# Create Recipe Entries

Recipe.create(title: "Super Smoothie Blast", content: "Boy howdy, just put some shit in a blender!", category: "breakfast", user_id: matt.id, simple_review: 4, healthy_review: 3, tasty_review: 5)
Recipe.create(title: "Ham, Green Bean, Potato", content: "Holy hell, cook some shit on the stove!", category: "dinner", user_id: christy.id, simple_review: 5, healthy_review: 4, tasty_review: 3)

# Use AR to pre-associate data

matt.recipes.create(title: "PBJ", content: "Peanut Butter Jelly Time!", category: "lunch", user_id: matt.id, simple_review: 1, healthy_review: 3, tasty_review: 4)
christy.recipes.create(title: "Chips and Cheese", content: "Phase 1: collect underpants. Phase 3: profit!", category: "snack", user_id: christy.id, simple_review: 4, healthy_review: 4, tasty_review: 2) 
