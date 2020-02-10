FROM centos


MAINTAINER hemanth.peddi0@gmail.com

RUN mkdir /opt/tomcat/
RUN yum -y install wget

WORKDIR /opt/tomcat
RUN curl -O http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.30/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war

EXPOSE 8888

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
