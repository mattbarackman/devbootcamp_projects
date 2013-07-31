require_relative 'app'
require 'awesome_print'

# prepare the database for testing
system("rm db/students.db; rake db:setup; rake db:seed")

# tests
ap "Student"
ap Student.all.count == 2000
ap Student.all.first[:id] == 1
ap Student.all.first[:first_name] != nil
ap Student.all.first[:last_name] != nil
ap Student.all.first[:email] != nil
ap Student.all.first[:gender] != nil
ap Student.all.first[:birthdate].class == Date
ap Student.all.first[:created_at].class == DateTime
ap Student.all.first[:updated_at].class == DateTime

ap "Cohort"
ap Cohort.all.count == 9
ap Cohort.all.first[:id] == 1
ap Cohort.all.first[:name] != nil
ap Cohort.all.first[:created_at].class == DateTime
ap Cohort.all.first[:updated_at].class == DateTime

ap "All tests passed."

