 set Linecounter 0
 set StringLine 0
 set primeNumberLine 0
 set nonPrimeNumber 0
 set invalidLine 0
 set sumFirstTwoInt 0 
 set LineWithValuCounter 0
 set LineWithOutValuCounter 0;
 set firstThreeString ""
 set MaxValue 0;
 set LineWithMaxValue "";
 set minimumNonEmptyLineLength +infinity;

 proc isPrime { n }  {
    set max [expr wide(sqrt($n))]
    if {$n%2==0} { puts "$n  not prime"; return 0;}
    for {set i 3} {$i<=$max} {incr i 2} {
        if {$n%$i==0} {  puts "$n  not prime"; return 0}
    }
    puts "$n prime";
    return 1
}


# method check if the fist line is string char
proc isStartWIthString { line } {
    set doubleValue "null"
    regexp {[0-9]+\.[0-9]+} $line doubleValue
    if { [string match -nocase {[A-Za-z]*} $line] || $doubleValue != "null"} {
        return 1;
    }
    return 0;
}
proc isPresentInteger { line } {
    set int "null"
    regexp {(?:^|[^0-9.])(\d+)(?!\.?\d)} $line int
    if { $int == "null" } {
        return 0
    }
    return 1

}
# concatenation of the first 3 lines starting with the string characters
proc setFirstThreeString { line } { 
    global Linecounter;
    global firstThreeString;
    incr Linecounter;
    if {  $Linecounter < 4 } { append firstThreeString " " $line ; }
}

# set the length of Minimum Non Empty Line 

proc setMinimumNonEmptyLineLength { line } {
    global minimumNonEmptyLineLength;
    set lengthOfLine [string length $line];
    if { $minimumNonEmptyLineLength > $lengthOfLine  } {
        set minimumNonEmptyLineLength  $lengthOfLine;
    }
}


proc SetMaxValue { valueOfLineAsInteger line } {
    global MaxValue;
    global LineWithMaxValue
    if { $valueOfLineAsInteger > $MaxValue } {
        set  MaxValue $valueOfLineAsInteger;
        set  LineWithMaxValue $line;
    }  
}
# method to sum the first two integer 
proc setSumFirstTwoInt { valueOfLineAsInteger } {
    global sumFirstTwoInt;
    global LineWithValuCounter
    if { $LineWithValuCounter < 2 } {
        set  sumFirstTwoInt [expr "$valueOfLineAsInteger+$sumFirstTwoInt"]
    }
}

proc setModulusOfIntegerValue { valueOfLineAsInteger } {
    global primeNumberLine;
    global nonPrimeNumber;
    if {[isPrime $valueOfLineAsInteger]} {
        incr primeNumberLine;
        puts [expr "$valueOfLineAsInteger/2"]
        } else {
                puts [expr "$valueOfLineAsInteger*3.25"];
                incr nonPrimeNumber;}
}

# method to get the value in the line 
proc setLineValue { line } {
    global StringLine
    global LineWithValuCounter
    set valueOfLineAsString [regexp -all -inline -- {[0-9]+} $line];
    set lengthValueOfLine [string length $valueOfLineAsString];    
    if {$lengthValueOfLine > 0 } {
        # to convert to int
        scan $valueOfLineAsString %d valueOfLineAsInteger  
        # call methods for statstics
        SetMaxValue $valueOfLineAsInteger $line;
        setSumFirstTwoInt $valueOfLineAsInteger
        incr LineWithValuCounter
        setModulusOfIntegerValue $valueOfLineAsInteger ; 
        } else {    incr StringLine}
}

proc readFile { filename } {
    global Linecounter
    global invalidLine;
    set fp [open $filename r];
    # read line by line
    while { [gets $fp line] >= 0 } {
        if {[isStartWIthString $line] } {
            setFirstThreeString $line;
            setMinimumNonEmptyLineLength $line;
            puts $line;
        } 
        if { [isPresentInteger $line] } {
            
            setLineValue $line;
        } 
        if {![isStartWIthString $line] && ![isPresentInteger $line] } {
            puts "INVALID LINE";
            incr invalidLine;
          }    
        puts "$line [string length $line] ";
    }
  close $fp; 
}



# setFileName
set filename input.txt;
# check if the file exist then read file
set fexist [file exist $filename];
if { $fexist == 1 } {

set string "This is a double value: 4.4 8 "
regexp {(?:^|[^0-9.])(\d+)(?!\.?\d)} $string int

set doubleValue null
regexp {[0-9]+\.[0-9]+} $string doubleValue
puts " valu $doubleValue $int"

    readFile $filename ;
}

# report 
puts "number of StringLine : $StringLine";
puts "number of primeNumberLine : $primeNumberLine";
puts "number of nonPrimeNumber : $nonPrimeNumber";
puts "number of invalidLine : $invalidLine";
puts "sum of first two num  : $sumFirstTwoInt";
puts "first three string  $firstThreeString";
puts " LineWithMaxValue $LineWithMaxValue";
puts " minimumNonEmptyLineLength $minimumNonEmptyLineLength";

