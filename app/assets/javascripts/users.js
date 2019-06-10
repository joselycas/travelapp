

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
    data.forEach(trip => {
      let newTrip = new Trip(trip)
      let tripHTML = newTrip.postHTML()
      document.getElementById('post-trips').innerHTML = tripHTML
      console.log(tripHTML)
      debugger
    })
  });

};

class Trip{
  constructor(obj){
    this.id = obj.id
    this.description = obj.description
    this.start_date = obj.start_date
    this.end_date = obj.end_date

  }

}



Trip.prototype.postHTML = function () {
  return (`
    <div>
      <h2>${this.description}</h2>
      <p>${this.start_date} <br>
      ${this.end_date} </p> 
    </div>
  `)

}
//
// postHTML = () => (`
//  <div>
//      <h2>${this.description}</h2>
//      <p>${this.start_date} <br>
//      ${this.end_date}
//    </div>
//  `
// )
