<script type="text/javascript">
	// on document ready, init datatables
	$(document).ready(function() {
    	$('.datatable').DataTable();
	});

	$(".savePost").on('click', function(event) {
		var $postID = $(this).closest('div').find('.postID').val()
		var $postTitle = $(this).closest('div').find('.postTitle').val();
		var $postTags = $(this).closest('div').find('.postTags').val();
		var $postPublished = $(this).closest('div').find('.postPublished').val();
		var $postPostedBy = $(this).closest('div').find('.postPostedBy').val();
		var $postLink = $(this).closest('div').find('.postLink').val();

		var $data = {
			postID : $postID,
			postTitle : $postTitle,
			postTags : $postTags,
			postPublished : $postPublished,
			postPostedBy : $postPostedBy,
			postLink : $postLink
		}

		$.ajax({
			url: 'cfc/savePost.cfc?method=savePost',
			type: 'GET',
			dataType: 'html',
			data: $data,
		})
		.done(function(data) {
			if(data == 'true'){
				console.log("success");
				$("#"+$postID).html('Saved').prop('class', 'btn btn-success btn-xs pull-right'); // change save button text
			}else{
				console.log("error saving post");
			}
		})
		.fail(function() {
			console.log("error saving post");
		})
	
		
		
	});
</script>