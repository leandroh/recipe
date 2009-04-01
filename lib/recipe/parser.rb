module Recipe
  class Parser
    def self.parse(file)
      file = if file.kind_of?(String)
        IO.read(file)
      else
        file.read
      end
      
      klass = new
      klass.instance_eval(file)
    end

    def initialize
      @recipe = Recipe::Container.new
    end

    def recipe(&block)
      block.call
      @recipe
    end

    def name(recipe_name)
      @recipe.name = recipe_name
    end

    def ingredients(*args)
      args.each do |ingredient|
        @recipe << ingredient
      end
    end
  end
end
