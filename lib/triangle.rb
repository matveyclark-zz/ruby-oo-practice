require 'pry'

class Triangle

  attr_accessor :side_one, :side_two, :side_three

  @@all = []

  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
    @@all.push(self)
  end

  def self.all
    @@all
  end

  class TriangleError < StandardError
    def triangle_inequality
      "The sum of the lengths of any two sides of a triangle always exceeds the length
      of the third side."
    end

    def size
      "Triangle must have a size."
    end

    def negative_sides
      "Triangles must not have negative values for sides."
    end 
  end

  def kind
    if self.side_one == 0 && self.side_two == 0 && self.side_three == 0
        raise TriangleError
    elsif self.side_one < 0 || self.side_two < 0 || self.side_three < 0
        raise TriangleError
    elsif self.side_one == self.side_two && self.side_one == self.side_three && self.side_one != 0
      return :equilateral
    elsif self.side_one == self.side_two || self.side_one == self.side_three || self.side_two == self.side_three
      return :isosceles
    elsif self.side_one != self.side_two && self.side_one != self.side_three && self.side_three != self.side_one
      return :scalene
    # elsif self.side_one + self.side_three > self.side_two || self.side_one + self.side_two > self.side_three
    #     raise TriangleError
    end
  end
end



# binding.pry
# 'Start'

    # begin
    #   raise TriangleError
    # rescue TriangleError => error
    #   puts error.message
    # end