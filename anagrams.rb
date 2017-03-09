

def anagram?(string1, string2)

all_anagrams(string1).include?(string2)

end

def all_anagrams(string)
  return [string] if string.length <= 1

  last_letter = string[-1]

  previous_anagrams = all_anagrams(string[0...-1])
  anagrams = []

  previous_anagrams.each do |ana|
    (ana.length+1).times do |idx|
      anagrams << (ana[0...idx] + last_letter + ana[idx..-1])
    end
  end

  anagrams
end

# complexity n!

# p all_anagrams("hello").length
# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true

def second_anagram?(string1, string2)
  return false if string1.length != string2.length
  letters1, letters2 = string1.chars, string2.chars

  letters1.each do |letter|
    idx = letters2.index(letter)
    return false unless idx
    letters2.delete_at(idx)
  end

  letters2.empty?
end

#time complexity: n^2, space complexity: 2n ==> n

# p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("ellvis", "livess")
p second_anagram?("elvis", "lives")


def third_anagram?(string1, string2)

  letters1 = string1.split("").sort
  letters2 = string2.split("").sort

  letters1 == letters2

end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")

def fourth_anagram?(string1, string2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  string1.split("").each do |letter|
    hash1[letter] += 1
  end

  string2.split("").each do |letter|
    hash2[letter] += 1
  end
  hash1 == hash2
end

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")

def fifth_anagram?(string1, string2)
  hash = Hash.new { }

  string1.split("").each do |letter|
    if hash[letter]
      hash[letter][0] += 1
    else
      hash[letter] = [1,0]
    end
  end

  string2.split("").each do |letter|
    if hash[letter]
      hash[letter][1] += 1
    else
      hash[letter] = [0,1]
    end
  end

  hash.values.all? { |el| el[0] == el[1] }
end

# p fifth_anagram?("gizmo", "sally")    #=> false
# p fifth_anagram?("elvis", "lives")
