
package Memento;

public class Main {
	public static void main(String[] args) {
		Caretaker caretaker = new Caretaker();
		DataOriginator todo_list = new DataOriginator("Todo List");

                todo_list.writeToList("Read");
                todo_list.writeToList("Meditate");
		System.out.println("current content : "+todo_list);
		
                //create a memento
                caretaker.commit(todo_list); 
		
                todo_list.writeToList("Exercise");
                todo_list.writeToList("Pay Bills");
		System.out.println("current content : "+todo_list);
		
                //rollback to saved memento
                caretaker.undoToLastCommit(todo_list); 
		
                System.out.println("current content : "+todo_list);
	}
} 