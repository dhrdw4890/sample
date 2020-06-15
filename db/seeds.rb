User.create!(name:  "松浦　健一",
  email: "example@railstutorial.org",
  password:              "password",
  password_confirmation: "password")

99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password)
end

users = User.order(:created_at).take(10)
20.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end

users = User.all
user  = users.first
following = users[2..30]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }