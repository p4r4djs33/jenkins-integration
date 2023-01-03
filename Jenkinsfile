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
                git "${env.Git}"
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
        stage('Push image to hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                        // some block
                        sh 'docker login -u p4r4djs333 -p ${dockerhubpwd}'
                    }
                    sh 'docker push springboot-docker-part2'
                }
            }
        }
    }
}