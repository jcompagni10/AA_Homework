// window.setTimeout(function(){alert.log("hammertime")}, 5000)
//
//
// function hammerTime(time){
//   cb = function(){
//     console.log(`${time} is hammertime`)
//   }
//   window.setTimeout(cb, time)
// }


//
// reader.question('Would you like some tea?',function(firstAns){
//   reader.question('Would you like some biscuits?',function(secondAns){
//     console.log(`So you ${firstAns} want tea and you ${secondAns} want coffee.`)
//     reader.close()
//   })
// })


// function teaAndBiscuits () {
//   let first, second;
//
//   reader.question('Would you like some tea?', (res) => {
//     first = res;
//     console.log(`You replied ${res}.`);
//
//   reader.question('Would you like some biscuits?', (res) => {
//     second = res;
//     console.log(`You replied ${res}.`);
//   });
// });
//
//   const firstRes = (first === 'yes') ? 'do' : 'don\'t';
//   const secondRes = (second === 'yes') ? 'do' : 'don\'t';
//   console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
//   reader.close();
// }

// teaAndBiscuits()

function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();
