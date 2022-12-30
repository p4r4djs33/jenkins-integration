pipeline {
    agent any
    tools {
        maven 'maven_3_8_6'
    }
    stages {
        stage('Get environment variables from properties file') {
            steps {
                script{
                    def props = readProperties file: 'env-vars.properties'
                    env.Git = props.Git
                }
                echo "The git link is $Git"
            }
        }
        stage('Clone') {
            steps {
                script{
                    def props = readProperties file: 'env-vars.properties'
                    env.Git = props.Git
                }
                git "$Git"
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