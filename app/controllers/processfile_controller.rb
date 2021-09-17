class ProcessfileController < ApplicationController
  
  
  def csv
  	require("pp")
  	require("csv")
  	require("date")
  	tmp 			= params[:file].tempfile
	destiny_file 	= File.join('public', 'uploads', DateTime.now.to_s+params[:file].original_filename)
	FileUtils.move tmp.path, destiny_file

	input 			=  File.open(destiny_file)
	i				=  0;
	
	bloodgroup		= ["A+", "A-","B+", "B-","O+", "O-","AB+","AB-"]
	success			= "1"
	message			= ""
	tmp				= []
	CSV.foreach(input.path) do |row|
	  inlineSucses	= 1
	  if i > 0	
	  	begin
	  		if(!DateTime.strptime(row[1], '%d.%m.%Y'))
	  			message.concat("DOB not valid at index "+i.to_s+"<br>")
	  			success	= "0"
	  			inlineSucses = 0
	  		end
		rescue ArgumentError
		  	message.concat("DOB not valid at index  "+i.to_s+"<br>")
	  		success	= "0"
	  		inlineSucses = 0
	  	end
	  	
	  	begin
	  		if(!DateTime.strptime(row[2], '%d.%m.%Y %H:%M:%S'))
	  			message.concat("Vaccination timestamp not valid at index  "+i.to_s+"<br>")
	  			success	= "0"
	  			inlineSucses = 0
	  		end
		rescue ArgumentError 
		  	message.concat("Vaccination timestamp not valid at index  "+i.to_s+"<br>")
	  		success	= "0"
	  		inlineSucses = 0
	  	end
	  
	  	if(!bloodgroup.include?(row[4]))
	  		message.concat(",Blood group is not valid at index  "+i.to_s+"<br>")
	  		success	= "0"
	  		inlineSucses = 0
	  	end
	  	
	  	tmp << row
	  	
	  end
	  i 	= i+1
	  
	  
	end
	
	if success == "1"
		for item in tmp 
			udata	= Userdat.new(fullname:item[0],dob:item[1],vaccination:item[2],gender:item[3],bloodgroup:item[4])
			udata.save
		end
		
	end
		
	
	resp			= ["success"=> success,"message"=>message]
	@response		= resp.to_json.html_safe
	
  end
  
  
  
  def dbcount
  
  		udata		= "<table align='center' class='output'>"
  		
  		tmp			= "<tr>"
		tmp			= tmp+"<th>ID</th>"
		tmp			= tmp+"<th>FullName</th>"
		tmp			= tmp+"<th>DOB</th>"
		tmp			= tmp+"<th>Vaccination</th>"
		tmp			= tmp+"<th>Gender</td>"
		tmp			= tmp+"<th>Bloodgroup</th>"
		tmp			= tmp+"<th>Creation Date</th>"
		tmp			= tmp+"</tr>"
		
		udata.concat(tmp);
  		
  		
  		Userdat.find_each(batch_size: 10000).with_index do |user, index|
  			tmp		= "<tr>"
  			tmp		= tmp+"<td>"+user.id.to_s+"</td>"
  			tmp		= tmp+"<td>"+user.fullname.to_s+"</td>"
  			tmp		= tmp+"<td>"+user.dob.to_s+"</td>"
  			tmp		= tmp+"<td>"+user.vaccination.to_s+"</td>"
  			tmp		= tmp+"<td>"+user.gender.to_s+"</td>"
  			tmp		= tmp+"<td>"+user.bloodgroup.to_s+"</td>"
  			tmp		= tmp+"<td>"+user.created_at.to_s+"</td>"
  			tmp		= tmp+"</tr>"
  			
  			udata.concat(tmp)
		end
		udata.concat("</table>")
		
  		@response	= udata.html_safe
  
  end	

end
