FROM tomcat:11.0-jdk21-openjdk


RUN rm -rf /usr/local/tomcat/webapps/*


COPY site_web.war /usr/local/tomcat/webapps/ROOT.war


RUN apt-get update && apt-get install -y \
    gettext-base \
    && rm -rf /var/lib/apt/lists/*


RUN echo '#!/bin/bash' > /setenv.sh && \
    echo '# تعيين المنفذ ديناميكيًا لـ Tomcat' >> /setenv.sh && \
    echo 'export SERVER_PORT=${PORT:-8080}' >> /setenv.sh && \
    echo 'echo "Tomcat will run on port: $SERVER_PORT"' >> /setenv.sh && \
    echo '# تعديل server.xml مع المنفذ الديناميكي' >> /setenv.sh && \
    echo 'cat /usr/local/tomcat/conf/server.xml.template | \\' >> /setenv.sh && \
    echo '  envsubst > /usr/local/tomcat/conf/server.xml' >> /setenv.sh && \
    chmod +x /setenv.sh


COPY <<'EOF' /usr/local/tomcat/conf/server.xml.template
<?xml version="1.0" encoding="UTF-8"?>
<Server port="8005" shutdown="SHUTDOWN">
  <Listener className="org.apache.catalina.startup.VersionLoggerListener" />
  <Listener className="org.apache.catalina.core.AprLifecycleListener" SSLEngine="on" />
  <Listener className="org.apache.catalina.core.JreMemoryLeakPreventionListener" />
  <Listener className="org.apache.catalina.mbeans.GlobalResourcesLifecycleListener" />
  <Listener className="org.apache.catalina.core.ThreadLocalLeakPreventionListener" />
  <GlobalNamingResources>
    <Resource name="UserDatabase" auth="Container"
              type="org.apache.catalina.UserDatabase"
              description="User database that can be updated and saved"
              factory="org.apache.catalina.users.MemoryUserDatabaseFactory"
              pathname="conf/tomcat-users.xml" />
  </GlobalNamingResources>
  <Service name="Catalina">
    <Connector port="${SERVER_PORT:-8080}" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               maxParameterCount="1000" />
    <Engine name="Catalina" defaultHost="localhost">
      <Realm className="org.apache.catalina.realm.LockOutRealm">
        <Realm className="org.apache.catalina.realm.UserDatabaseRealm"
               resourceName="UserDatabase"/>
      </Realm>
      <Host name="localhost" appBase="webapps"
            unpackWARs="true" autoDeploy="true">
        <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
               prefix="localhost_access_log" suffix=".txt"
               pattern="%h %l %u %t &quot;%r&quot; %s %b" />
      </Host>
    </Engine>
  </Service>
</Server>
EOF


ENV JAVA_OPTS="-Xmx512m -Xms256m -Dserver.port=${PORT:-8080}"
ENV CATALINA_OPTS="-Djava.security.egd=file:/dev/./urandom"

EXPOSE 8080

CMD ["/bin/bash", "-c", "/setenv.sh && catalina.sh run"]