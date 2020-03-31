# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

def handle_string_io_as_file(io, filename)
  return io unless io.class == StringIO
  file = Tempfile.new(["temp",".png"], encoding: 'ascii-8bit')
  file.binmode
  file.write io.read
  file.open
end

puts 'Destroying all users, investments, and properties...'
Investment.destroy_all
Property.destroy_all
User.destroy_all


sleep(2)
puts 'Creating new users, properties, and investments...'
sleep(2)

users = []

#CREATING USERS

user_1 = User.create!(
  email: "ikram@gmail.com",
  password: "123456",
  first_name: "Ikram",
  last_name: "Akhlaq")

users << user_1


user_2 = User.create!(
  email: "max@gmail.com",
  password: "123456",
  first_name: "Maxime",
  last_name: "Geurts")

users << user_2

user_3 = User.create!(
  email: "jensen@gmail.com",
  password: "123456",
  first_name: "Jensen",
  last_name: "Daniel")

users << user_3

user_4 = User.create!(
  email: "antoine@gmail.com",
  password: "123456",
  first_name: "Antoine",
  last_name: "Broqueville")

users << user_4

user_5 = User.create!(
  email: "claire@gmail.com",
  password: "123456",
  first_name: "Claire",
  last_name: "Gautier")

users << user_5


user_6 = User.create!(
  email: "bobby@gmail.com",
  password: "123456",
  first_name: "Bobby",
  last_name: "Brown")

users << user_6


user_7 = User.create!(
  email: "michael@gmail.com",
  password: "123456",
  first_name: "Michael",
  last_name: "Smith")

users << user_7

user_8 = User.create!(
  email: "elena@gmail.com",
  password: "123456",
  first_name: "Elena",
  last_name: "Vigo")

users << user_8

user_9 = User.create!(
  email: "leon@gmail.com",
  password: "123456",
  first_name: "Leon",
  last_name: "Bressler")

users << user_9

# CREATING PROPERTIES

# FUNDED AND EXITED

  property_1 = Property.create!(
    user: user_1,
    name: "3 bedroom House in inner city Birmingham",
    description: "Vestate presents this stunning 3 bedroom and 2 bathroom in Birmingham City centre .The property features:Spacious living room, luxury bathroom, integrated reception room and a contemporary kitchen with a separate utility room. Belgravia development itself has several amenities and leisure facilities such as 24/7 concierge service, secure underground parking, gardens for residents. Extensive transport links.

This immaculate new flat features 3 spacious bedrooms, 2 modern bathrooms, an integrated reception room and a contemporary
kitchen with a separate utility room. The Belgravia development itself provides various amenities and leisure facilities exclusively for residents.",
    location: "Birmingham",
    area_description: "Birmingham (/ˈbɜːrmɪŋəm/ (About this soundlisten) BUR-ming-əm)[4] is a major city and metropolitan borough in the West Midlands, England. It is the second-largest city and metropolitan area in England and the United Kingdom,[b] with roughly 1.1 million inhabitants within the city area and 4.3 million inhabitants within the metropolitan area.[5][6][7][8][9][10] Birmingham is commonly referred to as the second city of the United Kingdom.[11][12][13]

Located in the West Midlands county and region in England, approximately 100 miles (160 km) from Central London, Birmingham, as one of the United Kingdom's major cities, is considered to be the social, cultural, financial, and commercial centre of both the East and West Midlands. Distinctively, Birmingham only has small rivers flowing through it, mainly the River Tame and its tributaries River Rea and River Cole – one of the closest main rivers is the Severn, approximately 20 miles (32 km) west of the city centre. Birmingham's urban area is the second-largest in the United Kingdom, with its most recently estimated population in 2017 being 2,897,303,[10][14] and it also lies within the most populated English district.",
    dividend: 5000,
    end_date: Date.today - 100,
    amount_to_be_raised: 100000,
    valuation: 100000,
    sales_proceeds: 200000,
    status: "exited"
    )

  # FUNDED AND NOT YET EXITED

  property_2 = Property.create!(
    user: user_2,
    name: "2 Bedroom flat in Brussels outskirts",
    description: "An exciting opportunity to acquire a lateral flat extending over 1100sqft that is in need of complete modernisation. The accommodation comprises a large reception room with views towards mountains, separate kitchen, bathroom, cloakroom and three double bedrooms.

Rosscourt Mansions is a mansion block located in an affluent area of Brussels with easy access to the shops and restaurants. The surrounding green spaces are a short walk away.",
    location: "Brussels",
    area_description: "Brussels a region of Belgium comprising 19 municipalities, including the City of Brussels, which is the capital of Belgium.[9] The Brussels-Capital Region is located in the central portion of the country and is a part of both the French Community of Belgium[10] and the Flemish Community,[11] but is separate from the Flemish Region (within which it forms an enclave) and the Walloon Region.[12][13] Brussels is the most densely populated and the richest region in Belgium in terms of GDP per capita.[14] It covers 162 km2 (63 sq mi), a relatively small area compared to the two other regions, and has a population of over 1.2 million.[15] The five times larger metropolitan area of Brussels comprises over 2.5 million people, which makes it the largest in Belgium.[16][17][18] It is also part of a large conurbation extending towards Ghent, Antwerp, Leuven and Walloon Brabant, home to over 5 million people.[19]",
    dividend: 20000,
    end_date: Date.today - 30,
    amount_to_be_raised: 50000,
    valuation: 200000,
    status: "funded"
    )

