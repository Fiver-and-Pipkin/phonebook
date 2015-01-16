require('rspec')
require('contact')


describe(Contact) do
  before() do
    Contact.clear()
  end

  describe("#phone_number") do
    it("returns the phone_number of the contact") do
      test_contact = Contact.new(555-555-1212, "Jan 7th", 1945)
      test_contact.save()
      expect(test_contact.phone_number()).to(eq(555-555-1212))
    end
  end

  describe("#birthday") do
    it("returns the birthday of the contact") do
      test_contact = Contact.new("Meryl Streep", "Jan 7th", 1945)
      test_contact.save()
      expect(test_contact.birthday()).to(eq("Jan 7th"))
    end
  end

  describe("#year") do
    it("returns the birth year of the contact") do
      test_contact = Contact.new("Meryl Streep", "Jan 7th", 1945)
      test_contact.save()
      expect(test_contact.year()).to(eq(1945))
    end
  end

  describe("#save") do
    it("adds a contact to the array of saved contacts") do
      test_contact = Contact.new("Meryl Streep", "Jan 7th", 1945)
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved contacts") do
      Contact.new("Meryl Streep", "Jan 7th", 1945).save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a contact by its id number")  do
      test_contact = Contact.new("Meryl Streep", "Jan 7th", 1945)
      test_contact.save()
      test_contact2 = Contact.new("Jessica Lange", "Feb 11th", 1950)
      test_contact2.save()
      expect(Contact.find(test_contact.id())).to(eq(test_contact))
    end
  end
end
