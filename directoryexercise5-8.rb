def input_students
  # (exercise 5 and 7, allows for more information to be stored + some input validation)
  puts "You will now enter student information:"
  students = []
  check = true
  while check == true

    puts "Enter student (Y/N)"
    user_input = gets.chomp
    if user_input == "Y"
      studentsetup = true
      while studentsetup == true

        name = ""
        cohort = ""
        hobby = ""
        danger_level = ""

        puts "Student name:"
        checkname = gets.chomp

        puts "Student cohort: (november/october)"
        checkcohort = gets.chomp

        puts "Student hobby: (letters and spaces only)"
        checkhobby = gets.chomp

        puts "Student danger level: (S,A,B,C,D)"
        checkdanger_level = gets.chomp

        valid = 0

        if !checkname.empty?
          name = checkname
        else
          puts "Name is not valid."
          valid += 1
        end

        if checkcohort == "november" || checkcohort == "october"
          cohort = checkcohort.to_sym
        else
          puts "Cohort is not valid."
          valid += 1
        end

        if !checkhobby.empty?
          hobby = checkhobby.delete(" ").to_sym
        else
          puts "Hobby is not valid."
          valid += 1
        end

        if checkdanger_level == "S" || checkdanger_level == "A" || checkdanger_level == "B" || checkdanger_level == "C" || checkdanger_level == "D"
          danger_level = checkdanger_level.to_sym
        else
          puts "Danger level not valid."
          valid += 1
        end

        if valid == 0
          students << {name: name, cohort: cohort, hobby: hobby, danger_level: danger_level}
          puts "Now we have #{students.count} students"
          studentsetup = false
        end

      end

    elsif user_input == "N"
      check = false

    end
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------".center(32) #(exercise 6)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (Cohort: #{student[:cohort]}, Hobby: #{student[:hobby]}, Danger Level: #{student[:danger_level]})"
  end
end

# (exercise 8) method to sort students into different groups (by cohort)
def print_by_cohort(students)

  nov = []
  oct = []

  students.each do |student|
    if student[:cohort] == :november
      nov << student
    else
      oct << student
    end
  end

  puts "November students:"
  print(nov)
  puts "October students:"
  print(oct)

end

def print_footer(names)
  puts "Overall, we have #{names.count} great student(s)" # (exercise 9) simple fix (see directoryexercise9-10.rb)
end

students = input_students
print_header
print(students)
print_footer(students)
print_by_cohort(students)
