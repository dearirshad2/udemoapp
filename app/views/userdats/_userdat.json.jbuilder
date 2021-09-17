json.extract! userdat, :id, :fullname, :dob, :vaccination, :gender, :bloodgroup, :created_at, :updated_at
json.url userdat_url(userdat, format: :json)
