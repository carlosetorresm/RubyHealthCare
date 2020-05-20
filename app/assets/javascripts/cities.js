document.addEventListener("turbolinks:load", function(){
  /*Doctor*/
  var dcountry = document.getElementById("doctor_country");
  var dstate = document.getElementById("doctor_state");
  /*Paciente*/
  var pcountry = document.getElementById("patient_country");
  var pstate = document.getElementById("patient_state");

  if (pcountry != null)
  {
    pcountry.addEventListener("change", function(){
      Rails.ajax({
        url: "/states?pcountry=" + pcountry.value,
        type: "GET"
      })
    })  
    pstate.addEventListener("change", function(){
      Rails.ajax({
        url: "/cities?pcountry=" + pcountry.value + "&pstate=" + pstate.value,
        type: "GET"
      })
    })
  }else{
    dcountry.addEventListener("change", function(){
      Rails.ajax({
        url: "/states?dcountry=" + dcountry.value,
        type: "GET"
      })
    })
    dstate.addEventListener("change", function(){
      Rails.ajax({
        url: "/cities?dcountry=" + dcountry.value + "&dstate=" + dstate.value,
        type: "GET"
      })
    })
  }
})