#!/bin/bash
cd /opt/nexus-2.11.4-01
java -cp bin/jsw/lib/wrapper-3.2.3.jar:./lib/*:./conf/ -XX:MaxPermSize=192m -Djava.io.tmpdir=./tmp -Djava.net.preferIPv4Stack=true -Dcom.sun.jndi.ldap.connect.pool.protocol="plain ssl" -Xms256m -Xmx768m org.sonatype.nexus.bootstrap.jsw.JswLauncher ./conf/jetty.xml ./conf/jetty-requestlog.xml
