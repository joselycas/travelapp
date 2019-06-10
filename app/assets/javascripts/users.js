

$(document).ready(function() { 
  console.log("this is loaded")
   clickListener()
 });

function clickListener() {
  $("button.get-trips").on("click", function(event){
    event.preventDefault()
    getTrips()
  })

};

function newTripFormListener() {
  $("button.new-trip").on("click", function(event){
    event.preventDefault()
  // alert("hiiii")
    Trip.newTripForm()
  })

};

function getTrips() {
  // fetch('http://localhost:3000/trips')
  // // .then(res => res.json())
  // // .then(data => {
  // //   console.log(data)
  // // })
  $.ajax({
    url: "http://localhost:3000/trips",
    method: "get",
    dataType: "json"
  }).done(function(data){
    console.log(data)
    let trip = new Trip(data)
    let tripHTML = trip.postHTML()
    document.getElementById('post-trips').innerHTML = tripHTML

  });

};

class Trip{
  constructor(obj){
    this.id = obj.id
    this.description = obj.description
    this.start_date = obj.start_date
    this.end_date = obj.end_date
    console.log(obj)
  debugger
  }

}

// function Trip(obj){
//   this.id = obj.id
//   this.description = obj.description
//   this.start_date = obj.start_date
//   this.end_date = obj.end_date
//   console.log(this)
//   debugger
// }


Trip.prototype.postHTML = function () {
  let tripHTML = (`
    <div>
      <h2>${this.description}</h2>
      <p>${this.start_date} <br>
      ${this.end_date}
    </div>
  `)

}
