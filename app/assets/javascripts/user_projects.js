$(function(){
var lastProjectselected;
// Initialize instruction window with currentInst value saved to the user_project database (defaults to 1 if this is a new user_project).
  changeInstruction(gon.user_proj.currentInst);
  $('#thisInst').text(gon.user_proj.currentInst);
  $('#repeatstotal').val(gon.user_proj.totalRep);
  $('#repeatsdone').val(gon.user_proj.repDone);
  $('#repeatstodo').val(gon.user_proj.totalRep-gon.user_proj.repDone);

  var totalInsts = parseInt($('#totalInsts').text());
  var thisInst = parseInt($('#thisInst').text());


// Button to show next instruction
    $('#nextInst').click(function(){
      if(thisInst < totalInsts) {
      thisInst++;
      var currOrdinal = thisInst;
      changeInstruction(currOrdinal);
      String(thisInst);
      $('#thisInst').text(thisInst);
      $('#repeatstotal').val(0);
      $('#repeatsdone').val(0);
      $('#repeatstodo').val(0);
      }
      else $('#projDoneModal').modal();
      // alert("You've reached the last instruction for this project.");
    });


// Set "repeatstodo" to "repeatstotal" and "repeatsdone" to zero, whenever "repeatstotal" value is changed
    $('#repeatstotal').change(function(){
      $('#repeatstodo').val($('#repeatstotal').val());
      $('#repeatsdone').val(0);
    });

// Reset counter button
    $('#resetcounts').click(function(){
        $('#repeatstotal').val(0);
        $('#repeatsdone').val(0);
        $('#repeatstodo').val(0);
      });

// Button to show previous instruction
    $('#prevInst').click(function(){
      if(thisInst > 1) {
      thisInst--;
      var currOrdinal = thisInst;
      changeInstruction(currOrdinal);
      String(thisInst);
      $('#thisInst').text(thisInst);
      $('#repeatstotal').val(0);
      $('#repeatsdone').val(0);
      $('#repeatstodo').val(0);
      }
      else alert("You've reached the first instruction for this project.");
    });

// Button to increase row count
   $('#upcount').click(function() {
      var totalRep = parseInt($('#repeatstotal').val());
      var repsDone = parseInt($('#repeatsdone').val());
      var repsTodo = totalRep - repsDone; //get value from repstotal and repsdone,
      if (repsDone >= totalRep) {
        alert("Uh-oh, looks like you've done " + (repsDone - totalRep + 1) + " too many repeats.");
        repsDone++;
        repsTodo=0;
      }
      else if (repsDone == totalRep-1) {
        repsDone++;
        repsTodo = totalRep - repsDone;
        $('#repDoneModal').modal();
      }
      else {
        repsDone++;
        repsTodo = totalRep - repsDone;
      }
      String(repsDone);
      String(repsTodo);
      $('#repeatsdone').val(repsDone);
      $('#repeatstodo').val(repsTodo);

    });

// Button to decrease row count
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

// Button to save current project status (instruction, repeat row info if applicable)
// Makes ajax call to send data from browser to database
  $('#savePlace').click(function() {
    var inst = $('#thisInst').text();
    var tots = $('#repeatstotal').val();
    var done = $('#repeatsdone').val();
    $.ajax( {
      url: "/users/" + gon.user_proj.user_id + "/user_projects/" + gon.user_proj.id,
      type: "PUT",
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      // beforeSend added based on Stack Overflow regarding 'cannot authenticate csrf token' error
      contentType: 'application/json',
      data: JSON.stringify({currentInst: inst, totalRep: tots, repDone: done})
    })
    .done(function(inst, tots, done) {
      // alert('Your settings for this project have been saved.')
      $('#savedModal').modal();
    });
  });

// "Select Project" function to grab project id from li id tag when selected, and input that to the project id text box on the "Create new user project" page
  $('#ulprojlist').on('click', "li", function(event) {

    if (lastProjectselected){
      $(lastProjectselected).removeClass('selected')};
    $('#user_project_project_id').val($(this).attr("id"));
    $(this).addClass('selected');
    lastProjectselected = this;
  });



// Function to pull current instruction from database, parse it to create new numbered line after each period, comma or semi-colon.
  function changeInstruction(currOrdinal){
    $.ajax( {
        url: "/users/" + gon.user_proj.user_id + "/user_projects/" + gon.user_proj.id + ".json",
        type: "get"
    } ).done(function(data) {
      var instToPrint = data[currOrdinal-1].instext;
      instToPrint = instToPrint.replace(/[,]/g, ',</li><li>').replace(/[.]/g, '.</li><li>').replace(/[;]/g, ';</li><li>');
      $('.patterntable').empty();
      $('.patterntable').html("<ol><li>" +instToPrint + "</ol>");
    });
  };

});