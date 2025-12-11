FROM tomcat:11.0-jdk21-openjdk

# تنظيف التطبيقات الافتراضية
RUN rm -rf /usr/local/tomcat/webapps/*

# نسخ مجلد التطبيق (الذي هو بالفعل في GitHub)
COPY src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

# تعديل المنفذ للعمل مع Railway
ENV JAVA_OPTS="-Dserver.port=${PORT:-8080}"

EXPOSE 8080

CMD ["catalina.sh", "run"]