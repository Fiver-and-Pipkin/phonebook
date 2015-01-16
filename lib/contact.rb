class Contact
  @@contacts = []

  define_method(:initialize) do |phone_number, type, birthday, year|
    @phone_number = phone_number
    @type = type
    @birthday = birthday
    @year = year
    @id = @@contacts.length().+(1)
  end

  define_method(:phone_number) do
    @phone_number
  end

  define_method(:type) do
    @type
  end

  define_method(:birthday) do
    @birthday
  end

  define_method(:year) do
    @year
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |identification|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(identification.to_i())
        found_contact = contact
      end
    end
    found_contact
  end
end
