function createPost()
{
	data = new Object;
	data['post'] = new Object;

	data["post"]['title'] = $(".new_title").val();
	data["post"]['body'] = $("textarea.new_post").val();
//	console.log(data)
	$.ajax({
		url: 'posts',
		type: "POST",
		data: data,
		dataType: "text",
		success: function(msg){
			console.log(msg)
			post = jQuery.parseJSON(msg)
			$(".new_title").val("");
			$("textarea.new_post").val("");
			el = "<li class='post' id='post_"+post['id']+"'>"
			el += "<div class='title'>"+post['title']+"</div>"
			el += "<div class='date'>"+post['date']+"</div>"
			el += "<div class='body'>"+post['body']+"</div>"
			el += "<button class='btn-mini btn-warning edit_post'>Edit</button>"
			el += "<button class='btn-mini btn-danger delete_post'>Delete</button>"
			el +="</li>"
			$(el).hide();
			$(el).prependTo("ul.prev_posts").hide().fadeIn().slideDown()
			$(".delete_post").click(function(){
				deletePost(this);
			})
		}
	});

}

function deletePost(button)
{
	console.log($(button))
	li_id = $(button).parent().attr("id")
	post_id = $(button).parent().attr("id").match(/\d+/)[0]
	if(confirm("Are you sure you want to delete this post?"))
	{
		$.ajax({
			url: '/posts/'+post_id,
			type: "DELETE",
			dataType: "text",
			success: function(msg){
				alert("BUHLETED")
				$("#"+li_id).fadeOut().slideUp()
			}
		})


	}
	else
	{

	}
}


function switchPost(location)
{

	activeMarker = $('a.marker.active')[0]
	activePost = $('p.active')[0]
	
	if(location == 'next')
		targetMarker = $("a.marker.active").next("a.marker")[0]
	else if(location == 'previous') 
		targetMarker = $("a.marker.active").prev("a.marker")[0]
	else
		targetMarker = $("a[data-target="+location+"]")[0]
		

	console.log(targetMarker)	
	if(targetMarker != undefined)
	{
		data = ($(targetMarker).attr("data-target"))
		targetPost = $("#"+data)
		$(activeMarker).attr("class","marker inactive")
		$(targetMarker).attr("class", "marker active")
		$(activePost).fadeOut(500, function(){
			$(activePost).attr("class","post")
			$(targetPost).attr("class","post active")
			$(targetPost).fadeIn(500)
		})
	}


	return false;
}















