Feature: Avalia a Prática 6.1 de IF62C-Fundamentos de Programação 2
    Como professor da disciplica de Fundamentos de Programação 2
    Quero avaliar a prática 6.1
    A fim de verificar a compreensão dos estudantes

    Background:
        Given the maximum grade is 100
        Given the main class is 'Pratica61'
        Given I set the script timeout to 3000
        Given I evaluate 'import utfpr.ct.dainf.if62c.pratica.*'
        Given I evaluate 'import utfpr.ct.dainf.grader.*'
        Given I evaluate 'import java.util.regex.*'
    
    Scenario: Verifica se a classe Jogador esta corretamente definida
        Given I report 'Avaliando item 3...'
        Given class 'utfpr.ct.dainf.if62c.pratica.Jogador' exists store class in <jogadorClass>
        And class <jogadorClass> has 'public' modifier
        Then award 10 points
        Given class <jogadorClass> declares 'Jogador(int,java.lang.String)' constructor save in <dummyConstructor>
        And class <jogadorClass> declares 'toString()' method save in <dummyMethod>
        Then award 10 points

    Scenario: Verifica se a classe Time está corretamente implementada
        Given I report 'Avaliando item 4...'

    Scenario: Verifica se a classe Time declara o campo jogadores corretamente
        Given class 'utfpr.ct.dainf.if62c.pratica.Time' exists store class in <timeClass>
        And class <timeClass> has 'public' modifier
        And class <timeClass> declares field 'jogadores' save in <jogadoresField>
        And generic field <jogadoresField> is of type 'java.util.HashMap<java.lang.String, utfpr.ct.dainf.if62c.pratica.Jogador>'
        And member <jogadoresField> has 'private' modifier
        Then award 10 points

    Scenario: Verifica se a classe Time declara o método getJogadores() corretamente
        Given class <timeClass> declares 'getJogadores()' method save in <getMethod>
        And member <getMethod> has 'public' modifier
        And method <getMethod> returns generic type 'java.util.HashMap<java.lang.String, utfpr.ct.dainf.if62c.pratica.Jogador>'
        Then award 10 points

    Scenario: Verifica se a classe Time declara o método addJogador corretamente
        Given I report 'Avaliando item 5...'
        Given class <timeClass> declares 'addJogador(java.lang.String,utfpr.ct.dainf.if62c.pratica.Jogador)' method save in <addMethod>
        Then award 10 points
        Given member <addMethod> has 'public' modifier
        And I evaluate 'dummy = new Time(); jogador = new Jogador(1,"dummy"); dummy.addJogador("dummy", jogador);'
        And expression 'dummy.getJogadores().size()' evaluates to <1>
        And expression 'dummy.getJogadores().get("dummy") == jogador' evaluates to <true>
        Then award 10 points
        
    Scenario: Verifica se é possível adicionar jogadores
        Given I report 'Avaliando item 6...'
        Given I evaluate 'time1 = new Time()'
        Given I evaluate 'time1.addJogador("Goleiro", new Jogador(1, "Fulano"))'
        Given I evaluate 'time1.addJogador("Lateral", new Jogador(4, "Ciclano"))'
        Given I evaluate 'time1.addJogador("Atacante", new Jogador(10, "Ciclano"))'
        Given I evaluate 'time2 = new Time()'
        Given I evaluate 'time2.addJogador("Atacante", new Jogador(15, "Mário"))'
        Given I evaluate 'time2.addJogador("Goleiro", new Jogador(1, "João"))'
        Given I evaluate 'time2.addJogador("Lateral", new Jogador(7, "José"))'
        Then award 20 points

    Scenario: Verifica se o programa executa e se há alguma saída
        Given I report 'Avaliando item 7...'
        Given I evaluate 'testMain = new Pratica61()'
        Given I set output to <testOut>
        And I evaluate 'testMain.main(new String[0])'
        And I set output to <default>
        And <testOut> matches regex '.*[Tt]ime+.*' with 'Pattern.DOTALL' option
        Then award 20 points

    Scenario: Report final grade.
        Given I report grade formatted as 'FINAL GRADE: %.1f'
