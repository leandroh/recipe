module Recipe
  class Parser
    def self.import(file)
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
