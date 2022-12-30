pipeline {
    agent any
    tools {
        maven 'maven_3_8_6'
    }
    stages {
        stage('Get environment variables from properties file') {
            script{
                def props = readProperties file: 'env-vars.properties'
                env.Git = props.Git
            }
            echo "The git link is $Git"
        }
        stage('Clone') {
            steps {
                git 'https://github.com/p4r4djs33/jenkins-integration.git'
            }
        }
        stage('Build Maven') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t springboot-docker-part2 .'
                }
            }
        }
    }
}