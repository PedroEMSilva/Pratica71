import java.util.ArrayList;
import java.util.Collections;
import utfpr.dainf.if62c.pratica.Jogador;
import utfpr.dainf.if62c.pratica.JogadorComparator;

/**
 * IF62C Fundamentos de Programação 2
 * Exercício de programação em Java.
 * @author Wilson Horstmeyer Bogado <wilson@utfpr.edu.br>
 */
public class Pratica62 {

    public static void main(String[] args) {
        ArrayList<Jogador> time = new ArrayList<>();

        time.add(new Jogador(4, "Ciclano"));
        time.add(new Jogador(1, "Fulano"));
        time.add(new Jogador(10, "Beltrano"));
        time.add(new Jogador(10, "Mário"));
        time.add(new Jogador(1, "Beltrano"));
        time.add(new Jogador(7, "José"));

        JogadorComparator comparador = new JogadorComparator(false, true, false);
        Collections.sort(time, comparador);
        String format = "%3d %-20s";
        System.out.println("Num Nome");
        for (Jogador j: time) {
            System.out.println(String.format(format, j.getNumero(), j.getNome()));
        }

        int pos = Collections.binarySearch(time, new Jogador(1, "Fulano"), comparador);
        if (pos >= 0) {
            System.out.println("Jogador encontrado:");
            System.out.println(String.format(format, time.get(pos).getNumero(), time.get(pos).getNome()));
        } else {
            System.out.println("Jogador não encontrado. Posição: " + (-pos-1));
        }
    }
}
