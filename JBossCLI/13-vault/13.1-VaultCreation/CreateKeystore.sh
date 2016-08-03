
#se debe ejecutar apuntando a cada host en la variable JBOSS_HOME
JBOSS_HOME=/opt/servers/EAP/Domain

#keytool -genseckey -alias vault -storetype jceks -keyalg AES -keysize 128 -storepass vault.* -keypass vault.* -keystore /opt/servers/EAP/Domain-Slave/domain/configuration/vault.keystore
keytool -genseckey -alias vault -storetype jceks -keyalg AES -keysize 128 -storepass vault.* -keypass vault.* -keystore $JBOSS_HOME/domain/configuration/vault.keystore
