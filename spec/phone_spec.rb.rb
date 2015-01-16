require('rspec')
require('phone')
require('contact')

describe(Phone) do
  before() do
    Phone.clear()
  end

  describe('#name') do
    it("returns the name of the contact") do
      test_phone = Phone.new("Jennifer Lawrence")
      expect(test_phone.name()).to(eq("Jennifer Lawrence"))
    end
  end

  describe('#id') do
    it("returns the id of the contact") do
      test_phone = Phone.new("Jennifer Lawrence")
      expect(test_phone.id()).to(eq(1))
    end
  end

  describe("#save") do
    it("adds a contact to the array of saved contacts") do
      test_phone = Phone.new("Jennifer Lawrence")
      test_phone.save()
      expect(Phone.all()).to(eq([test_phone]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved contacts") do
      Phone.new("Jennifer Lawrence").save()
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('#add_contact') do
    it("adds a new contact to the directory") do
      test_phone = Phone.new("Jennifer Lawrence")
      test_contact = Contact.new("555-555-1212", "Jan 7th", 1945)
      test_phone.add_contact(test_contact)
      expect(test_phone.numbers()).to(eq([test_contact]))
    end
  end

  describe(".find") do
    it("returns a contact by its id number") do
      test_phone = Phone.new("Jennifer Lawrence")
      test_phone.save()
      test_phone2 = Phone.new("Jessica Lange")
      test_phone2.save()
      expect(Phone.find(test_phone.id())).to(eq(test_phone))
    end
  end
end
