class Card 

  attr_accessor :suit, :show, :name, :value, :back, :front

  def initialize(input_options)
    @suit = input_options[:suit]
    @name = input_options[:name]
    @value = input_options[:value]
    @show = true
    @back = ["┌───────────┐",
             "│░░░░░░░░░░░│",
             "│░░░░░░░░░░░│",
             "│░RUBY░░░░░░│",
             "│░░░BLACK░░░│",
             "│░░░░░░JACK░│",
             "│░░░░░░░░░░░│",
             "│░░░░░░░░░░░│",
             "└───────────┘"]
    @front =     ["┌───────────┐",
                  "│#{value_on_card.ljust(2)}         │",
                  "│           │",
                  "│           │",
                  "│     #{suit}     │",
                  "│           │",
                  "│           │",
                  "│         #{value_on_card.rjust(2)}│",
                  "└───────────┘"]
  end

  def value_on_card
    if @name.length < 3
      @name
    else
      @name[0]
    end
  end
end

