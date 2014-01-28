$(document).ready(function(){

  if($('.add-venue'))
  {
    $('.add-venue').click(function(){
      $("#venue-modal").modal();
    });
  }
  if($('.lineup'))
  {
    $('.lineup').sortable().on('sortupdate', function(){
      var inputs = $('input.lineup-order');
      $.each(inputs, function(i){
        $(inputs[i]).val(i);
      });
    });
    var inputs = $('input.lineup-order');
    $.each(inputs, function(i){
      $(inputs[i]).val(i);
    });
  }
  if($('.typeahead.event'))
  {
    groups = ['headliners', 'support']
    $.each(groups, function(index){
      var group = groups[index]
      $('.typeahead.'+group).typeahead(
        {
          name: 'artists', 
          valueKey: 'name',
          prefetch: '/artists.json',
          template:[
            '<p>{{name}}</p>'
          ].join(''),
          engine: Hogan
        }
      ).on('typeahead:selected', function($e, datum){
        added = $('.artist-added');
        current_list = _.map(added, function(i){return $(i).text().trim()})
        if(!_.contains(current_list, datum.name))
        {
          element = "<div class='well well-sm artist-added'>"
          element += '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>'
          element += "<input type='hidden' name='"+group+"["+datum.id+"]' id='"+group+"_"+datum.id+"'/>"+datum.name+"</div>"
          $('.'+group+'-list').append(element);
          $('.typeahead.'+group).typeahead('setQuery','');
          var inputs = $('.'+group+'-list input');
          $.each(inputs, function(i){
            $(inputs[i]).val(i);
          });
        }
        else
        {
          $('.alert').remove();
          element = "<div class='alert alert-danger'>"+datum.name+" has already been added to this show.</div>"
          $('.'+group+'-list').append(element);
          $('.typeahead.'+group).typeahead('setQuery','');
        }
        $('.alert').delay(1000).fadeOut(); 
      });
      $('.'+group+'-list').sortable().on('sortupdate', function(){
        var inputs = $('.'+group+'-list input');
        $.each(inputs, function(i){
          $(inputs[i]).val(i);
        });
      });
    });
    
    $('.tt-query').css('background-color','#fff');
  }

});
