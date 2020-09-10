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
end
