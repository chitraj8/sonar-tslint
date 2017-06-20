# EngIT Public Agents run on RHEL7.2 so this is an ideal base layer
FROM centos:7

# Setup Environment
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV HOME /root
ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk

# Install the EPEL repository
RUN yum -y install \
  epel-release

# Setup Yum repos
RUN yum install -y wget \
          unzip \
          tar

 # Install required developer tools
RUN yum -y install \
  make \
  gcc \
  git

# Install Tool Packages
RUN yum -y install java-1.8.0-openjdk \
                apache-maven

# Install node & npm and upgrade to desired versions.
RUN yum -y install \
  nodejs \
  npm && \
  npm install -g n && \
  n 4.4.4 && \
  npm install -g npm@2.15.1

#Make Directory
RUN mkdir /opt/sonar-runner

# Install sonar-scanner
RUN wget http://engci-maven-master.cisco.com/artifactory/bms-vendor-files/sonarqube/sonar-scanner/sonar-scanner-2.8.zip&& unzip sonar-scanner-2.8.zip -d /opt/sonar-runner && rm sonar-scanner-2.8.zip
        ENV SONAR_RUNNER_HOME=/opt/sonar-runner/sonar-scanner-2.8
        ENV PATH $PATH:/opt/sonar-runner/sonar-scanner-2.8/bin

# Install tslint
        RUN npm i -g typescript && \

  npm cache clean
