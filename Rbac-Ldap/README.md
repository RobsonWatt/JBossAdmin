# Jboss RBAC and Apache Directory Server Integration

### Environment tested
- Fedora 22 x86_64
- 12 GB
- JBDeveloper
- OpenJDK 1.8.0_91-b14
- Apache Directory Server 2
- Jboss Enterprise Application Platform 6.4

### Pre Requisites
- JAVA_HOME environment variable **SETTED**
- Jboss Enterprise Application Platform **INSTALLED**
- JBDeveloper **INSTALLED**

### POC Configuration
#### Apache Directory Server Installation
```sh
$ sudo yum install -y apacheds.noarch
```

#### JBDeveloper ApacheDS Plugin
Using JBDeveloper install ldap plugin from **Help>Install New Software** menú using the follow url
http://directory.apache.org/studio/update.

#### ApacheDS Server and Connection
From JBDeveloper LDAP perspective create LDAP Server and a new connection.

#### Import file rbac-ldap.ldif 
**rbac-ldap.ldif** file has been prepared with some people and roles predefined as follow:  
dc=RedHat, dc=com  
¬¬¬¬¬ ou=People  
¬¬¬¬¬¬¬¬¬ uid=robson_admin  
¬¬¬¬¬¬¬¬¬ uid=robson_audit  
¬¬¬¬¬¬¬¬¬ uid=robson_deploy  
¬¬¬¬¬¬¬¬¬ uid=robson_manten  
¬¬¬¬¬¬¬¬¬ uid=robson_monitor  
¬¬¬¬¬¬¬¬¬ uid=robson_opera  
¬¬¬¬¬¬¬¬¬ uid=robson_super  
¬¬¬¬ ou=Roles  
¬¬¬¬¬¬¬¬¬ cn=Administradores  
¬¬¬¬¬¬¬¬¬ cn=Auditores  
¬¬¬¬¬¬¬¬¬ cn=Deployadores  
¬¬¬¬¬¬¬¬¬ cn=Mantenedores  
¬¬¬¬¬¬¬¬¬ cn=Monitores  
¬¬¬¬¬¬¬¬¬ cn=Operadores  
¬¬¬¬¬¬¬¬¬ cn=SuperUsuarios  

#### Jboss RBAC and Apache DS Configuration
Start Jboss EAP and execute the follow instruction:
```sh
$ sh $JBOSS_HOME/bin/jboss-cli.sh -c --file=/path/to/rbac-ldap.cli
```

This Cli batch configure:
- Audit Log
- RBAC
- LDAP Realm
- LDAP Connection, users and group path
- LDAP Groups mapping to Jboss RBAC roles
- Management Interface LDAP Realm  

You can review my **standalone.xml** file if you preffer.

#### Test the configuration
Try to access to http://ip-address:9990 using a user defined into apache directory server.
