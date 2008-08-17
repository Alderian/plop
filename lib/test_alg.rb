class Ord
  attr_accessor :changed_input
  attr_accessor :elements
  def initialize(elements)
    @elements = elements
  end
  def parse(changed_input)
    puts "-----------------"
    puts "elements:"
    puts @elements
    
    new_elements = []
    @elements.each do |e|
      if changed_input.include?(e)
        new_elements << e
      end
    end
    @elements = new_elements
    puts "-----------------"
    puts elements
    puts "-----------------"
  end
  def delete_recursively(changed_input,start=0)
    elements[start..-1].each_with_index do |e,i|
      unless changed_input.include?(e)
        elements.delete_at(i)
        delete_recursively(changed_input,i)
        break
      end
    end
  end
end

elements = %w{Rolando Pedro Juan Fernando}
ord = Ord.new(elements)

puts "Pedro invalido"
sin_pedro = %w{Rolando Pe Juan Fernando}
ord.parse(sin_pedro)

elements = %w{Rolando Pedro Juan Fernando}
ord = Ord.new(elements)
puts "Sin Juan ni Pedro"
sin_juanpedro = %w{Rolando Fernando}
ord.parse(sin_juanpedro)

elements = %w{Rolando Pedro Juan Fernando}
ord = Ord.new(elements)
puts "Sin nada"
sin_juanpedro = %w{Ro la ndo Fe rn ando}
ord.parse(sin_juanpedro)


