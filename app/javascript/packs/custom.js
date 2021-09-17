$(document).ready(function(){
	
	$('#browse').change(function(){
		$(".ftext").html('File is selected');
		$("#message").html('');
		$("#message").hide();
	})

	$('#upload').click(function(){
	$(".overlay").show();
	var formData = new FormData();
    formData.append('file', $('#browse')[0].files[0]);
    $.ajax({
        type: "POST",
        url: '/upload',
        data: formData,
        processData: false, // tell jQuery not to process the data
        contentType: false, // tell jQuery not to set contentType
        success: function (data) {
            console.log(data);
            $(".overlay").hide();
            
            var json 	= JSON.parse(data);
            json		= json[0];
            $("#message").show();
            if(json['success'] == "1")
            {
            		$("#message").html('Data uploaded successfully...');
            		$("#message").removeClass('error');
            		$("#message").addClass('success');
            }
            else if(json['success'] == "0")
            {
            		$("#message").html(json['message']);
            		$("#message").removeClass('success');
            		$("#message").addClass('error');
            }
            
        },
        error: function (xhr, ajaxOptions, thrownError) {
        	$(".overlay").hide();
        	$("#message").hide();
        }
    })
	
})


})


