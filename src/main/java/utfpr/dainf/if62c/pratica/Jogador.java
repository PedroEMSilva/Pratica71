package utfpr.dainf.if62c.pratica;

/**
 * IF62C Fundamentos de Programação 2
 * Exercício de programação em Java.
 * @author Wilson Horstmeyer Bogado <wilson@utfpr.edu.br>
 */
public class Jogador implements Comparable<Jogador> {

    private int numero;
    private String nome;

    public Jogador(int numero, String nome) {
        this.numero = numero;
        this.nome = nome;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return numero + " - " + nome;
    }

    @Override
    public int compareTo(Jogador jogador) {
        return numero - jogador.numero;
    }

}
