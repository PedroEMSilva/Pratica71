Feature: Avalia a Prática 6.2 de IF62C-Fundamentos de Programação 2
    Como professor da disciplica de Fundamentos de Programação 2
    Quero avaliar a prática 6.2
    A fim de verificar a compreensão dos estudantes

    Background:
        Given the maximum grade is 100
        Given the main class is 'Pratica62'
        Given I set the script timeout to 3000
        Given I evaluate 'import utfpr.ct.dainf.if62c.pratica.*'
        Given I evaluate 'import utfpr.ct.dainf.grader.*'
        Given I evaluate 'import java.util.regex.*'
    
    Scenario: Verifica se a classe Pratica62 esta corretamente definida
        Given I report 'Avaliando item 3...'
        Given class 'Pratica62' exists store class in <mainClass>
        And class <mainClass> has 'public' modifier
        Given class <mainClass> declares 'main(java.lang.String[])' method save in <mainMethod>    
        And member <mainMethod> has 'public' modifier
        And member <mainMethod> has 'static' modifier
        Then award 5 points

    Scenario: Verifica se a classe Jogador esta corretamente definida
        Given I report 'Avaliando item 4...'
        Given class 'utfpr.ct.dainf.if62c.pratica.Jogador' exists store class in <jogadorClass>
        And class <jogadorClass> has 'public' modifier
        And class 'java.lang.Comparable' is assignable from <jogadorClass>
        And class <jogadorClass> declares 'Jogador(int,java.lang.String)' constructor save in <dummyConstructor>
        And class <jogadorClass> declares 'toString()' method save in <dummyMethod>
        Then award 10 points

    Scenario: Verifica se a classe JogadorComparator está corretamente implementada
        Given I report 'Avaliando item 5...'
        Given class 'utfpr.ct.dainf.if62c.pratica.JogadorComparator' exists store class in <jcompClass>
        And class 'java.util.Comparator' is assignable from <jcompClass>
        And class <jcompClass> declares 'JogadorComparator(boolean,boolean,boolean)' constructor save in <dummyConstructor>
        And class <jcompClass> declares 'compare(utfpr.ct.dainf.if62c.pratica.Jogador,utfpr.ct.dainf.if62c.pratica.Jogador)' method save in <comptoMethod> 
        Then award 10 points

    Scenario: Verifica se o comparador (true,true,true) compara os objetos corretamente
        Given I evaluate 'jcompTest = new JogadorComparator()'
        Given I evaluate 'jog1 = new Jogador(1, "A"); jog2 = new Jogador(2, "B")'
        And expression 'jcompTest.compare(jog1, jog2) < 0' evaluates to <true>
        And expression 'jcompTest.compare(jog1, jog1) == 0' evaluates to <true>
        And expression 'jcompTest.compare(jog2, jog1) > 0' evaluates to <true>
        Then award 5 points

    Scenario: Verifica se o comparador (true,true,false) compara os objetos corretamente
        Given I evaluate 'jcompTest = new JogadorComparator(true,true,false)'
        Given I evaluate 'jog1 = new Jogador(1, "A"); jog2 = new Jogador(2, "B");'
        And expression 'jcompTest.compare(jog1, jog2) < 0' evaluates to <true>
        And expression 'jcompTest.compare(jog1, jog1) == 0' evaluates to <true>
        And expression 'jcompTest.compare(jog2, jog1) > 0' evaluates to <true>
        Given I evaluate 'jog2.setNumero(1)'
        And expression 'jcompTest.compare(jog1, jog2) > 0' evaluates to <true>
        And expression 'jcompTest.compare(jog1, jog1) == 0' evaluates to <true>
        And expression 'jcompTest.compare(jog2, jog1) < 0' evaluates to <true>
        Then award 5 points

    Scenario: Verifica se o comparador (true,false,true) compara os objetos corretamente
        Given I evaluate 'jcompTest = new JogadorComparator(true,false,true)'
        Given I evaluate 'jog1 = new Jogador(1, "A"); jog2 = new Jogador(2, "B");'
        And expression 'jcompTest.compare(jog1, jog2) > 0' evaluates to <true>
        And expression 'jcompTest.compare(jog1, jog1) == 0' evaluates to <true>
        And expression 'jcompTest.compare(jog2, jog1) < 0' evaluates to <true>
        Given I evaluate 'jog2.setNumero(1)'
        And expression 'jcompTest.compare(jog1, jog2) < 0' evaluates to <true>
        And expression 'jcompTest.compare(jog1, jog1) == 0' evaluates to <true>
        And expression 'jcompTest.compare(jog2, jog1) > 0' evaluates to <true>
        Then award 5 points

    Scenario: Verifica se o comparador (true,false,false) compara os objetos corretamente
        Given I evaluate 'jcompTest = new JogadorComparator(true,false,false)'
        Given I evaluate 'jog1 = new Jogador(1, "A"); jog2 = new Jogador(2, "B");'
        And expression 'jcompTest.compare(jog1, jog2) > 0' evaluates to <true>
        And expression 'jcompTest.compare(jog1, jog1) == 0' evaluates to <true>
        And expression 'jcompTest.compare(jog2, jog1) < 0' evaluates to <true>
        Given I evaluate 'jog2.setNumero(1)'
        And expression 'jcompTest.compare(jog1, jog2) > 0' evaluates to <true>
        And expression 'jcompTest.compare(jog1, jog1) == 0' evaluates to <true>
        And expression 'jcompTest.compare(jog2, jog1) < 0' evaluates to <true>
        Then award 5 points

    Scenario: Verifica se o comparador (false,true,true) compara os objetos corretamente
        Given I evaluate 'jcompTest = new JogadorComparator(false,true,true)'
        Given I evaluate 'jog1 = new Jogador(1, "A"); jog2 = new Jogador(2, "B")'
        And expression 'jcompTest.compare(jog1, jog2) < 0' evaluates to <true>
        And expression 'jcompTest.compare(jog1, jog1) == 0' evaluates to <true>
        And expression 'jcompTest.compare(jog2, jog1) > 0' evaluates to <true>
        Then award 5 points

    Scenario: Verifica se o comparador (false,true,false) compara os objetos corretamente
        Given I evaluate 'jcompTest = new JogadorComparator(false,true,false)'
        Given I evaluate 'jog1 = new Jogador(1, "A"); jog2 = new Jogador(2, "B");'
        And expression 'jcompTest.compare(jog1, jog2) > 0' evaluates to <true>
        And expression 'jcompTest.compare(jog1, jog1) == 0' evaluates to <true>
        And expression 'jcompTest.compare(jog2, jog1) < 0' evaluates to <true>
        Given I evaluate 'jog2.setNome("A")'
        And expression 'jcompTest.compare(jog1, jog2) < 0' evaluates to <true>
        And expression 'jcompTest.compare(jog1, jog1) == 0' evaluates to <true>
        And expression 'jcompTest.compare(jog2, jog1) > 0' evaluates to <true>
        Then award 5 points

    Scenario: Verifica se o comparador (false,false,true) compara os objetos corretamente
        Given I evaluate 'jcompTest = new JogadorComparator(false,false,true)'
        Given I evaluate 'jog1 = new Jogador(1, "A"); jog2 = new Jogador(2, "B");'
        And expression 'jcompTest.compare(jog1, jog2) < 0' evaluates to <true>
        And expression 'jcompTest.compare(jog1, jog1) == 0' evaluates to <true>
        And expression 'jcompTest.compare(jog2, jog1) > 0' evaluates to <true>
        Given I evaluate 'jog2.setNome("A")'
        And expression 'jcompTest.compare(jog1, jog2) > 0' evaluates to <true>
        And expression 'jcompTest.compare(jog1, jog1) == 0' evaluates to <true>
        And expression 'jcompTest.compare(jog2, jog1) < 0' evaluates to <true>
        Then award 5 points

    Scenario: Verifica se o comparador (false,false,false) compara os objetos corretamente
        Given I evaluate 'jcompTest = new JogadorComparator(false,false,false)'
        Given I evaluate 'jog1 = new Jogador(1, "A"); jog2 = new Jogador(2, "B");'
        And expression 'jcompTest.compare(jog1, jog2) > 0' evaluates to <true>
        And expression 'jcompTest.compare(jog1, jog1) == 0' evaluates to <true>
        And expression 'jcompTest.compare(jog2, jog1) < 0' evaluates to <true>
        Given I evaluate 'jog2.setNome("A")'
        And expression 'jcompTest.compare(jog1, jog2) > 0' evaluates to <true>
        And expression 'jcompTest.compare(jog1, jog1) == 0' evaluates to <true>
        And expression 'jcompTest.compare(jog2, jog1) < 0' evaluates to <true>
        Then award 5 points

    Scenario: Verifica se a classe Time está corretamente declarada
        Given I report 'Avaliando item 6...'
        Given class 'utfpr.ct.dainf.if62c.pratica.Time' exists store class in <timeClass>
        And class <timeClass> has 'public' modifier
        And class <timeClass> declares field 'jogadores' save in <jogadoresField>
        And generic field <jogadoresField> is of type 'java.util.HashMap<java.lang.String, utfpr.ct.dainf.if62c.pratica.Jogador>'
        And member <jogadoresField> has 'private' modifier
        And class <timeClass> declares 'getJogadores()' method save in <getMethod>
        And member <getMethod> has 'public' modifier
        And method <getMethod> returns generic type 'java.util.HashMap<java.lang.String, utfpr.ct.dainf.if62c.pratica.Jogador>'
        And class <timeClass> declares 'addJogador(java.lang.String,utfpr.ct.dainf.if62c.pratica.Jogador)' method save in <addMethod>
        And member <addMethod> has 'public' modifier
        And I evaluate 'dummy = new Time(); jogador = new Jogador(1,"dummy"); dummy.addJogador("dummy", jogador);'
        And expression 'dummy.getJogadores().size()' evaluates to <1>
        And expression 'dummy.getJogadores().get("dummy") == jogador' evaluates to <true>
        Then award 5 points

    Scenario: Verifica se a classe Time implementa o método ordena(JogadorComparator) corretamente
        Given class <timeClass> declares 'ordena(utfpr.ct.dainf.if62c.pratica.JogadorComparator)' method save in <ordenaMethod>
        And method <ordenaMethod> returns generic type 'java.util.List<utfpr.ct.dainf.if62c.pratica.Jogador>'
        When I evaluate 'jog1 = new Jogador(1, "A"); jog2 = new Jogador(2, "B");'
        And I evaluate 'timeTest = new Time(); timeTest.addJogador("J1", jog1); timeTest.addJogador("J2", jog2);'
        And I evaluate 'jogList = timeTest.ordena(new JogadorComparator(false,true, false))'
        And expression 'jogList.get(0) == jog2 && jogList.get(1) == jog1' evaluates to <true>
        Then award 10 points
        
    Scenario: Verifica se o programa executa e se há alguma saída
        Given I report 'Avaliando item 7...'
        Given I evaluate 'testMain = new Pratica62()'
        Given I set output to <testOut>
        And I evaluate 'testMain.main(new String[0])'
        And I set output to <default>
        And <testOut> matches regex '^.*\w+.*$' with 'Pattern.DOTALL' option
        Then award 10 points

    Scenario: Verifica se o programa executa e se há alguma saída
        Given I report 'Avaliando item 8...'
        Given I evaluate 'testMain = new Pratica62()'
        Given I set output to <testOut>
        And I evaluate 'testMain.main(new String[0])'
        And I set output to <default>
        And <testOut> matches regex '^.*\w+.*$' with 'Pattern.DOTALL' option
        Then award 10 points

    Scenario: Report final grade.
        Given I report grade formatted as 'FINAL GRADE: %.1f'
