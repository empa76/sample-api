red_panel = PanelProvider.create!(code: 'red')
green_panel = PanelProvider.create!(code: 'green')
blue_panel = PanelProvider.create!(code: 'blue')

uk = Country.create!(country_code: 'uk', panel_provider: red_panel)
pl = Country.create!(country_code: 'pl', panel_provider: green_panel)
de = Country.create!(country_code: 'de', panel_provider: blue_panel)

north = LocationGroup.create(name: "north", country: uk, panel_provider: red_panel)
south = LocationGroup.create(name: "south", country: de, panel_provider: blue_panel)
west = LocationGroup.create(name: "west", country: uk, panel_provider: blue_panel)

east = LocationGroup.create(name: "east", country: pl, panel_provider: green_panel)
east.locations << Location.create(secret_code: 'Falubaz', external_id: 'ZG', name: "Zielona Gora")
east.locations << Location.create(secret_code: 'Stal', external_id: 'GW', name: "Gorzow Wlkp.")
east.locations << Location.create(secret_code: 'Unia', external_id: 'LO', name: "Leszno")
east.locations << Location.create(secret_code: 'Apator', external_id: 'TN', name: "Torun")
east.locations << Location.create(secret_code: 'Polonia', external_id: 'BG', name: "Bydgoszcz")
east.save!

# TODO: fill all groups

cars = TargetGroup.create(name: 'Cars', external_id: 'c', secret_code: 'This is root node', panel_provider: red_panel)
cars.countries << [uk, pl, de]

bmw = cars.children.create(name: 'BMW', external_id: 'b', secret_code: 'e36', panel_provider: green_panel)
bmw.countries << [uk, de]

ford = cars.children.create(name: 'Ford', external_id: 'f', secret_code: 'fiesta', panel_provider: blue_panel)
ford.countries << [pl, de]

vauxhall = cars.children.create(name: 'Vauxhall', external_id: 'v', secret_code: 'astra', panel_provider: red_panel)
vauxhall.countries << uk
