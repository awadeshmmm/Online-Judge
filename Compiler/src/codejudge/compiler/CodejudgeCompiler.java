
 
package codejudge.compiler;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class CodejudgeCompiler {
	
	public static void main(String args[]) {
		int n=0;
		ServerSocket server = null;
		try {
			server = new ServerSocket(3057); // create a new socket to listen on
			System.out.println("Codejudge compilation server running ...");
			while(true) {
				n++;
				// accept any incoming connection and process it on a new thread
				Socket s = server.accept();
				RequestThread request = new RequestThread(s, n);
				request.start();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		catch(Exception e){
			if(server != null)
				try {
					server.close();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
		}
		 
	}
}
