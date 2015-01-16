require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/phonebook')
require('pry')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/contacts') do
  name = params.fetch('name')
  phone = params.fetch('phone')
  Contact.new(name, phone).save()
  @contacts = Contact.all()
  erb(:index)
end

get('/contacts/:id') do
  @contacts = Contact.find(params.fetch("id"))
  erb(:contacts)
end
