package Interpreter;

public class OrExpression implements Expression {
	private Expression left ,right;

        
	public OrExpression(Expression left, Expression right) {
		this.left = left;
		this.right = right;
	}

	@Override
	public boolean interpret(String context) {
           // System.out.println("OR  - "+context);
             return left.interpret(context) || right.interpret(context);
	}
}
