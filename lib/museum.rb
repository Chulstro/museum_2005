
class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons =[]
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    patron.interests
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    recommended = {}
    @exhibits.each do |exhibit|
      patrons = []
      @patrons.each do |patron|
        patron_is = patron.interests.find_all do |interest|
          interest == exhibit.name
        end
        patrons << patron if patron_is.count > 0
      end
      recommended[exhibit.name] = patrons
    end
    recommended
  end

  def lottery_ticket_contestants(exhibit)
    patrons = []
    @patrons.each do |patron|
      patrons << patron if patron.spending_money < exhibit.cost
    end
    patrons
  end
end
