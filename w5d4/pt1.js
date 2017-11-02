function madlib(verb, adj, noun){
  return `we shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`;
}


function isSubstring(searchStr, subStr){
  var isSubstring = false
  for (var i = 0; i < 5; i++){
    for (var j = 0; j < searchStr.length; j++){
      sub = searchStr.slice(i,j)
      if (sub === subStr) {
        var isSubstring = true
        break
      }
    }
  }
  return isSubstring
}


function fizzBuzz(arr){
  var newarr = []
  for (var i = 0; i < arr.length; i++){
    var val = arr[i]
    if (val % 15 != 0 && (val % 3 == 0 || val % 5 == 0)){
      newarr.push(val)
    }
  }
  return newarr
}

function isPrime(val){
  for (var i = 2; i < val; i++){
    if (val % i == 0){
      return false
    }
  }
  return true
}

function sumOfNPrimes(n){
  sum = 0
  i = 0
  j = 2
  while (i < n) {
    if (isPrime(j)){
      sum += j
      i++
    }
    j++
  }
  return sum
}
// console.log(fizzBuzz([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]))
// console.log(isPrime(6))
console.log(sumOfNPrimes(0))
// console.log(isSubstring("fasabcd","abc"))
// console.log(madlib("eat", "dopest", "ramen"))
