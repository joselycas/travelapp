

$(document).ready(function() { 
  console.log("this is loaded")
   indexClickListener()
   showClickListener()
 });

function indexClickListener() {
  $("button.get-trips").on("click", function(event){
    event.preventDefault()
    getTrips()
  })

};


function showClickListener() {
  $(document).on("click", "#show-trip", function(event) {
    event.preventDefault()
    alert("hiiii")
    debugger
    let id = $(this).attr('data-id')
   fetch(`/trips/${id}.json`)
   .then(res => res.json())
   .then(trip => {
     console.log(trip)

   });
 });
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
  return `<div>
          <a href = 'http://localhost:3000/trips/${this.id}' data-id='${this.id}' id='show-trip'> <h2>${this.description}</h2></a>

        </div>`
}

Trip.prototype.postShowHTML = function () {
  return `<div>

        <h1>${this.start_date}<h1>
        </div>`
}
