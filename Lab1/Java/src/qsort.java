import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Scanner;

public class qsort{
    public static int num;
    public static int[] a = new int[5000000];
    public static void qsort(int l,int r){
        if(l>=r){
            return;
        }
        int i = l, j = r, x = a[l];
        while(i<j){
            while(i<j && x <= a[j]){
                j--;
            }
            a[i] = a[j];
            while(i<j && a[i] < x){
                i++;
            }
            a[j] = a[i];
        }
        a[j]= x;
        qsort(l,j-1);
        qsort(j+1,r);
        return;
    }

    public static void main(String[] args) throws FileNotFoundException{
        // Read data file
        String dataname = "../../5000000.txt";
        InputStream fp = new FileInputStream(dataname);
        Scanner scanner = new Scanner(fp);
        num = scanner.nextInt();
        for(int i=0;i<num;i++){
            a[i] = scanner.nextInt();
        }

        // Print Before sort
        System.out.print("Before sort(top 10): ");
        for(int i=0;i<10;i++){
            System.out.print(String.format("%d ",a[i]));
        }
        System.out.println("\n");
        

        // Sort
        System.out.println("Start");
        long st = System.nanoTime();
        qsort(0,num-1);
        long et = System.nanoTime();
        System.out.println("Finish!\n");


        //Print After sort
        System.out.print("After sort(top 10): ");
        for(int i=0;i<10;i++){
            System.out.print(String.format("%d ",a[i]));
        }
        System.out.println("\n\nrun time: "+((1.0*(et-st))/1000000000));
    }
}