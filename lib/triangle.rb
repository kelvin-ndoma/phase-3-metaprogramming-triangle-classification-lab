class Triangle
  
  attr_accessor :side1, :side2, :side3

  # Define the  Triangle class 
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  # Define the kind method to get the type of the triangle and Check if the triangle is valid
  def kind
    valid_triangle
    # Determin the type of the triangle based on its sides
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side3 == side1
      :isosceles
    else
      :scalene
    end
  end

  # Define the triangle_with_no_sides method to check if all sides are positive
  def triangle_with_no_sides
    [side1, side2, side3].all?(&:positive?)
  end

  # Define the triangle_inequality method to check if the sides satisfy the triangle inequality
  def triangle_inequality
    side1 + side2 > side3 && side2 + side3 > side1 && side3 + side1 > side2
  end

  # Define the valid_triangle method to check if the triangle is valid
  def valid_triangle
    raise TriangleError unless triangle_inequality && triangle_with_no_sides
  end

  # Define the TriangleError class to handle invalid triangles
  class TriangleError < StandardError
  end
end

# Create a triangle with sides 3, 3, and 3 and 4, 5, and 6
triangle = Triangle.new(3, 3, 3)
# triangle = Triangle.new(4, 5, 6)
 puts triangle_type = triangle.kind

puts "The triangle is #{triangle_type}"

