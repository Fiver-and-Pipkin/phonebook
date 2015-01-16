class Phone
  @@phones = []

  define_method(:initialize) do |name|
    @name = name
    @numbers = []
    @id = @@phones.length().+(1)
  end

  define_method(:name) do
    @name
  end

  define_method(:numbers) do
    @numbers
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@phones
  end

  define_method(:save) do
    @@phones.push(self)
  end

  define_singleton_method(:clear) do
    @@phones = []
  end

  define_method(:add_contact) do |contact|
    @numbers.push(contact)
  end

  define_singleton_method(:find) do |id|
    found_phone = nil
    @@phones.each() do |phone|
      if phone.id().eql?(id)
        found_phone = phone
      end
    end
    found_phone
  end
end
