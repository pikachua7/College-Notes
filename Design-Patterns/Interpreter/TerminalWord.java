package Interpreter;

public class TerminalWord implements Expression {

    private String word = null;

    public TerminalWord(String str) {
        word = str;
    }

    @Override
    public boolean interpret(String str) {
      //  System.out.println("TERMINAL  "+word+" with "+str);

        return str.contains(word);
            
    }

}
