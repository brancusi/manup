admin = User.create(first_name:'Fred', last_name:'Flintstone', email:'ff@bedrock.com', password:'password', password_confirmation:'password')
admin.has_role! :admin
admin.api_key.update(access_token:'admin_token')

viewer = User.create(first_name:'Barney', last_name:'Rubble', email:'br@bedrock.com', password:'password', password_confirmation:'password')
viewer.has_role! :viewer
viewer.api_key.update(access_token:'viewer_token')