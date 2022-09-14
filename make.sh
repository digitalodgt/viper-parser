export CLASSPATH=$CLASSPATH:/usr/class/cc4/cool/lib/java-cup-11a.jar:/usr/class/cc4/cool/lib/jlex.jar 
java JLex.Main viper.lex
mv viper.lex.java Yylex.java
java java_cup.Main viper.cup
javac -d . parser.java sym.java Yylex.java
