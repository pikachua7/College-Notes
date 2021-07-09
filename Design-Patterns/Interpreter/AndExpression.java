package Interpreter;

public class AndExpression implements Expression {
	private Expression left, right ;

	public AndExpression(Expression left, Expression right) {
		this.left = left;
		this.right = right;
	}

	@Override
	public boolean interpret(String context) {
        //    System.out.println("AND  -  "+context);
              return left.interpret(context) && right.interpret(context);
	}
}
