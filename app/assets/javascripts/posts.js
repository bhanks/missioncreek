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
			//console.log(msg)

		}
	});
}