
package strategy;

public class Array {
    Integer a[];
    SortingStrategy sorter;

    public Array(Integer[] a, SortingStrategy sorter) {
        this.a = a;
        this.sorter = sorter;
    }
    
    public void sortArray(){
        sorter.sort(this.a);
    }
}
