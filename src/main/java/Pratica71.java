
import java.util.ArrayList;
import java.util.Collections;
import static java.util.Collections.list;
import java.util.Scanner;
import utfpr.ct.dainf.if62c.pratica.Jogador;
import utfpr.ct.dainf.if62c.pratica.JogadorComparator;
import utfpr.ct.dainf.if62c.pratica.Time;

/**
 * IF62C Fundamentos de Programação 2 Exercício de programação em Java.
 *
 * @author Wilson Horstmeyer Bogado <wilson@utfpr.edu.br>
 */
public class Pratica71 {

    public static void main(String[] args) {
        int numero = 0;
        int valido=1;
        int quer = 0;
        ArrayList<Jogador> timeco = new ArrayList<Jogador>();
        Time time = new Time();
        Scanner scanner = new Scanner(System.in);
        String nome1 = null;
        int numJogadores = 0;
        System.out.print("Número de Jogadores: ");
        if (scanner.hasNextInt()) {
            numJogadores = scanner.nextInt();
        } else {
           while (!scanner.hasNextInt()) {
                    System.out.println("Digite um numero!");
                    scanner.next();
                }
                numJogadores= scanner.nextInt();
        }
        for (int i = 0; i < numJogadores; i++) {
            System.out.println("Digite a posicao do " + i + " jogador:  ");
            if (scanner.hasNext()) {
                nome1 = scanner.next();
            } else {
               while(!scanner.hasNext()){
                   System.out.println("Digite uma posicao valida");
                   
               }
               nome1 = scanner.next();
            }
            System.out.println("Digite o numero do " + i + " jogador:  ");
            if (scanner.hasNextInt()) {
                numero = scanner.nextInt();
            } else {
                
                while (!scanner.hasNextInt()) {
                    System.out.println("Digite um numero!");
                    scanner.next();
                }
                numero= scanner.nextInt();
            }
            timeco.add(new Jogador(numero, nome1));

        }
        timeco.sort(new JogadorComparator(true, true, true));

        String format = "%3d %-20s";
        System.out.println("Time ordenado por número (asc) e nome (desc)");
        System.out.println("Num Nome");
        for (Jogador j : timeco) {
            System.out.println(String.format(format, j.getNumero(), j.getNome()));
        }

        System.out.println("se deseja incluir mais jogadore digite 1, caso contrario digite 0");
        if (scanner.hasNextInt()) {
            quer = scanner.nextInt();
        } else {
            while (!scanner.hasNextInt()) {
                    System.out.println("Digite um numero!");
                    scanner.next();
                }
                numero= scanner.nextInt();
        }
        while (quer == 1) {
            System.out.println("Digite o numero do  jogador:  ");
            if (scanner.hasNextInt()) {
                numero = scanner.nextInt();
            } else {
                System.out.println("Digite um numero!");
            }
            if(numero==0){
                break;
            }
            
            System.out.println("Digite a posicao do jogador:  ");
            if (scanner.hasNext()) {
                nome1 = scanner.next();
            } else {
                System.out.println("Digite um nome!");
            }
            
            timeco.add(new Jogador(numero, nome1));
            timeco.sort(new JogadorComparator(true, true, true));
        }
        
        System.out.println("Time ordenado por número (asc) e nome (desc)");
        System.out.println("Num Nome");
        for (Jogador j : timeco) {
            System.out.println(String.format(format, j.getNumero(), j.getNome()));
        }
        // para buscar por número é necessário reordenar
       /* JogadorComparator comparador = new JogadorComparator();
         jogadores.sort(comparador);
         System.out.println("Time ordenado por número (asc) e nome (asc)");
         System.out.println("Num Nome");
         for (Jogador j : jogadores) {
         System.out.println(String.format(format, j.getNumero(), j.getNome()));
         }
         int pos = Collections.binarySearch(jogadores, new Jogador(10, "Beltrano"), comparador);
         if (pos >= 0) {
         System.out.print("Jogador encontrado: ");
         System.out.println(jogadores.get(pos));
         } else {
         System.out.println("Jogador não encontrado. Posição: " + (-pos - 1));
         }*/
    }
}
