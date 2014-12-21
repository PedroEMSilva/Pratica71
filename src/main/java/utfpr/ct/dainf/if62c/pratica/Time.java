package utfpr.ct.dainf.if62c.pratica;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * IF62C Fundamentos de Programação 2
 * Exercício de programação em Java.
 * @author Wilson Horstmeyer Bogado <wilson@utfpr.edu.br>
 */
public class Time {
    private final HashMap<String, Jogador> jogadores = new HashMap<>();

    public Time() {
    }

    public HashMap<String, Jogador> getJogadores() {
        return jogadores;
    }
    
    public void addJogador(String posicao, Jogador jogador) {
        jogadores.put(posicao, jogador);
    }
    
    public List<Jogador> ordena(JogadorComparator comparator) {
        List<Jogador> list = new ArrayList<>();
        list.addAll(jogadores.values());
        list.sort(comparator);
        return list;
    }
    
}
