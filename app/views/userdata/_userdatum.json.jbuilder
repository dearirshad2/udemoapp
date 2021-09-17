json.extract! userdatum, :id, :fullname, :dob, :vaccination, :gender, :bloodgroup, :created_at, :updated_at
json.url userdatum_url(userdatum, format: :json)
