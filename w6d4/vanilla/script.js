document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  document.getElementsByTagName("form")[0].addEventListener("submit",
  function(e){
    e.preventDefault();
    let input = document.getElementsByClassName("favorite-input")[0].value;
    document.getElementsByClassName("favorite-input")[0].value = "";
    let newLi = document.createElement("LI");
    newLi.innerHTML = input;
    document.getElementById("sf-places").appendChild(newLi);
  });


  // adding new photos
  let button = document.querySelector(".photo-show-button");
  button.addEventListener("click", function(){
    document.querySelector(".photo-form-container").classList.remove("hidden");
  });

  let form2 = document.querySelectorAll("form")[1];
  form2.addEventListener("submit", function(e){
    e.preventDefault();
    let url = document.querySelector(".photo-url-input").value;
    document.querySelector(".photo-url-input").value = "";
    let img = document.createElement("img");
    img.setAttribute('src', url);
    console.log(url);
    let li = document.createElement("li");
    li.append(img);
    document.querySelector(".dog-photos").appendChild(li);

  });

  // --- your code here!



});
