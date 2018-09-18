def getIn(m,ks,notFound=nil)
  return _StepIn(m,0,ks, notFound)
end

def _StepIn(m, pointer, arr, notFound=nil)
  key = arr[pointer]
  return notFound unless m.has_key?(key.to_sym)
  return m[key.to_sym] if(pointer === arr.length-1)
  _StepIn(m[key.to_sym], pointer+1, arr,notFound)
end


def getIn(m,ks,notFound=nil)
  dic = m;
  i = 0;
  while i < ks.length
    key = ks[i].to_sym;
    if dic.has_key?(key)
      dic = dic[key]
      return dic if(i === ks.length-1)
    else
      return notFound;
    end
    i=i+1
  end
end

user = {
  username: "sally",
  profile: {
    name: "Sally Clojurian",
    address: {city: "Austin", state: "TX"}
  }
};

puts getIn(user,['profile','name']);
puts getIn(user,['profile','address', 'city']);
puts getIn(user,['profile', 'address', 'zip-code']);
puts getIn(user,['profile', 'address', 'zip-code'],"no zip code!");
