$(document).ready(function(){
  if($("#finish_registration").length == 1){

    //Find elements
    var group_select = $("#group_select");
    var course_select = $("#course_select");
    var groups = $("#groups-container").find("[data-groups]").data("groups");

    //Define functions
    var emptyGroups = function(){
      group_select[0].innerHTML = "";
    }

    var fillGroups = function(selected_course_id){
      var groups_of_course = _.select(groups, function(group){
        return group.course_id.toString() === selected_course_id;
      })
      _.each(groups_of_course, function(group){
        group_select[0].appendChild(new Option(group.values[0], group.values[1].toString()))
      })
      //Update chosen select
      group_select.trigger("chosen:updated");
    }

    //Add chosen
    group_select.chosen({
      no_results_text: "No hay resultados para"
    });
    course_select.chosen({
      no_results_text: "No hay resultados para"
    });

    //Populate group select on load
    emptyGroups();
    fillGroups($("#course_select")[0].value);

    //Every time course select changes, populate group select
    $("#course_select").on("change", function(e){
      emptyGroups();
      var selected_course_id = e.target.selectedOptions[0].value;
      fillGroups(selected_course_id);
    })
  }
})
