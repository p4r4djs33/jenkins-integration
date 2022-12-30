pipeline {
    agent any
    tools {
        maven 'maven_3_8_6'
    }
    stages {
        stage('Clone') {
            git 'https://github.com/p4r4djs33/jenkins-integration.git'
        }
        stage('Build Maven') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t springboot-docker-part1 .'
                }
            }
        }
    }
}