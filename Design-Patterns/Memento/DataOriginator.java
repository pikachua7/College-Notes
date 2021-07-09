package Memento;
import java.util.ArrayList;

public class DataOriginator {
	private String listName;
	private ArrayList<String> listContent;

	public DataOriginator(String listName){
		this.listName=listName;
		this.listContent=new ArrayList<>();
	}
	@Override
	public String toString(){
		return listContent.toString();
	}
	public void writeToList(String str){
		listContent.add(str);
	}
	
	public Memento createMemento(){
		return new Memento(listName,listContent);
	}
	
	public void rollback(Object obj){//setMemento
		Memento m = (Memento) obj;
		this.listName= m.getListName();
		this.listContent=m.getListContent();
	}
	
        
        
        
        
	private class Memento{
		private String listName;
		private ArrayList<String> listContent;
		
		public Memento(String listName, ArrayList<String> listContent){
			this.listName=listName;
                        //deep copy List
                        this.listContent=new ArrayList<>(listContent);
		}

        public String getListName() {
            return listName;
        }

        public ArrayList<String> getListContent() {
            return listContent;
        }
                
	}
}