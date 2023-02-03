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
  foreach {StringLine primeNumberLine nonPrimeNumber invalidLine sumFirstTwoInt Linecounter LineWithValuCounter LineWithOutValuCounter firstThreeString MaxValue LineWithMaxValue minimumNonEmptyLineLength }  {0 0 0 0 0 0 0 0  "" 1 ""  +infinity} break

puts $MaxValue;


while { [gets $fp line] >= 0 } {
   
    if {[string match -nocase {[A-Za-z]*} $line]} {
        if { $Linecounter < 3 } {        append firstThreeString " " $line; }
        incr Linecounter;

        puts $line;
        set lengthOfLine [string length $line];
         if { $minimumNonEmptyLineLength > $lengthOfLine  } {
           set minimumNonEmptyLineLength  $lengthOfLine;
         }

        set valueOfLineAsString [regexp -all -inline -- {[0-9]+} $line];
        set lengthValueOfLine [string length $valueOfLineAsString];    
        if {$lengthValueOfLine > 0 } {
            # to convert to int
            scan $valueOfLineAsString %d valueOfLineAsInteger  
            set ModulusOfIntegerValue [expr "$valueOfLineAsInteger%2"];
             if { $valueOfLineAsInteger > $MaxValue } {
                 set  MaxValue $valueOfLineAsInteger;
                 set  LineWithMaxValue $line;
               }
            if {$LineWithValuCounter < 2 } {
                set  sumFirstTwoInt [expr "$valueOfLineAsInteger+$sumFirstTwoInt"]
            }
            incr LineWithValuCounter
            if {$ModulusOfIntegerValue == 1 } {
                incr primeNumberLine;
                puts [expr "$valueOfLineAsInteger/2"]
            } elseif { $ModulusOfIntegerValue == 0 } {puts [expr "$valueOfLineAsInteger*3.25"];
            incr nonPrimeNumber;}
        } else {    incr StringLine}
    } else { puts "INVALID LINE";
             incr invalidLine;
            }
                  
            puts "$line [string length $line] ";




}
puts "number od StringLine : $StringLine";
puts "number od primeNumberLine : $primeNumberLine";
puts "number od nonPrimeNumber : $nonPrimeNumber";
puts "number od invalidLine : $invalidLine";
puts "sum of first two num  : $sumFirstTwoInt";
puts " first three $firstThreeString";
puts " LineWithMaxValue $LineWithMaxValue";
puts " minimumNonEmptyLineLength $minimumNonEmptyLineLength";
close $fp;