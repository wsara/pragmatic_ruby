require_relative "project"
require_relative "project_list"



project1 = Project.new("boner eraser", 500, 510)
project2 = Project.new("hug fountain", 25, 40)
project3 = Project.new("bonsai kittens", 400, 4000)
project4 = Project.new("makin' bacon pancakes", 50, 50)

my_list = Project_List.new("The best projects", "Sara")
my_list.add(project1)
my_list.add(project2)
my_list.add(project3)
my_list.add(project4)
my_list.list
my_list.list_by_funded
my_list.high_to_low
