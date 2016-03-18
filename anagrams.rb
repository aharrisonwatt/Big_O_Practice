require 'byebug'

#time: permutation => O(n * n!)
#space: perm => O(n!)
def first_anagram?(str1, str2)
  letters = str1.split("")
  perms = letters.permutation.to_a.map {|el| el.join("")}
  return true if perms.include?(str2)
  false
end

#time => O(n^2)
#space => O(2n)
def second_anagram?(str1, str2)
  string1_letters = str1.split("")
  string2_letters = str2.split("")
  idx1 = 0
  idx2 = 0

  until idx1 == string1_letters.length
    while idx2 < string2_letters.length
      if string1_letters[idx1] == string2_letters[idx2]
        string1_letters.delete_at(idx1)
        string2_letters.delete_at(idx2)
        idx1 -= 1
      else
        idx2 += 1
      end
    end
    idx1 += 1
    idx2 = 0
  end

  return true if string1_letters.length == 0 && string2_letters.length == 0
  false
end

#time => O(n log(n))
#space => O(n)
def third_anagram?(str1,str2)
  return true if str1.split("").sort == str2.split("").sort
  false
end

#time => O(n)
#space => O(1)
def fourth_anagram?(str1,str2)
  letters = Hash.new(0)

  str1.each_char do |char|
    letters[char] += 1
  end

  str2.each_char do |char|
    letters[char] -= 1
  end

  letters.all? {|_,v| v == 0 }
end
