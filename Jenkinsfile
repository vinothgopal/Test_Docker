

// The above line is used to trigger correct syntax highlighting.

import hudson.model.*
pipeline {
    // Lets Jenkins use Docker and Kubernetes for us later.
    agent any

    parameters {
        string(name: 'BUILD_ENV', defaultValue: 'stg', description: 'Set build environment: [test, stg]')
        //string(dockerhub:'https://hub.docker.com/repository/create?namespace=mesha1')
    }
     
    // a.groovy
    environment {
	    def docker = "my docker"
	def manager = "my manager"
        def name = "winhub-data-migrate"
	dockerImage = ''
	def workspace =pwd()
	build = "Thread.currentThread().executable"
        TAG = "build.number"    
	DATE = new Date().format('yy.M')
        TAG1 = "${DATE}.${BUILD_NUMBER}"    

        PARENT_FOLDER_NAME = "HubImplementationsParent"
        MAIN_FOLDER_NAME = "HubMigrationWs"
        COMMON_FOLDER_NAME = "WINHUB-WS-COMMON"
        EXE_NAME = "HubMigrationWS"
         
        IMAGE_NAME = "${name}-img"
        PROCESS_NAME = "${name}"
	def dir_name = "${Python}" 
	def file_doc ="${Dockerfile}" 
	GOPATH = "$WORKSPACE/gopath/bin"
           PATH = "$GOPATH/bin:$PATH"    
	    
      	    
        
    }

    // If anything fails, the whole Pipeline stops.
    stages {
        stage('Clean Up Docker Processes'){
            steps {
                script{
                   // try{
                        echo 'Stop Docker Process...'
                       // bat 'docker stop ' + params.BUILD_ENV + '-' + PROCESS_NAME

                        echo 'Remove Docker Process...'
			echo '$GOPATH'
			echo '$PATH'
                       // bat 'docker rm ' + params.BUILD_ENV + '-' + PROCESS_NAME
                   // }
                   // catch (Exception e) {
                       // echo 'Catch docker stop / docker rm error' 
                   // }
                }
            }
        }
        stage('Build Image') {
            steps {
                echo 'Creating Docker Image...'
		bat 'docker build -t pythonvone:Tagd'  + dir_name + '/' + "${Dockerfile}"    
		  //bat 'docker build -t pythonvone:'+ "${TAG}" + dir_name + '/' + "${Dockerfile}"
		    //docker.build("dir_name/file_doc:${TAG}")
		    echo ' directory path' + dir_name/"${Dockerfile}"
		   
		    print "${Dockerfile}"
		    print dir_name
		    //print "${server}"
		    //echo "${server}"
		docker images
		    //IMAGE_NAME
            }
        }
	stage('Test image') {
		steps{		
		
		    sh 'echo "Tests passed"'
	                     
		}
        }    
        stage ('Run Docker Process') {
            steps{
		    echo "Running the docker images"
		   //bat 'docker run --rm -v ./WINHUB-DATA-MIGRATE/Python/TestAdddress/Testcases:/workspace:cached -w /workspace pythonvon python3 -m robot .'
		    
	    }
                        
          }
	    stage ('Deploy Image') {
            steps{
	        // withCredentials([usernamePassword(credentialsId: 'Anita.Karthesan@winconnect.com.au', passwordVariable: 'miniminter6', usernameVariable: 'mesha1')]) {
                   // assumes Jib is configured to use the environment variables
		    
		script {    
			//stage('docker') {
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'Anita.Karthesan@winconnect.com.au', usernameVariable: 'mesha1', passwordVariable: 'miniminter6']]) {
                //sh "sudo docker login -p $PASSWORD -u $USERNAME registry.address"
			sh "docker login -u username -p 'https://hub.docker.com/repository/create?namespace=mesha1'"
                   }
                        //docker.withRegistry('https://registry.address', 'docker-registry') {
                         //docker.build(imageName).push();
                             //}
                               //}
                  docker.withRegistry('https://registry.hub.docker.com', 'mesha1') {
                        //docker.image("${TAG}").push()
                       // docker.image("${TAG}").push("latest")
		        }}
                 }
             }
	    //stage('Remove Unused docker image') {
              //steps{
                   //sh "docker rmi $imagename:$BUILD_NUMBER"
		      //sh 'docker rmi' + "${TAG}" + ':latest'
                     // }
              //}   
         stage ('Run Docker Process') {
            steps{
              //  bat 'if not exist ' + SHARED_DIR_HOST + ' md ' + SHARED_DIR_HOST
             //   bat 'docker run --name ' + params.BUILD_ENV + '-' + PROCESS_NAME + 
             //       ' -v ' + SHARED_DIR_HOST +':' + SHARED_DIR_CONTAINER + 
              //      ' -p ' + PORT_MAPPING + 
              //      //' -p ' + QAGENT_PORT_MAPPING + 
                //    ' -d ' + params.BUILD_ENV + '-' + IMAGE_NAME
            }
        }
    }   
}

