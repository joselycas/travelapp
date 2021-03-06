

$(document).ready(function() { 
  console.log("this is loaded")
   indexClickListener()
   alphaClickListener()
   showClickListener()
   newTripForm()

 });

function Trip(obj){
    this.id = obj.id
    this.description = obj.description
    this.start_date = obj.start_date
    this.end_date = obj.end_date
    this.activities = obj.activities

}

function indexClickListener() {
  $("button.get-trips").on("click", function(event){
    event.preventDefault()
    getTrips()
  })

};

function alphaClickListener() {
  $("button.sorted-trips").on("click", function(event){
    event.preventDefault()

    getTripsAlphabetically()
  })

};


function showClickListener() {
  $(document).on("click", "#show-trip", function(event) {
    event.preventDefault()
    let id = $(this).attr('data-id')
   fetch(`/trips/${id}.json`)
   .then(res => res.json())
   .then(trip => {
     let newTrip = new Trip(trip)
     console.log(newTrip)
     $('#trip-details').append(newTrip.postShowHTML())
   });
 });
};



function newTripForm() {
  $("#new_trip").on("submit", function(event){
    event.preventDefault()
   const values = $(this).serialize()
   $.post("/trips", values)
   .done(function(data) {
     $("#app-container").html("")
    const newTrip = new Trip(data)
    $("#app-container").html(newTrip.postShowHTML())
   });
 });
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

    })
  });
};

function getTripsAlphabetically() {
  $.ajax({
    url: "http://localhost:3000/trips",
    method: "get",
    dataType: "json"
  }).done(function(trips){
    trips.sort(function(a,b){
      var nameA = a.description.toUpperCase();
      var nameB = b.description.toUpperCase();
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
        return 0;
    });

    trips.forEach(function(trip){
      let newTrip = new Trip(trip)
      $('#post-trips').append(newTrip.postHTML())

    })
  });
};



Trip.prototype.postHTML = function () {
  return `<div>
          <a href = "http://localhost:3000/trips/${this.id}" data-id="${this.id}" id="show-trip"> <h2>${this.description}</h2>
          </a>
          </div>
      `

}

Trip.prototype.postShowHTML = function () {
const activity = this.activities.map(activity => activity.name);


  return `<div>
        <p>Description -  ${this.description}
        <p>Start date -  ${this.start_date}</p>
        <p>End date -  ${this.end_date}</p>
        <p>Activities - ${activity} </p>
        </div>`
}
