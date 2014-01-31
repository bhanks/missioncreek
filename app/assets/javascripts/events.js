$(document).ready(function(){

  if($('#calendar_page').length > 0)
  {
    $('body').css("background-color","#fbfbfb");
    $("body").css("font-family","Whitney");
    $("body").css("background","url('/assets/bg-solid.png') no-repeat center 170px");
    $("body").css("background-size","cover");
    $('span.glyphicon-plus-sign').each(function(){
      var event = $(this).closest(".event");
      $(this).on("click", function(){
        console.log($(this));
        if($(this).hasClass("glyphicon-plus-sign"))
        {
          $(this).removeClass("glyphicon-plus-sign");
          $(this).addClass("glyphicon-minus-sign");
          $(".details."+$(event).attr("id")).slideDown(200);
        }
        else
        {
          $(this).addClass("glyphicon-plus-sign");
          $(this).removeClass("glyphicon-minus-sign");
          $(".details."+$(event).attr("id")).slideUp(200);
        }
      });
    }); 
    $(".typeahead.calendar").typeahead(
      {
        name: 'search', 
        valueKey: 'name',
        prefetch: {
          url:'/artists.json?with_event=true',
          ttl: 60000
        },
        template:[
          '<p>{{name}}</p>'
        ].join(''),
        engine: Hogan
      }
    ).on('typeahead:selected', function($e, datum){
      event = $("#event_"+datum.event_id);
      day = $(event).closest('.day');
      $('.day').show();
      $('.event').show();
      $('.day').not(day).hide();
      $('.event').not(event).hide();
      $(event).find('.glyphicon-plus-sign').click();
      $("#clear-typeahead").show();
      resetFilters();
    });
    $("#clear-typeahead").on("click",function(){
      $('.event:visible').find('.glyphicon-minus-sign').click();
      $('.day').show();
      $('.event').show();
      $(".typeahead.calendar").typeahead('setQuery','');
      $('#clear-typeahead').hide();
    });
  }

});


function filterByCategory(category)
{
  var categories=["music", "literature","film","food","misc"]
  var selectors = []
  $(categories).each(function(){
    if( this != category)
      selectors.push(".event."+this);
  });
  if($(".typeahead.calendar").val() != "")
  {
    $(".typeahead.calendar").typeahead('setQuery','');
    $('.day').show();
  }
  $('.event').show();
  $(selectors.join(",")).hide();
  category = category.slice(0,1).toUpperCase() + category.slice(1);
  $("#category-filter").html(category+" <span class='caret'></span>");
  $('#clear-typeahead').hide();
}

function filterByDay(day)
{
  var days = ["monday","tuesday","wednesday","thursday","friday","saturday","sunday"]
  var selectors = []
  $(days).each(function(){
    if( this != day)
      selectors.push(".row."+this);
  });
  $('.day').show();
  if($(".typeahead.calendar").val() != "")
  {
    $(".typeahead.calendar").typeahead('setQuery','');
    $('.event').show();
  }
  $(selectors.join(",")).hide();
  day = day.slice(0,1).toUpperCase() + day.slice(1);
  $("#day-filter").html(day+" <span class='caret'></span>");
  $(".typeahead.calendar").typeahead('setQuery','');
  $('#clear-typeahead').hide();
}

function resetFilters()
{
  $("#day-filter").html("Select a Day <span class='caret'></span>");
  $("#category-filter").html("Select a Category <span class='caret'></span>");
}

