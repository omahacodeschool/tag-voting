$(document).ready(function(){
  if($(".checkbox").length !== 0){
    $.each($(".checkbox"), function(index, value){
      value.addEventListener("click", setClick);
    });
  }
});
var clickedBox;
var setClick = function(){
  clickedBox = this.id;
  console.log(clickedBox);
}

$(function() {
  $(document)  
    .ajaxStart(function() {
      $("#" + clickedBox)[0].src = "/assets/loading_spinner.gif"; // show on any Ajax event.
    });
});