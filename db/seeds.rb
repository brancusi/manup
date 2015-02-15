admin = User.create(first_name:'Fred', last_name:'Flintstone', email:'ff@stonemail.com', password:'password')
admin.has_role! :admin

viewer = User.create(first_name:'Barney', last_name:'Rubble', email:'br@stonemail.com', password:'password')
viewer.has_role! :viewer