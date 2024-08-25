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
    email: "admin@example.com",
    password: "dD@78ff223",
    password_confirmation: "dD@78ff223",
    crypted_password: "dD@78ff223",
    salt: "examplesalt",
    avatar: "user.png",
    role: :admin
  },
  {
    name: "ユーザーB",
    email: "user_b@example.com",
    password: "dD@78fff",
    password_confirmation: "dD@78fff",
    crypted_password: "dD@78fff",
    salt: "examplesalt4",
    avatar: "user.png",
    role: :general
  }
])