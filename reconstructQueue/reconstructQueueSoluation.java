package reconstructQueue;
import java.util.*;

class reconstructQueueSoluation {
   
    // the solution for reconstruct the Queue
    public  ArrayList<int[]> reconstructQueue(int[][] people) {
   
        // This to sorted the Queue  based on the height decresing order
        int[][] hightSortedPeople= SortQueueBasedOnHight(people);
        // This to add people at the index , picking the max height first
        ArrayList<int[]> result=maxHeightFirst( hightSortedPeople) ;

        return result;
    }

    // method to sorted based on hight
    public  int[][] SortQueueBasedOnHight(int[][] people) {

        Arrays.sort(people, (a,b)->{
             if(a[0]==b[0]) return a[1]-b[1];
             return b[0]-a[0];
        });
 
        return people;
 
    }
    
    // method to picking the max height first
    public  ArrayList<int[]> maxHeightFirst(int[][] hightSortedPeople) {

        ArrayList<int[]> res= new ArrayList<>();
        for(int[] person: hightSortedPeople){
            res.add(person[1], person);
        }
        return res;
    }


    

}