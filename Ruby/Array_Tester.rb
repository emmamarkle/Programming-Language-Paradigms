
class OriginalTester
  def self.run
    array1 = [1,2,3,4,5]
    array2 = Array.new(array1)
    array3 = Array.new(3, true)
    puts ""
    puts "ARRAYS:"
    puts "Array1: #{array1}"
    puts "Array2: #{array2}"
    puts "Array3: #{array3}"
    puts "Array3 after adding an element: #{array3.push(false)}"

    puts "TESTING METHODS ON ARRAYS"
    puts "Testing '==' method on array1 and array2: #{array1 == array2}"
    puts "Testing '.equal?' method on array1 & array2: #{array1.equal? array2}"
    puts "Testing '.equal?' method on array1 & array1: #{array1.equal? array1}"

    puts "METHODS FROM ARRAY CLASS TESTED"
    puts "Index of -1 in array: #{array1[-1]}"
    puts "Popped off element: #{array1.pop}"
    puts ""
  end
end

OriginalTester.run

class Array
  alias_method :original_brackets, :[]
  def [](ind)
   if ind < 0 || ind >= self.size
     return "This index is not allowed"
   else
     original_brackets(ind)
   end
  end

  alias_method :original_pop, :pop
  def pop
    if self.empty?
      nil
    else
      first_elem = self[0]
      self.delete_at(0)
      first_elem
    end
  end
end


class NewTester
  def self.run
    array1 = [1,2,3,4,5]
    puts "AFTER ALTERING ARRAY CLASS"
    puts "Array: #{array1}"
    puts "Index of -1 in array: #{array1[-1]}"
    puts "Popped off element: #{array1.pop}"
    puts ""
  end
end

NewTester.run 

