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

proc isStartWIthString { line } {
    if { [string match -nocase {[A-Za-z]*} $line]} {
       return 1;
    }
    return 0;
}

proc setFirstThreeString { line } {
    global Linecounter;
    global firstThreeString;
    incr Linecounter;
    if {  $Linecounter < 4 } { append firstThreeString " " $line ; }
}

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

proc setSumFirstTwoInt { valueOfLineAsInteger } {
  global sumFirstTwoInt;
  global LineWithValuCounter
  if { $LineWithValuCounter < 2 } {
            set  sumFirstTwoInt [expr "$valueOfLineAsInteger+$sumFirstTwoInt"]
   }
}

proc setLineValue { line } {
    global StringLine
    global LineWithValuCounter
    set valueOfLineAsString [regexp -all -inline -- {[0-9]+} $line];
    set lengthValueOfLine [string length $valueOfLineAsString];    
    if {$lengthValueOfLine > 0 } {
        # to convert to int
        scan $valueOfLineAsString %d valueOfLineAsInteger  
        set ModulusOfIntegerValue [expr "$valueOfLineAsInteger%2"];
         SetMaxValue $valueOfLineAsInteger $line;
         setSumFirstTwoInt $valueOfLineAsInteger
        incr LineWithValuCounter
        if {$ModulusOfIntegerValue == 1 } {
            incr primeNumberLine;
            puts [expr "$valueOfLineAsInteger/2"]
        } elseif { $ModulusOfIntegerValue == 0 } {puts [expr "$valueOfLineAsInteger*3.25"];
                  incr nonPrimeNumber;}
        } else {    incr StringLine}
}


proc readFile { filename } {
   global Linecounter
   global invalidLine;
   set fp [open $filename r];
   while { [gets $fp line] >= 0 } {
   
    if {[isStartWIthString $line] } {
        setFirstThreeString $line;
        puts $line;
        setMinimumNonEmptyLineLength $line;
        setLineValue $line;
       
    } else { puts "INVALID LINE";
             incr invalidLine;
            }    
    puts "$line [string length $line] ";
  }
  close $fp; 
}




set filename input.txt;
set fexist [file exist $filename];
if { $fexist == 1 } {
readFile $filename ;
}


puts "number od StringLine : $StringLine";
puts "number od primeNumberLine : $primeNumberLine";
puts "number od nonPrimeNumber : $nonPrimeNumber";
puts "number od invalidLine : $invalidLine";
puts "sum of first two num  : $sumFirstTwoInt";
puts " first three  $firstThreeString";
puts " first three  $Linecounter";
puts " LineWithMaxValue $LineWithMaxValue";
puts " minimumNonEmptyLineLength $minimumNonEmptyLineLength";

