
package observer;

import java.util.ArrayList;
import java.util.List;

public class Subject {
    List<View> observers = new ArrayList<>();
    
    void attach(View v){
        observers.add(v);
        v.update(this);
    }
    void detach(View v){
        observers.remove(v);
    }
    void notifyViews(){
        for (View observer : observers) {
                observer.update(this);
            }
    }
}
