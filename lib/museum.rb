class Museum
  attr_reader :name
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def exhibits
    @exhibits
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    interest_list = []
    @exhibits.find_all do |exhibit|
      patron.interests.each do |interest|
        if exhibit.name == interest
          interest_list << exhibit
        end
      end
    end
    interest_list.reverse
  end

  def admit(patron)
    @patrons << patron 
  end

  def patrons
    @patrons
  end
end