// The above line is used to trigger correct syntax highlighting.

pipeline {
    // Lets Jenkins use Docker and Kubernetes for us later.
    agent any

    parameters {
        string(name: 'BUILD_ENV', defaultValue: 'dev', description: 'Set build environment: [test, stg]')

    }
        
    environment {
        def name = "ws-migrateQA"

        PARENT_FOLDER_NAME = "Python"
        MAIN_FOLDER_NAME = "TestAddress"
        //COMMON_FOLDER_NAME = "WINHUB-WS-COMMON"
        EXE_NAME = "MigrationQA"
        
        
        PORT_MAPPING_TEST = "5199:5555"
        PORT_MAPPING_STG = "5599:5555"
         
        IMAGE_NAME = "${name}-img"
        PROCESS_NAME = "${name}"
        SHARED_DIR_CONTAINER = "C:\\Shared"
        
        SHARED_DIR_HOST = "C:\\Shared\\${params.BUILD_ENV}\\${name}"
    }

    // If anything fails, the whole Pipeline stops.
    stages {
        stage('Setup Environment Variables') {
            steps {
                script {
                    if (params.BUILD_ENV == 'test') {
                        PORT_MAPPING = PORT_MAPPING_TEST
                        
                    } else if(params.BUILD_ENV == 'stg') {
                        PORT_MAPPING = PORT_MAPPING_STG
                        
                    }
                }
            }
        }
        stage('Maven Build') {
            steps{
                bat 'mvn -f ' + PARENT_FOLDER_NAME + ' clean install'
            } 
        }
        stage('Clean Up Docker Processes'){
            steps {
                script{
                    try{
                        echo 'Stop Docker Process...'
                        bat 'docker stop ' + params.BUILD_ENV + '-' + PROCESS_NAME

                        echo 'Remove Docker Process...'
                        bat 'docker rm ' + params.BUILD_ENV + '-' + PROCESS_NAME
                    }
                    catch (Exception e) {
                        echo 'Catch docker stop / docker rm error' 
                    }
                }
            }
        }
        stage('Build Image') {
            steps {
                echo 'Creating Docker Image...'
                bat 'docker build'+
                        
                        ' -f deploy1/'+ params.BUILD_ENV + '/Dockerfile'+
                        ' --build-arg build_env=' + params.BUILD_ENV + 
                        ' --build-arg parent_folder=' + PARENT_FOLDER_NAME + 
                        ' --build-arg main_folder=' + MAIN_FOLDER_NAME + 
                       // ' --build-arg common_folder=' + COMMON_FOLDER_NAME + 
                        ' --build-arg exe_name=' + EXE_NAME + 
                        ' -t ' + params.BUILD_ENV + '-' + IMAGE_NAME + ' .'
            }
        }
        stage ('Run Docker Process') {
            steps{
                bat 'if not exist ' + SHARED_DIR_HOST + ' md ' + SHARED_DIR_HOST
                
            }
        }
    }   
}

