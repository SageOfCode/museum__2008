class Museum
  attr_reader :name
  def initialize(name)
    @name = name
    @exhibits = []
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
end
