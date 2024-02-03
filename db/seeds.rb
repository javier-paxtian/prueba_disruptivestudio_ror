# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

criptos_data = [
  { moneda: 'Bitcoin', interes_mensual: 5, balance_ini: 500 },
  { moneda: 'Ether', interes_mensual: 4.2, balance_ini: 250 },
  { moneda: 'Cardano', interes_mensual: 1, balance_ini: 120 }
]

criptos_data.each do |cripto_attributes|
  Cripto.create(cripto_attributes)
end