# FUNDRAISING CURRENTLY

  property_3 = Property.create!(
    user: user_3,
    name: "3 Bedroom flat near Central Park, New York",
    description: "Stylish, spacious,this junior one bedroom is just steps from Central Park, Fifth Avenue and Carnegie Hall. You can live on Billionaire's Row-in the middle of it all!! This huge junior one bedroom has been completely renovated. The gorgeous open separate kitchen features granite counters, new cabinets and stainless-steel appliances. The bathroom has been renovated with a pedestal sink, medicine cabinet and ceramic tile. This apartment has it all when you add a windowed sleeping alcove, which has been converted to a bedroom with lovely French pocket doors, wonderfully large living area and lots of closets! The pet-friendly, full service, has a Concierge, doorman, valet service, storage spaces and an on-site garage where residents receive a 25 percent discount. Pied-a-terres, gifting and parent's buying for children are welcome. Most major transportation right outside the building",
    location: "Central Park, New York",
    area_description: "Situated on one of the world's largest natural harbors, New York City is composed of five boroughs, each of which is a county of the State of New York. The five boroughs–Brooklyn, Queens, Manhattan, the Bronx, and Staten Island–were consolidated into a single city in 1898",
    dividend: 20000,
    end_date: Date.today + 50,
    amount_to_be_raised: 70000,
    valuation: 70000,
    status: "currently fundraising"
    )

# FUNDRAISING CURRENTLY

  property_4 = Property.create!(
    user: user_4,
    name: "A rare to market 3 bedroom apartment in trendy Eixample, Barcelona ",
    description: "A rare to market apartment. Stepping into the apartment there is a welcoming entrance hall with a charming stain glass window. The west facing reception room offers a full width balcony leading from the floor to ceiling French doors with green views over the gardens.

There is an abundance of entertaining space and a dining area which follows onto a separate kitchen. The spacious double bedroom has another balcony, an en suite shower room and plenty of built-in storage. The property further benefits from high ceilings, wooden floors, original period features, a separate WC and newly refurbished common parts.",
    location: "Eixample, Barcelona",
    area_description: "Some of Barcelona's best shopping is found in this Barrio. It also has many bars and restaurants along with modernist architecture e.g. Gaudí's Casa Batlló, Casa Mila and Sagrada Família. This Barrio is also characterized by a busy grid-like road system",
    dividend: 12000,
    end_date: Date.today + 100,
    amount_to_be_raised: 120000,
    valuation: 240000,
    status: "currently fundraising"
    )

# COMING SOON ON MARKET

  property_5 = Property.create!(
    user: user_5,
    name: "A beautiful house in the outskirts of Paris ",
    description: "A bright spacious and beautifully presented 5 bedroom, double fronted, Parisian family home benefitting from off street parking and an exceptional rear garden, situated within the heart of a conservation area. Accommodation is both bright and well balanced and comprises; a fabulous double reception room drowned in natural light courtesy of the dual aspect and large, floor to ceiling double glazed sash windows, 2 double bedrooms (one of which is currently arranged as a study) and a bathroom suite housed on the raised ground floor. The vast dining room, additional reception space, utility room and the galley kitchen are situated on the lower level, providing access to the wider than average and secluded West facing rear garden which benefits from a large summer house. There are 2 generous double bedrooms a further bedroom/dressing room and the family bathroom suite on the top floor, all of which feature double glazed sash windows. There is also the added benefit of off street parking, making this an ideal family home.",
    location: "Paris",
    area_description: "Paris is located in northern central France, in a north-bending arc of the river Seine whose crest includes two islands, the Île Saint-Louis and the larger Île de la Cité, which form the oldest part of the city. The river's mouth on the English Channel (La Manche) is about 233 mi (375 km) downstream from the city",
    dividend: 70000,
    end_date: Date.today + 100,
    amount_to_be_raised: 500000,
    valuation: 500000,
    status: "coming soon"
    )


