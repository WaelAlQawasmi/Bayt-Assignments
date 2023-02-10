<?php
class spiralOrderSoluation{

    private $result_array=[]; 
    private $starting_col=0;
    private $final_col;
    private $starting_row=0;
    private $final_row;

    // function return all elements of the matrix in spiral order.

    function spiralOrder($Input_array){
        $this->final_col =count($Input_array[0])-1;
        $this->final_row=count($Input_array)-1;
        while($this->starting_row<=$this->final_row &&$this->starting_row<=$this->final_row){
            // Traverse  from left to right
            $this->leftToRightTraverse($Input_array);
            $this->starting_row++;

            // Traverse  up left to down
            $this->upToLeftTraverse($Input_array);
            $this->final_col--;
            
            // Traverse  from right to letf (if there is any row that hasn't been visited yet))
            if( $this->final_row>=$this->starting_row){
                $this->rightToLeftTraverse($Input_array);
            }
            $this->final_row--;

            // Traverse  down right to up (if there is any column that hasn't been visited yet))
            if( $this->final_col>=$this->starting_col){
                $this->downToRightTraverse($Input_array);
            }

            $this->starting_col++;

        }
        return $this->result_array;
    }

     // Traverse  from  right to left  method 
    function leftToRightTraverse($Input_array){
        for ($i=$this->starting_col; $i <= $this->final_col; $i++) { 
        array_push($this->result_array, $Input_array[$this->starting_row][$i]);
        }
    }

    // Traverse  up to left method
    function upToLeftTraverse($Input_array){
        for ($i=$this->starting_row; $i <= $this->final_row; $i++) { 
        array_push($this->result_array, $Input_array[$i][$this->final_col]);
        }
    }
    // method to Traverse from  right to left 
    function rightToLeftTraverse($Input_array){
        for ($i=$this->final_col; $i >= $this->starting_col; --$i) { 
            array_push($this->result_array, $Input_array[$this->final_row][$i]);
        }
    }
    // method to Traverse from  down to right 
    function downToRightTraverse($Input_array){
        for ($i=$this->final_row; $i >= $this->starting_row; --$i) { 
            array_push($this->result_array, $Input_array[$i][$this->starting_col]);
        }
    }
} 

$spiralOrderSoluation= new spiralOrderSoluation();
// print test case   it should retirn => Array (   10  => 5  => 7  => 5  => 66  => 99 => 55  => 77  => 22  => 2 => 89 => 23 )
print_r( $spiralOrderSoluation->spiralOrder([[10,5,7],[2,89,5],[22,23,66], [77,55,99]]));


?>