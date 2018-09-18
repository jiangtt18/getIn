# Suppose a hash representing a directory.
# All keys are strings with names for either folders or files.
# Keys that are folders point to nested hashes.
# Keys that are files point to "true".
# Write a function that takes such a hash and returns an array of strings
# with the path to each file in the hash.


files = {
  'a' => {
    'b' => {
      'c' => {
        'd' => {
          'e' => true
        },

        'f' => true
      }
    }
  }
}


def hashDic(dic)
  result = []
  stepIn(dic,[],result);
  result
end


def stepIn(dic,temp,result)
  puts dic
  if dic == true
    result << temp.dup
    return
  end

  dic.each_key do |key|
    temp << key
    stepIn(dic[key],temp,result)
    temp.pop
  end
end


file_list(files) # => ['a/b/c/d/e', 'a/b/c/f']
