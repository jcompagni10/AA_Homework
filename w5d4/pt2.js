function titleize(arr, callback){
  titles = arr.map(function(x){
    return `Mx. ${x} Jingleheimer Schmidt`
  })
  callback(titles)
}

// titleize(["joe", "jen"], function(x){console.log(x)})

function Elephant(name, height, tricks){
  this.name=name;
  this.height= height;
  this.tricks= tricks;
}

Elephant.prototype.trumpet = function(){
  console.log(`${this.name} the elephant goes phRRRRRRRR`)
}

Elephant.prototype.grow = function(){
  this.height += 5;
}

Elephant.prototype.addTrick = function(trick){
  this.tricks.push(trick);
}

Elephant.prototype.play = function(){
  rand = Math.ceil((Math.random() * this.tricks.length))-1
  return this.tricks[rand]
}

Elephant.paradeHelper = function(elephant){
  console.log(`${elephant.name} comes tooting by!`)
}


let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];



function dinerBreakfast(){
  var fullOrder = "start"
  function addmore(order){
    fullOrder += order
    console.log(fullOrder)
  }
  return addmore
}
