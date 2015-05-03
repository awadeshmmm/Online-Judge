import java.io.BufferedReader;

import java.io.InputStreamReader;

import java.util.Scanner;

class Solution {

    public static void main(String args[])throws Exception{

        Scanner br=new Scanner(System.in);

        while(br.hasNextLine()){

        String msg=br.nextLine(),java="",c="";

        char ch;int flag=0;

        if((msg.charAt(0)>=65&&msg.charAt(0)<=90)||msg.charAt(0)=='_'||msg.charAt(msg.length()-1)=='_'||msg.contains("__"))

            System.out.println("Error!");

        else

        if(msg.contains("_")){

            int i;

            for(i=0;i<msg.length();i++){

                ch=msg.charAt(i);

                if(ch>=65&&ch<=90){flag++;break;}

                if(ch=='_'){

                    i++;

                    if(msg.charAt(i)>=65&&msg.charAt(i)<=90){flag++;break;}

                    java+=(char)(msg.charAt(i) -32);

                    continue;

                }

                java+=ch;

                

            }

            if(flag>0)System.out.println("Error!");

            else

            System.out.println(java);

        }

        else{

            int i;

            for(i=0;i<msg.length();i++){

                ch=msg.charAt(i);

                if(ch>=65&&ch<=90){

                    c=c+"_"+(char)(ch+32);

                    continue;

                }

                c+=ch;

            }

            System.out.println(c);

        }

    }

    }

}