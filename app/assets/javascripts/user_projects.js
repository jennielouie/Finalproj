console.log(gon.user_proj.project_id)
//function to alternate the list item backgrounds.  would this be a children reference, or do we assign background color when breaking up the text?



//function to increment instruction by 1, first initialize instruction counter to ordinal, then increment by 1, then use that value to pull the next instruction.

// $('thisInst')
// $('totalInsts')
// var currOrdinal = 0;
$(function(){
  $('#nextInst').click(function(){
  var totalInsts = parseInt($('#totalInsts').text());
  var thisInst = parseInt($('#thisInst').text());
  thisInst++;
  String(thisInst);
  $('#thisInst').text(thisInst);
    console.log(thisInst);
    console.log(totalInsts);
  });
});
// $('nextInst').on('click', function(){
//   if (currOrdinal < totalInsts) {
//     currOrdinal++}
//   else {currOrdinal = totalInsts}
// $('thisInst').value(currOrdinal)
// changeInstruction(currOrdinal);
// })

// $('prevInst').on('click', function(){
//   if (currOrdinal>1) {
//     currOrdinal--}
//   else {currOrdinal = 1}
// $('thisInst').value(currOrdinal);
// changeInstruction(currOrdinal);
// })

// //Make ajax call to fetch text of the instruction to display
// function changeInstruction(currOrdinal){
//   $.ajax( {
//       url: "/users/" + gon.user_proj.user_id + /user_projects/" + gon.user_proj.project_id,
//       type: "get"
//   } ).done(function(data) {
//     $('.patterntable').empty();
//     generateInstHTML(data[currOrdinal-1].insText)
//   }
// };

// // function to make new line after (, or . or ;).  Add </li><li> to html to make a new line?
// function generateInstHMTL(text){
//   var lineBreaker = /[,.;]/g;
// while (//there is still text to process)//{
//     $('.patterntable').append('<li>'+ showText + ' </li>')
// }
// }
// }