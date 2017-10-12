def sluggish_octopus(fish)
  biggest_fish = fish.first
  (0...fish.length-1).each do |f1|
    (1...fish.length).each do |f2|
      fish1 = fish[f1]
      fish2 = fish[f2]
      bigger_fish = fish1.length > fish2.length ? fish1 : fish2
      biggest_fish = bigger_fish if bigger_fish.length > biggest_fish.length
    end
  end
  biggest_fish
end

def dominant_octopus(fish)
  return fish.first if fish.length < 2
  len = fish.length
  left_fish = [dominant_octopus(fish.take(len / 2))]
  right_fish = [dominant_octopus(fish.drop(len / 2))]
  merge(left_fish, right_fish).last
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    case left.first.length <=> right.first.length
    when -1
      result << left.shift
    when -1
      result << left.shift
      result << right.shift
    when 1
      result << right.shift
    end
  end
  result + left + right
end

def clever_octopus(fish)
  biggest_fish = fish.first
  big_len = biggest_fish.length
  fish[1..-1].each do |fish|
    f_len = fish.length
    if f_len > big_len
      biggest_fish = fish
      big_len = f_len
    end
  end
  biggest_fish
end

def slow_dancing_octopus(dir, tiles)
  tiles.index(dir) + 1
end

def constant_dancing_octopus(dir, tiles)
  tiles[dir]
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'].shuffle!

p sluggish_octopus(fish)
p dominant_octopus(fish)
p clever_octopus(fish)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = {"up"=>1, "right-up"=>2, "right"=>3, "right-down"=>4, "down"=>5, "left-down"=>6, "left"=>7,  "left-up"=>8 }
p slow_dancing_octopus("left-up", tiles_array)
p constant_dancing_octopus("left-up", tiles_hash)
