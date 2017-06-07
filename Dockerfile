# EngIT Public Agents run on RHEL7.2 so this is an ideal base layer
FROM centos:7.2.1511
# Setup Environment
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin ENV HOME /root ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk
# Setup Yum repos
RUN yum install -y wget unzip
RUN wget -O /etc/yum.repos.d/epel-apache-maven.repo http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo
# Install Tool Packages
RUN yum install -y java-1.8.0-openjdk \
  apache-maven \
    python \
      ant \
        gradle \
	  groovy \
	    which \
	      npm

	      # Install nodejs
	      RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -

	      # Install sonar-scanner
	      RUN wget http://engci-maven-master.cisco.com/artifactory/bms-vendor-files/sonarqube/sonar-scanner/sonar-scanner-2.8.zip && unzip sonar-scanner-2.8.zip && rm sonar-scanner-2.8.zip
	      ENV SONAR_RUNNER_HOME=/root/sonar-scanner-2.8
	      ENV PATH $PATH:/root/sonar-scanner-2.8/bin

	      # Install tslint
	      CMD 'npm install -g typescript'
