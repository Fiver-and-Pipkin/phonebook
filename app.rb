require("sinatra")
require("sinatra/reloader")
also_reload("./lib/**/*.rb")
# require("./lib/")
require("./lib/phone")
require("./lib/contact")

get("/") do
  @phones = Phone.all()
  erb(:index)
end

post("/phones") do
  name = params.fetch("name")
  Phone.new(name).save()
  @phones = Phone.all
  erb(:index)
end

post("/contacts") do
  phone_number = params.fetch("phone_number")
  birthday = params.fetch("birthday")
  year = params.fetch("year")
  @contact = Contact.new(phone_number, birthday, year)
  @contact.save()
  @phone = Phone.find(params.fetch("phone_id").to_i())
  @phone.add_contact(@contact)
  erb(:phones)
end

get("/contacts/:id") do
  @contact = Contact.find(params.fetch("id"))
  erb(:contacts)
end

get("/phones/:id") do
  @phone = Phone.find(params.fetch("id").to_i())
  erb(:phones)
end
