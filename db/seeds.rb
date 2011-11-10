# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

apprenticeships = {
  "Luis Vega"       => "Fred Lee",
  "Arvin Dang"      => "Dave Hoover",
  "Tom Brown"       => "Dave Pick",
  "Alex Bartling"   => "Aaron Kalin",
  "Charles Jackson" => "Ray Hightower",
  "Matt Duff"       => "Jeff Cohen", 
  "Dave Fonvielle"  => "Ryan Briones", 
  "Vince Cabansag"  => "Corey Haines",
  "Mike Verdi"      => "Paul Pagel"
}

students = apprenticeships.keys
mentors = apprenticeships.values
everyone = students + mentors # This line was just way too funny.

create_users = Proc.new do |name|
            first = name.split.first.downcase
            last = name.split.last.downcase
            User.create(:first_name => first.capitalize,
                        :last_name => last.capitalize,
                        :email => first + "@" + last + ".com",
                        :password => first,
                        :password_confirmation => first,
                        :description => "I'm #{first.capitalize} #{last.capitalize}!")
          end

everyone.each { |name| create_users.call name }

i = 0
while (i < apprenticeships.count)
  apprenticeship = Apprenticeship.new
  apprenticeship.student = User.find_by_first_name(students[i].split.first) && User.find_by_last_name(students[i].split.last)
  apprenticeship.mentor = User.find_by_first_name(mentors[i].split.first) && User.find_by_last_name(mentors[i].split.last)
  apprenticeship.save
  i+=1
end