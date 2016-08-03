
#se debe ejecutar apuntando a cada host en la variable JBOSS_HOME
PASSWORD_VAUL=vault.*
SALT_VAULT=87651234
ITERATION_VAULT=50
JBOSS_HOME=/opt/servers/EAP/Domain
BLOCK=oracleDS
ALIAS=vault
ATTRIBUTE=password
PASSTOENCODE=passToEncode

#sh bin/vault.sh -e <Path to vault folder> -k <Path to vault keystore> -p <pass> -s <salt> -i <iteration> -v <alias>  -a <attribute> -b <block> -x <passToEncode>
#sh bin/vault.sh -e /opt/servers/EAP/Domain-Slave/vault -k /opt/servers/EAP/Domain-Slave/domain/configuration/vault.keystore -p vault.* -s 87651234 -i 50 -v vault  -a password -b oracleDS -x passToEncode

sh $JBOSS_HOME/bin/vault.sh -e $JBOSS_HOME/vault -k $JBOSS_HOME/domain/configuration/vault.keystore -p $PASSWORD_VAUL -s $SALT_VAULT -i $ITERATION_VAULT -v $ALIAS  -a $ATTRIBUTE -b $BLOCK -x $PASSTOENCODE
