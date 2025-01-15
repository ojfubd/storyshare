# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create!([
  {
    name: "管理者",
    email: "admin2@example.com",
    password: "dD@78ff224",
    password_confirmation: "dD@78ff224",
    crypted_password: "dD@78ff224",
    salt: "examplesalt",
    avatar: "user.png",
    role: :admin,
    read: false
  },
  {
    name: "ユーザーB",
    email: "user_b2@example.com",
    password: "dD@78fff1",
    password_confirmation: "dD@78fff1",
    crypted_password: "dD@78fff1",
    salt: "examplesalt41",
    avatar: "user.png",
    role: :general,
    read: false
  }
])