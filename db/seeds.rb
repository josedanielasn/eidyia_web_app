# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

batch   = Batch.create(batch_name: 'batchnew')
course  = Course.create(course_name: 'coursenew')
program = Program.create(course_id: course.id, batch_id: batch.id) 
Session.create(session_name: "new_session", program_id: program.id)