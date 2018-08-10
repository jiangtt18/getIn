const user = {
  username: "sally",
  profile: {
    name: "Sally Clojurian",
    address: {city: "Austin", state: "TX"}
  }
};


// iterative;
function getIn(m,ks,notFound=null){
  let dic = m;
  for(let i = 0; i < ks.length; i++) {
    let key = ks[i];
    if(key in dic){
      dic = dic[key];
    }
    else {
      return notFound === null ? null : notFound;
    }
  }
  return dic;
}

// recursion
function getInRec(m,ks,notFound=null){
  let dic = m;
  let len = ks.length;
  let val = _getInRec(dic,0);
  return val !== undefined ? val : notFound === null ? null : notFound;

  function _getInRec(nextVal, index) {
    if(index === len || nextVal === undefined) return dic;
    let key = ks[index];
    dic = dic[key];
    return _getInRec(dic, index+1);
  }
}

// testcase for interation
console.log(getIn(user,['profile','name']));
console.log(getIn(user,['profile','address', 'city']));
console.log(getIn(user,['profile', 'address', 'zip-code']));
console.log(getIn(user,['profile', 'address', 'zip-code'],"no zip code!"));

// testcase for recusion
console.log(getInRec(user,['profile','name']));
console.log(getInRec(user,['profile','address', 'city']));
console.log(getInRec(user,['profile', 'address', 'zip-code']));
console.log(getInRec(user,['profile', 'address', 'zip-code'],"no zip code!"));
