# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pump.delete_all
Card.delete_all
Scanner.delete_all
Station.delete_all

Station.create!([
    {name: 'Taft', line: 'MRT3', order: 1},
    {name: 'Magallanes', line: 'MRT3', order: 2},
    {name: 'Ayala', line: 'MRT3', order: 3},
    {name: 'Buendia', line: 'MRT3', order: 4},
    {name: 'Guadalupe', line: 'MRT3', order: 5},
    {name: 'Boni', line: 'MRT3', order: 6},
    {name: 'Shaw', line: 'MRT3', order: 7},
    {name: 'Ortigas', line: 'MRT3', order: 8},
    {name: 'Santolan', line: 'MRT3', order: 9},
    {name: 'Cubao', line: 'MRT3', order: 10},
    {name: 'Kamuning', line: 'MRT3', order: 11},
    {name: 'Quezon Ave', line: 'MRT3', order: 12},
    {name: 'North Ave', line: 'MRT3', order: 13},
])

Station.find_each do |station|
    station.scanners << Scanner.create!({key: "#{station.order}-abcdef"})
    station.scanners << Scanner.create!({key: "#{station.order}-ghijkl"})
end

Card.create!([
    # Has yet to pump, ever
    {sid: 'D3D4E9E7', origin: 'Taft MRT3', date_given: 10.days.ago, last_ridden: 5.days.ago, points: 0, points_total: 0},
    # Has yet to pump
    {sid: 'E36EE9E7', origin: 'Taft LRT1', date_given: 10.days.ago, last_ridden: 5.days.ago, last_pumped: 7.days.ago, points: 0, points_total: 0},
    {sid: '836FE9E7', origin: 'Taft MRT3', date_given: 10.days.ago, last_ridden: 5.days.ago, last_pumped: 7.days.ago, points: 10, points_total: 10},
    # Has already pumped
    {sid: 'F36EE9E7', origin: 'Taft MRT3', date_given: 10.days.ago, last_ridden: 5.days.ago, last_pumped: 3.days.ago, points: 0, points_total: 0},
    {sid: '2AFB3629', origin: 'Taft MRT3', date_given: 10.days.ago, last_ridden: 5.days.ago, last_pumped: 3.days.ago, points: 10, points_total: 10},
])
