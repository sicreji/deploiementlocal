node {
    
    stage('gitclone'){
        
        sh "sudo rm -Rf /var/lib/jenkins/repos/deploiementlocal"
        sh "git clone https://github.com/sicreji/deploiementlocal.git /var/lib/jenkins/repos/deploiementlocal"
        sh "ls -lR /var/lib/jenkins/repos/deploiementlocal/"
        sh "sudo chmod 777 /var/lib/jenkins/repos/deploiementlocal/scripts/*"
        sh "sudo cp /var/lib/jenkins/repos/deploiementlocal/scripts/* ."
    }
    
    
    stage('testPackageList') {
        
        sh "ls -lR /var/lib/jenkins/repos/deploiementlocal/"
        sh " apt list --installed > packageList.txt"
        sh "./admin.sh packageList > test.txt"
        
        try {
            
            sh "diff packageList.txt test.txt "
            sh "echo \"packageList OK \" "
            
        }catch(error){
            
            sh "echo \"Erreur lors du test de packageList \" "
            
        }

    }
    
    stage('testGroupList') {

        sh "groups user > groupList.txt"
        sh "./admin.sh groupList user > test.txt"

        try {
            
            sh "diff groupList.txt test.txt"
            sh "echo \"groupList OK \" "
            
        }catch(error){

            sh "echo \"Erreur lors du test de groupList \" "
            
        }

    }
    
}
