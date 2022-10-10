# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty? 
    self.sum / (self.length * 1.0)
  end

  def median
    return nil if self.empty?
    sorted = self.sort

    if sorted.length.odd?
        sorted[self.length/2]
    else
        (sorted[self.length/2] + sorted[(self.length/2) - 1]) / (2 * 1.0)
    end
  end  

    def counts
        count = Hash.new(0)
        self.each { |ele| count[ele] += 1 }
        count
    end

    def my_count(num)
        count = 0 
        self.each { |ele| count +=1 if num == ele }
        count
    end

    def my_index(val)
        self.each_with_index do |ele, i|
            if ele == val
                return i
            end
        end
        nil 
    end

    def my_uniq
        uniq = []
        self.each do |ele|
            if !uniq.include?(ele)
                uniq << ele
            end
        end
        uniq
    end

    def my_transpose
        two_d = Array.new(self.length) {Array.new(self[0].length)}
        self.each_with_index do |row, i|
            row.each_with_index do |ele, j|
                two_d[j][i] = ele
            end
        end
        two_d
    end
    
end


