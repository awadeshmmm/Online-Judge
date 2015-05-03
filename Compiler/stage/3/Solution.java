import java.io.*;



class Solution{

public static void main(String args[])throws IOException{



BufferedReader ab = new BufferedReader(new InputStreamReader(System.in));

int test = Integer.parseInt(ab.readLine());

while(test-- > 0){

int n = Integer.parseInt(ab.readLine());

int fact = 1;

for(int i=1;i<=n;i++)

fact=fact*i;

System.out.println(fact);

}

}

}