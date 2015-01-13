FROM phusion/baseimage:0.9.15

ENV DEBIAN_FRONTEND noninteractive

#Install repos
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/datastax.sources.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -

RUN apt-get update

# Preemptively accept the Oracle License
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections

# Install Packages
RUN apt-get install -y oracle-java7-installer oracle-java7-set-default dsc21 datastax-agent

ADD service/. /etc/service/

EXPOSE 7199 7000 7001 9160 9042 61621

CMD /sbin/my_init
