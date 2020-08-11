# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
	email: 'host@host.com',
	password: 'hosthost'
	)
Destination.create!(
	place: '国内'
	)
Destination.create!(
	place: 'アジア・中東'
	)
Destination.create!(
	place: 'オセアニア'
	)
Destination.create!(
	place: 'ヨーロッパ'
	)
Destination.create!(
	place: 'アフリカ'
	)
Destination.create!(
	place: '北米・中米'
	)
Destination.create!(
	place: '南米'
	)
