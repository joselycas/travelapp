

$(document).ready(function() { 
  console.log("this is loaded")
   indexClickListener()
 });

function indexClickListener() {
  $("button.get-trips").on("click", function(event){
    event.preventDefault()
    getTrips()
  })

};

function newTripFormListener() {
  $("button.new-trip").on("click", function(event){
    event.preventDefault()
    Trip.newTripForm()
  })

};

function getTrips() {
  $.ajax({
    url: "http://localhost:3000/trips",
    method: "get",
    dataType: "json"
  }).done(function(data){
    data.forEach(function(trip){
      console.log(data)
      let newTrip = new Trip(trip)
      $('#post-trips').append(newTrip.postHTML())
      // document.getElementById('post-trips').append(newTrip.postHTML())
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
  return `<li>
          <h2>${this.description}</h2>
          <p>${this.start_date} <br>
          ${this.end_date} </p>
        </li>`
}
