pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/attu07/Docker-php-nginx.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t php-nginx-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 8080:80 php-nginx-app || true'
            }
        }
    }
}
