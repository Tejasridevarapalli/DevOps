pipeline {
    agent { label 'teja'}
        stages {
            stage('update ubuntu'){
                steps{    
                   sh 'sudo apt-get update'
                }
            }
            stage('Install chefDk'){
                steps{
                   script{
                       def chefdkExists = fileExists '/usr/bin/chef-client'
                       if (chefdkExists){
                           echo 'skipping chef install....already installed'
                       }
                       else{
                           sh 'wget https://packages.chef.io/files/stable/chef/15.2.20/ubuntu/18.04/chef_15.2.20-1_amd64.deb'
                           sh 'sudo dpkg -i chef_15.2.20-1_amd64.deb'
                
                       }
                   }
               }
           }
           stage('Download cookbook'){
                steps{
                     
                    git credentialsId: 'GitHub-creds', url: 'git@github.com:Tejasridevarapalli/DevOps.git'
                }
           }

           stage('Install Ruby and Test kitchen'){
               steps{
                   sh 'sudo apt-get install -y rubygems ruby-dev'
                   sh 'cheg gem install kitchen-docker'
               }
           }
           stage('Run Test kitchen'){
               steps{
                   sh 'sudo kitchen test'
               }
           }
           stage('Run create '){
               steps{
                   sh 'sudo kitchen create'
               }
           }
           stage('Run converge kitchen '){
               steps{
                   sh 'sudo kitchen converge'
               }
           }
 
}
}
