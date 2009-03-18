module Recipe
  class Container
    attr_writer :name

    def initialize(name=nil)
      @name = name
      @items = []
    end

    def <<(item)
      @items.push(item)
    end
    
    def to_s
      "#{@name}\n#{collection}\n\n"
    end
    
    private 
    
    def collection
      @items.join("\n")
    end
  end
end
