
//function to alternate the list item backgrounds.  would this be a children reference, or do we assign background color when breaking up the text?



//function to increment instruction by 1, first initialize instruction counter to ordinal, then increment by 1, then use that value to pull the next instruction.

$('thisInst')
$('totalInsts')
var currOrdinal = 0;

$('nextInst').on('click', function(){
  if (currOrdinal < totalInsts) {
    currOrdinal++}
  else {currOrdinal = totalInsts}
$('thisInst').value(currOrdinal)
changeInstruction(currOrdinal);
})

$('prevInst').on('click', function(){
  if (currOrdinal>1) {
    currOrdinal--}
  else {currOrdinal = 1}
$('thisInst').value(currOrdinal);
changeInstruction(currOrdinal);
})


function changeInstruction(currOrdinal){

  $.ajax( {
      url: "/users/" + current_user.id + "/user_project/" + user_project.id,
      type: "get"
  } ).done(function(data) {
    showText=generateInstHTML(data[currOrdinal-1].insText)
    $('.patterntable').empty();
    $('.patterntable').append('<p>'+ showText + ' </p>')
  }
} ;

function generateInstHMTL(text){
// function to make new line after (, or . or ;).  Add </li><li> to html to make a new line?
}