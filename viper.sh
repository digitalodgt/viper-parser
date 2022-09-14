export CLASSPATH=$CLASSPATH:/usr/class/cc4/cool/lib/java-cup-11a.jar:/usr/class/cc4/cool/lib/jlex.jar 
java -classpath .:$CLASSPATH Viper.parser $1
