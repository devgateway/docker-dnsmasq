#!/usr/bin/env groovy
// Copyright 2018, Development Gateway, see COPYING
pipeline {
  agent any

  environment {
    APP_NAME = 'dnsmasq'
    VERSION = 'alpine'
    IMAGE = "devgateway/$APP_NAME:$VERSION"
  }

  stages {

    stage('Build') {
      steps {
        script {
          docker.build(env.IMAGE)
        }
      }
    } // stage

    stage('Test') {
      steps {
        script {
          docker.image(env.IMAGE).withRun('-p 127.0.0.1:53:5353/udp') {
            sh 'dig @127.0.0.1 developmentgateway.org +tries=1 +timeout=2'
          }
        }
      }
    }

    stage('Publish') {
      steps {
        script {
          docker.withRegistry('', 'dockerhub-ssemenukha') {
            docker.image(env.IMAGE).push()
          }
        }
      }
    } // stage

  } // stages

  post {
    success {
      script {
        def msg = sh(
          returnStdout: true,
          script: 'git log --oneline --format=%B -n 1 HEAD | head -n 1'
        )
        slackSend(
          message: "Built <$BUILD_URL|$JOB_NAME $BUILD_NUMBER>: $msg",
          color: "good"
        )
      }
    }
  }
}
