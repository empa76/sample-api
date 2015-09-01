red_panel = PanelProvider.create!(code: 'red')
green_panel = PanelProvider.create!(code: 'green')
blue_panel = PanelProvider.create!(code: 'blue')

uk = Country.create!(country_code: 'uk', panel_provider: red_panel)
pl = Country.create!(country_code: 'pl', panel_provider: green_panel)
de = Country.create!(country_code: 'de', panel_provider: blue_panel)


north = LocationGroup.create(name: "north", country: uk, panel_provider: red_panel)
north.locations << Location.create(secret_code: 'London is great!', external_id: 'CO', name: "London")
north.locations << Location.create(secret_code: 'Oxford is ok', external_id: 'OX', name: "Oxford")
north.locations << Location.create(secret_code: 'Dover must see', external_id: 'DV', name: "Dover")
north.locations << Location.create(secret_code: 'Cambridge is famous', external_id: 'CB', name: "Cambridge")
north.locations << Location.create(secret_code: 'Birmingham - yeah!', external_id: 'BG', name: "Birmingham")
north.save!

east = LocationGroup.create(name: "east", country: pl, panel_provider: green_panel)
east.locations << Location.create(secret_code: 'Falubaz', external_id: 'ZG', name: "Zielona Gora")
east.locations << Location.create(secret_code: 'Stal', external_id: 'GW', name: "Gorzow Wlkp.")
east.locations << Location.create(secret_code: 'Unia', external_id: 'LO', name: "Leszno")
east.locations << Location.create(secret_code: 'Apator', external_id: 'TN', name: "Torun")
east.locations << Location.create(secret_code: 'Polonia', external_id: 'BG', name: "Bydgoszcz")
east.save!

south = LocationGroup.create(name: "south", country: de, panel_provider: blue_panel)
south.locations << Location.create(secret_code: 'Stuttgart is great!', external_id: 'SG', name: "Stuttgart")
south.locations << Location.create(secret_code: 'Munchen is ok', external_id: 'DO', name: "Munchen")
south.locations << Location.create(secret_code: 'Hanover must see', external_id: 'HV', name: "Hanover")
south.locations << Location.create(secret_code: 'Fryburg is famous', external_id: 'FB', name: "Fryburg")
south.locations << Location.create(secret_code: 'Albstadt - yeah!', external_id: 'BG', name: "Albstadt")
south.save!

west = LocationGroup.create(name: "west", country: de, panel_provider: blue_panel)
west.locations << Location.create(secret_code: 'Berlin is great!', external_id: 'BL', name: "Berlin")
west.locations << Location.create(secret_code: 'Dortmund is ok', external_id: 'DO', name: "Dortmund")
west.locations << Location.create(secret_code: 'Ulm must see', external_id: 'HV', name: "Ulm")
west.locations << Location.create(secret_code: 'Frankfurt is famous', external_id: 'FK', name: "Frankfurt")
west.locations << Location.create(secret_code: 'Bonn - yeah!', external_id: 'BG', name: "Bonn")
west.save!

# TargetGroups

cars = TargetGroup.create(name: 'Cars', external_id: 'c', secret_code: 'This is root node', panel_provider: red_panel)
cars.countries << [uk, pl, de]
bmw = cars.children.create(name: 'BMW', external_id: 'b', secret_code: 'e36', panel_provider: green_panel)
bmw.countries << de
ford = cars.children.create(name: 'Ford', external_id: 'f', secret_code: 'fiesta', panel_provider: blue_panel)
ford.countries << pl
vauxhall = cars.children.create(name: 'Vauxhall', external_id: 'v', secret_code: 'astra', panel_provider: red_panel)
vauxhall.countries << uk

animals = TargetGroup.create(name: 'Animals', external_id: 'a', secret_code: 'This is root node', panel_provider: red_panel)
animals.countries << [uk, de]
lion = animals.children.create(name: 'Lion', external_id: 'l', secret_code: 'lion king', panel_provider: green_panel)
lion.countries << uk
monkey = animals.children.create(name: 'Monkey', external_id: 'm', secret_code: 'chita', panel_provider: blue_panel)
monkey.countries << uk
fish = animals.children.create(name: 'fish', external_id: 'f', secret_code: 'nemo', panel_provider: red_panel)
fish.countries << de

fruits = TargetGroup.create(name: 'Fruits', external_id: 'c', secret_code: 'This is root node', panel_provider: red_panel)
fruits.countries << [pl, de]
apple = fruits.children.create(name: 'Apple', external_id: 'ap', secret_code: 'red', panel_provider: green_panel)
apple.countries << de
orange = fruits.children.create(name: 'Orange', external_id: 'o', secret_code: 'sweet', panel_provider: blue_panel)
orange.countries << [pl, de]
mango = fruits.children.create(name: 'Mango', external_id: 'mg', secret_code: 'great', panel_provider: red_panel)
mango.countries << pl

colors = TargetGroup.create(name: 'Colors', external_id: 'cl', secret_code: 'This is root node', panel_provider: red_panel)
colors.countries << [uk, pl]
purple = colors.children.create(name: 'Purple', external_id: 'pl', secret_code: 'purple rain', panel_provider: green_panel)
purple.countries << uk
khaki = colors.children.create(name: 'Khaki', external_id: 'm', secret_code: 'maki', panel_provider: blue_panel)
khaki.countries << uk
magenta = colors.children.create(name: 'Magenta', external_id: 'f', secret_code: 'yellow', panel_provider: red_panel)
magenta.countries << pl

