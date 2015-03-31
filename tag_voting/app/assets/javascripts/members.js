$(document).ready(function(){
  if($(".checkbox").length !== 0){
    $.each($(".checkbox"), function(index, value){
      value.addEventListener("click", submitForm);
    });
  }
});

var submitForm = function(ev){
  var formData = {}
  formData[production_id] = this.parentNode.children[0].value;
  formData[ballot_id] = this.parentNode.children[1].value;
  $.ajax({
    type: 'POST',
    url: '/vote/update_show',
    dataType: 'json',
    data: [this.parentNode]  // or whatever your new position is
  });
  ;
}