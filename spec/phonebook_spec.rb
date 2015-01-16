require('rspec')
require('phonebook')
require('pry')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe('#name') do
    it("returns the name of the contact") do
      test_contact = Contact.new("Dr Who", 8005551212)
      test_contact.save()
      expect(test_contact.name()).to eq("Dr Who")
    end
  end

  describe('#phone') do
    it("returns the phone number of the contact") do
      test_contact = Contact.new("Dr Who", 8005551212)
      test_contact.save()
      expect(test_contact.phone()).to eq(8005551212)
    end
  end


  describe("#save") do
    it("adds a contact to the phonebook") do
      test_contact = Contact.new("Dr Who", 8005551212)
      test_contact.save()
      expect(Contact.all()).to eq([test_contact])
    end
  end

  describe("#id") do
    it("returns the unique idenitfier of a contact in the array") do
      test_contact = Contact.new("Dr Who", 8005551212)
      expect(test_contact.id()).to eq(1)
    end
  end

  describe(".find") do
    it("returns a contact by its id number") do
      test_contact = Contact.new("Dr Who", 8005551212)
      test_contact.save()
      test_contact2 = Contact.new("Daleck", 9009999999)
      test_contact2.save()
      expect(Contact.find(test_contact.id())).to eq(test_contact)
    end
  end
end
