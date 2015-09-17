
 
package codejudge.compiler.languages;

public abstract class Language {
	
	public boolean timedout = false;
	public abstract void execute(); // method to override when executing a program
	public abstract void compile(); // method to override when compiling a program
	
}
