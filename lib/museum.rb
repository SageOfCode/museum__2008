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

  def patrons_by_exhibit_interest
    patrons_by_exhibit = {}
    @exhibits.find_all do |exhibit|
      @patrons.each do |patron|
        patron.interests.each do |interest|
          if exhibit.name == interest
            patrons_by_exhibit[exhibit] = (recommend_exhibits(patron) << patron)
          end
        end
      end
    end
    patrons_by_exhibit
  end
end
