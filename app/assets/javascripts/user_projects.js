//function to alternate the list item backgrounds.  would this be a children reference, or do we assign background color when breaking up the text?



//function to increment instruction by 1, first initialize instruction counter to ordinal, then increment by 1, then use that value to pull the next instruction.

// $('thisInst')
// $('totalInsts')
// var currOrdinal = 0;
$(function(){
  var totalInsts = parseInt($('#totalInsts').text());
  var thisInst = parseInt($('#thisInst').text());

  $('#nextInst').click(function(){
    if(thisInst < totalInsts) {
    thisInst++;
    var currOrdinal = thisInst;
    changeInstruction(currOrdinal);
    String(thisInst);
    $('#thisInst').text(thisInst);
    }
    else alert("You've reached the last instruction for this project.");
  });

  $('#prevInst').click(function(){
    if(thisInst > 1) {
    thisInst--;
    var currOrdinal = thisInst;
    changeInstruction(currOrdinal);
    String(thisInst);
    $('#thisInst').text(thisInst);
    }
    else alert("You've reached the first instruction for this project.");
  });


 $('#upcount').click(function() {
    var totalRep = parseInt($('#repeatstotal').val());
    var repsDone = parseInt($('#repeatsdone').val());
    var repsTodo = totalRep - repsDone; //get value from repstotal and repsdone,
    if (repsDone >= totalRep) {
      alert("Uh-oh, looks like you've done one too many repeats.");
    }
    else if (repsDone == totalRep-1) {
      repsDone++;
      alert("Congrats you've finished all repeats");
    }
    else {
      repsDone++;
    }
    repsTodo = totalRep - repsDone;
    String(repsDone);
    String(repsTodo);
    $('#repeatsdone').val(repsDone);
    $('#repeatstodo').val(repsTodo);

  });

 $('#downcount').click(function() {
    var totalRep = parseInt($('#repeatstotal').val());
    var repsDone = parseInt($('#repeatsdone').val());
    var repsTodo = totalRep - repsDone; //get value from repstotal and repsdone,
    if (repsDone ==0) {
      alert("You are already at the beginning of the counter.");
    }
    else {
      repsDone--;
      repsTodo = totalRep - repsDone;
      String(repsDone);
      String(repsTodo);
      $('#repeatsdone').val(repsDone);
      $('#repeatstodo').val(repsTodo);
    }
  });

function changeInstruction(currOrdinal){
  $.ajax( {
      url: "/users/" + gon.user_proj.user_id + "/user_projects/" + gon.user_proj.project_id + ".json",
      type: "get"
  } ).done(function(data) {
    $('.patterntable').empty();
    $('.patterntable').text(data[currOrdinal-1].instext);
  });
};

});


// // function to make new line after (, or . or ;).  Add </li><li> to html to make a new line?
// function generateInstHMTL(text){
//   var lineBreaker = /[,.;]/g;
// while (//there is still text to process)//{
//     $('.patterntable').append('<li>'+ showText + ' </li>')
