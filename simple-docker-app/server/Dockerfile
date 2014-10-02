# Basics
FROM 172.30.14.210:5000/java/base:7u67
MAINTAINER psi-infrastructure@issinc.com

# Install Jenkins
RUN yum -y install wget tar
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key

# Install rpms
RUN yum -y install jenkins installer-functions ruby ruby-devel initscripts git docker
RUN /bin/bash -l -c "gem install bundler --no-rdoc --no-ri"

# Add Jenkins Plugins
#RUN wget http://updates.jenkins-ci.org/latest/rake.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/chef.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/git.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/git-client.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/git-server.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/docker-build-step.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/docker-build-publish.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/docker-plugin.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/logstash.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/cucumber.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/cucumber-testresult-plugin.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/cucumber-reports.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/cucumber-perf.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/cucumber-perf.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/scm-api.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/vagrant-plugin.hpi -P /var/lib/jenkins/plugins
#RUN wget http://updates.jenkins-ci.org/latest/vagrant.hpi -P /var/lib/jenkins/plugins

# Set plugins perms
RUN chown -R jenkins:jenkins /var/lib/jenkins

# Maven
RUN mkdir -p /opt/apps/maven
RUN wget http://apache.tradebit.com/pub/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz -P /opt/apps/maven
RUN tar -xvf /opt/apps/maven/apache-maven-3.2.3-bin.tar.gz -C /opt/apps/maven
RUN ln -s /opt/apps/maven/apache-maven-3.2.3 /opt/apps/maven/maven
RUN chown -R jenkins:jenkins /opt/apps/maven
RUN rm -f /opt/apps/maven/apache-maven-3.2.3-bin.tar.gz

# Configure .m2
RUN mkdir -p /home/jenkins/.m2
ADD settings-security.xml /home/jenkins/.m2/settings-security.xml
ADD settings.xml /home/jenkins/.m2/settings.xml
RUN chown -R jenkins:jenkins /home/jenkins

# Add Some Files
ADD run.sh /usr/local/bin/run

# Clean Up
RUN yum -y erase wget tar

# Set Maven Environment Variables
ENV M2_HOME /opt/apps/maven/maven
ENV M2 $M2_HOME/bin
ENV PATH $PATH:$M2_HOME

# Set Java Environment Variables for all other users
RUN echo "export M2_HOME=\"/opt/apps/maven/maven\"" >> /etc/profile.d/maven.sh
RUN echo "export M2=\"$M2_HOME/bin\"" >> /etc/profile.d/maven.sh
RUN echo "export PATH=\"$PATH:$M2\"" >> /etc/profile.d/maven.sh