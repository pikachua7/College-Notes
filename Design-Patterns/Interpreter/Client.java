package Interpreter;

public class Client {

    static Expression buildSyntaxTree() {
        // terminals
        Expression terminal1 = new TerminalWord("Study");
        Expression terminal2 = new TerminalWord("Eat");
        Expression terminal3 = new TerminalWord("Play");
        Expression terminal4 = new TerminalWord("WatchTV");
        // Play or WatchTV
        Expression subRule1 = new OrExpression(terminal3, terminal4);
        // Study and Eat
        Expression subRule2 = new AndExpression(terminal1, terminal2);

        //  ( Play or WatchTV ) and  ( Study or Eat )
        Expression rule = new AndExpression(subRule2, subRule1);

        return subRule1;
    }

   
    public static void main(String[] args) {

        //context
        String input = "May I not Play ?";

        Expression rule = buildSyntaxTree();

        boolean isAllowed = rule.interpret(input);
        if (isAllowed) {
            System.out.println("\n"+input + "   YES.");
        } else {
            System.out.println("\n"+input + "   NO.");
        }
    }
}