# CREATING INVESTMENTS TO GO WITH THE PROPERTIES FROM ABOVE

  investment_1 = Investment.create!(
    user: user_5,
    property: property_1,
    amount: 50000
    )

  investment_2 = Investment.create!(
    user: user_6,
    property: property_1,
    amount: 50000
    )

  investment_3 = Investment.create!(
    user: user_6,
    property: property_2,
    amount: 25000
    )
  investment_4 = Investment.create!(
    user: user_7,
    property: property_2,
    amount: 25000
    )

investment_5 = Investment.create!(
    user: user_8,
    property: property_3,
    amount: 20000
    )

investment_6 = Investment.create!(
    user: user_9,
    property: property_4,
    amount: 45000
    )

# ATTACHING PHOTOS WITH PROPERTIES

property_1.photos.attach(io: File.open("app/assets/images/property_images/Property_1_Photo_1.jpg"), filename: "Photo_1.jpg", content_type: 'image/jpg')
property_2.photos.attach(io: File.open("app/assets/images/property_images/Property_2_Photo_1.jpg"), filename: "Photo_1.jpg", content_type: 'image/jpg')
property_3.photos.attach(io: File.open("app/assets/images/property_images/Property_3_Photo_1.jpg"), filename: "Photo_1.jpg", content_type: 'image/jpg')
property_4.photos.attach(io: File.open("app/assets/images/property_images/Property_4_Photo_1.jpg"), filename: "Photo_1.jpg", content_type: 'image/jpg')
property_5.photos.attach(io: File.open("app/assets/images/property_images/Property_5_Photo_1.jpg"), filename: "Photo_1.jpg", content_type: 'image/jpg')


#M MULTIPLE PHOTOS FOR PROPERTIES CAN COME LATER

property_1.photos.attach(io: File.open("app/assets/images/property_images/Property_1_Photo_2.jpg"), filename: "Photo_2.jpg", content_type: 'image/jpg')
property_2.photos.attach(io: File.open("app/assets/images/property_images/Property_2_Photo_2.jpg"), filename: "Photo_2.jpg", content_type: 'image/jpg')
property_3.photos.attach(io: File.open("app/assets/images/property_images/Property_3_Photo_2.jpg"), filename: "Photo_2.jpg", content_type: 'image/jpg')
property_4.photos.attach(io: File.open("app/assets/images/property_images/Property_4_Photo_2.jpg"), filename: "Photo_2.jpg", content_type: 'image/jpg')
property_5.photos.attach(io: File.open("app/assets/images/property_images/Property_5_Photo_2.jpg"), filename: "Photo_2.jpg", content_type: 'image/jpg')

property_1.photos.attach(io: File.open("app/assets/images/property_images/Property_1_Photo_3.jpg"), filename: "Photo_3.jpg", content_type: 'image/jpg')
property_2.photos.attach(io: File.open("app/assets/images/property_images/Property_2_Photo_3.jpg"), filename: "Photo_3.jpg", content_type: 'image/jpg')
property_3.photos.attach(io: File.open("app/assets/images/property_images/Property_3_Photo_3.jpg"), filename: "Photo_3.jpg", content_type: 'image/jpg')
property_4.photos.attach(io: File.open("app/assets/images/property_images/Property_4_Photo_3.jpg"), filename: "Photo_3.jpg", content_type: 'image/jpg')
property_5.photos.attach(io: File.open("app/assets/images/property_images/Property_5_Photo_3.jpg"), filename: "Photo_3.jpg", content_type: 'image/jpg')

property_1.photos.attach(io: File.open("app/assets/images/property_images/Property_1_Photo_4.jpg"), filename: "Photo_4.jpg", content_type: 'image/jpg')
property_2.photos.attach(io: File.open("app/assets/images/property_images/Property_2_Photo_4.jpg"), filename: "Photo_4.jpg", content_type: 'image/jpg')
property_3.photos.attach(io: File.open("app/assets/images/property_images/Property_3_Photo_4.jpg"), filename: "Photo_4.jpg", content_type: 'image/jpg')
property_4.photos.attach(io: File.open("app/assets/images/property_images/Property_4_Photo_4.jpg"), filename: "Photo_4.jpg", content_type: 'image/jpg')
property_5.photos.attach(io: File.open("app/assets/images/property_images/Property_5_Photo_4.jpg"), filename: "Photo_4.jpg", content_type: 'image/jpg')

puts 'Finished!'
