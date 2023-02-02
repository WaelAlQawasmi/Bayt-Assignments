# set name "wael";
# set value 105;
# puts "Hi $name your salary $value";
# puts "thanks $name ";
# set a 10;
# set b 20;
# set d [expr "$b-$a"]
# puts "$d"

set a 100

#check the boolean condition 
# if {$a < 20 } {
#    #if condition is true then print the following 
#    puts "a is less than 20"
# } else {
#    #if condition is false then print the following 
#    puts "a is not less than 20"
# }
# puts "value of a is : $a"

set fp [open "input.txt" r]

while { [gets $fp data] >= 0 } {
   
    if {[string match -nocase {[A-Za-z]*} $data]} {
        puts $data;

    }
  
    set numbers [regexp -all -inline -- {[0-9]+} $data];
  
    set len [string length $numbers];
    
   
if {$len > 0 } {
   
   scan $numbers %d myInteger
   set d [expr "$myInteger%2"]
   puts $d
}


      }
close $fp;