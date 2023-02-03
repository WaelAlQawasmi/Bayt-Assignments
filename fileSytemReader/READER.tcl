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

# method check if the fist line is string char
proc isStartWIthString { line } {
    
    if { [string match -nocase {[A-Za-z]*} $line] } {
        return 1;
    }
    return 0;
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
    set ModulusOfIntegerValue [expr "$valueOfLineAsInteger%2"];
    if {$ModulusOfIntegerValue == 1 } {
        incr primeNumberLine;
        puts [expr "$valueOfLineAsInteger/2"]
        } elseif { $ModulusOfIntegerValue == 0 } {
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
            puts $line;
            setMinimumNonEmptyLineLength $line;
            setLineValue $line;
        } else {
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

