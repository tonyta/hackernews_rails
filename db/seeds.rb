# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

User.delete_all
Post.delete_all
Comment.delete_all

50.times do
  username = Faker::Name.name.downcase.gsub(/ /, '')
  User.create(username: username, password: 'password', password_confirmation: 'password')
end

user_ids = User.all.map(&:id)

50.times do
  url = Faker::Internet.domain_name
  description = Faker::Lorem.sentence
  Post.create(url: url, description: description, user_id: user_ids.sample)
end

post_ids = Post.all.map(&:id)

200.times do
  text = Faker::Lorem.paragraph
  Comment.create(text: text, post_id: post_ids.sample , user_id: user_ids.sample)
end
