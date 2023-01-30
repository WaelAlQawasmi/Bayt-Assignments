<?php

// function return all elements of the matrix in spiral order.

function spiralOrder($Input_array){
    $result_array=[]; 
    $starting_col=0;
    $final_col=count($Input_array[0])-1;
    $starting_row=0;
    $final_row=count($Input_array)-1;

    while($starting_row<=$final_row &&$starting_row<=$final_row){
         // Traverse  from left to right
        for ($i=$starting_col; $i <= $final_col; $i++) { 
            array_push($result_array, $Input_array[$starting_row][$i]);
        }
        $starting_row++;

        // Traverse  up left to down
        for ($i=$starting_row; $i <= $final_row; $i++) { 
            array_push($result_array, $Input_array[$i][$final_col]);
        }
        $final_col--;
        

        if( $final_row>=$starting_row){
            // Traverse  from right to letf (if there is any row that hasn't been visited yet))
            for ($i=$final_col; $i >= $starting_col; --$i) { 
                array_push($result_array, $Input_array[$final_row][$i]);
            }
        }
        $final_row--;
        if( $final_col>=$starting_col){
            // Traverse  down right to up (if there is any column that hasn't been visited yet))
            for ($i=$final_row; $i >= $starting_row; --$i) { 
                array_push($result_array, $Input_array[$i][$starting_col]);
            }
        }

        $starting_col++;

    }
    return $result_array;
}


// print test case   it should retirn => Array (   10  => 5  => 7  => 5  => 66  => 99 => 55  => 77  => 22  => 2 => 89 => 23 )
print_r( spiralOrder([[10,5,7],[2,89,5],[22,23,66], [77,55,99]]));


?>