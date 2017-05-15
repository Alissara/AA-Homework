def sluggish(array)
  array.each_with_index do |fish1, idx1|
    max = true
    array.each_with_index do |fish2, idx2|
      next if idx1 == idx2
      max = false if fish2.length > fish1.length
    end
    return fish1 if max
  end

end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def nlogn_biggest_fish(fishes)
  prc = Proc.new { |x, y| y.length <=> x.length }
  fishes.merge_sort(&prc)[0]
end

def clever(array)
  big_fish = ''
  array.each do |fish|
    big_fish = fish if fish.length > big_fish.length
  end
  big_fish
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

puts "--------------------"
p sluggish(fish) == "fiiiissshhhhhh"
p nlogn_biggest_fish(fish) == "fiiiissshhhhhh"
p clever(fish) == "fiiiissshhhhhh"

def slow_dance(direction, array)
  array.length.times do |i|
    return i if array[i] == direction
  end
  nil
end

def fast_dance(direction, hash)
  hash[direction]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
new_tiles_data_structure = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

puts "--------------------"
p slow_dance("up", tiles_array) == 0
p slow_dance("right-down", tiles_array) == 3
p fast_dance("up", new_tiles_data_structure) == 0
p fast_dance("right-down", new_tiles_data_structure) == 3
