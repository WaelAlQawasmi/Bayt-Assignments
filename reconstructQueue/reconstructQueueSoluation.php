
<?php

class reconstructQueueSoluation {
   
    // the solution for reconstruct the Queue
    public function reconstructQueue( $people) {
        // This to sorted the Queue  based on the height decresing order
        $hightSortedPeople= $this->SortQueueBasedOnHight($people);
        // This to add people at the index , picking the max height first
        $result= $this->maxHeightFirst($hightSortedPeople) ;
        return $result;
    }

    // method to sorted based on hight
    private function SortQueueBasedOnHight($people) {

        usort($people, function ($a, $b) {
            if ($a[0] == $b[0]) {
                return $a[1]-$b[1];
            }
            else{
                return  $b[0]-$a[0];
            }
        });
        return $people;
    }
    
    // method to picking the max height first
    private  function maxHeightFirst($hightSortedPeople) {

        $res= [];
        foreach($hightSortedPeople as $person){
            array_splice($res,$person[1],0,array($person));
        }
      
        return $res;
    }

}


// test case should output [[4,0],[5,0],[2,2],[3,2],[1,4],[6,0]]
$people= [[6,0],[5,0],[4,0],[3,2],[2,2],[1,4]];
$class=new reconstructQueueSoluation();
print_r($class->reconstructQueue($people));