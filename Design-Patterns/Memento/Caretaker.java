package Memento;

public class Caretaker {
    private Object obj;

    public void commit(DataOriginator orig) {
        this.obj = orig.createMemento();
        //Memento m = (Memento) obj;
    }

    public void undoToLastCommit(DataOriginator orig) {
        orig.rollback(obj);
    }
}
