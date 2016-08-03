# Jboss RBAC and Apache Directory Server Integration

### Environment used
- Fedora 22 x86_64
- 12 GB
- JBDeveloper
- OpenJDK 1.8.0_91-b14
- Apache Directory Server 2
- Jboss Enterprise Application Platform 6.4

### Pre Requisites
- JAVA_HOME environment variable **CONFIGURED**
- Jboss Enterprise Application Platform **INSTALLED**
- JBDeveloper **INSTALLED**

### POC Configuration
#### Apache Directory Server Installation
```sh
$ sudo yum install -y apacheds.noarch
```

#### JBDeveloper ApacheDS Plugin
From **Help>Install New Software** JBDeveloper menu install the plugin using the follow url
http://directory.apache.org/studio/update.

#### ApacheDS Server and Connection
From JBDeveloper LDAP perspective create LDAP Server and a new connection.

#### Import file rbac-ldap.ldif 
Import **rbac-ldap.ldif** into default partition "dc=example,dc=com", if it's not existe you'll need to create it before,  **rbac-ldap.ldif** has been prepared with some people and roles predefined as follow:  
dc=example, dc=com  
¬¬¬¬¬ ou=People  
¬¬¬¬¬¬¬¬¬ uid=user_admin  
¬¬¬¬¬¬¬¬¬ uid=user_audit  
¬¬¬¬¬¬¬¬¬ uid=user_deploy  
¬¬¬¬¬¬¬¬¬ uid=user_maintain  
¬¬¬¬¬¬¬¬¬ uid=user_monitor  
¬¬¬¬¬¬¬¬¬ uid=user_opera  
¬¬¬¬¬¬¬¬¬ uid=user_super  
¬¬¬¬ ou=Roles  
¬¬¬¬¬¬¬¬¬ cn=gr_administrators  
¬¬¬¬¬¬¬¬¬ cn=gr_auditors  
¬¬¬¬¬¬¬¬¬ cn=gr_deployers  
¬¬¬¬¬¬¬¬¬ cn=gr_maintainers  
¬¬¬¬¬¬¬¬¬ cn=gr_monitors  
¬¬¬¬¬¬¬¬¬ cn=gr_operators  
¬¬¬¬¬¬¬¬¬ cn=gr_superusers  

```sh
NOTE: The password for all users is secret123
```

#### Jboss RBAC and Apache DS Configuration
Start Jboss EAP and execute:
```sh
$ sh $JBOSS_HOME/bin/jboss-cli.sh -c --file=/path/to/rbac-ldap.cli
```

This Cli configure:
- Audit Log
- RBAC
- LDAP Realm
- LDAP Connection, users and group path
- LDAP Groups mapping to Jboss RBAC roles
- Management Interface LDAP Realm  

You can review my **standalone.xml** file if you preffer.

#### Test the configuration
Test the Jboss web console access http://ip-address:9990
