package observer;

import java.io.FileWriter;
import java.io.IOException;

public class FileView implements View{
     //Subject subject;
    String filename;
    FileWriter fw;
    public FileView(String filename) {
        
        this.filename = filename;
        try {
            fw = new FileWriter(filename);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    
    @Override
    public void update(Subject subject){
        try {
            fw = new FileWriter(filename);
            fw.write(subject.toString());//get
            fw.close();
            
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
