
package strategy;

public class Demo {
    public static void main(String[] args) {
    Integer marks[] = {2,3,6,4,8,9};
    SortingStrategy strategy = new SelectionSort();
    Array a = new Array(marks, strategy);
    a.sortArray();
    }
}
