1) Boitique Project 
11 microservices 

11 repos 
github.com/organsation/cart
    deploy.yaml
    svc.yaml
    ingress.yaml
    cm.yaml
    secret.yaml
    netpol.yaml
    pvc.yaml
github.com/organsation/checkout
github.com/organsation/shipping
github.com/organsation/currency
...
11 repos 


------ 
Dev will develop the src code 
They will be testing in the local 

Once the code is good, they will commit/push the code to repo 
---


Our devops team will come into picture 
* We need to create the Dockerfile 
    * Buil the image with your company registry tag 
    nginx 
    ubuntu 
    i27devopsb4.jfrog.io/cont-images-docker-docker/eureka:radom
* we nee to push to registry 
    * login 
    * tag 
    * push 

* Cluster Created *EKS, GKE ......
* Shared Cluster 
    * non-prod-cluster
        * boutique-dev-ns
        * boutique-test-ns
        * boutique-stage-ns
        * boa-dev-ns
        * boa-tst-ns 
    * prod-cluster
* Non Shared CLuster
    * boutique-nonprod-cluster
        * bboutique-dev-ns
        * b-tst-n
        * b-stage-ns
* prod-cluster 

----
Deploy our application:
* Deployments 
* Service (ClusterIP)
* Volumes 


* IngressController 

***** dev.boutique.com > dev-ns 
 
boutique.com > prod-ns 


devops  ,  


docker > kubernetes > Helm > service mesh 


Produc === HA  DR

ubuntu > apt 
redhat > 
centos > yum 


kubernetes > helm (package manager for k8s)

namespace:

RBAC**** 
Resource Quota ***

auth author admission controller 

ClusterIP






CICD (Jenkins/actions)
Terraform 
Docker/kubernetes


Node Application Dockerfile 


1) https://github.com/devopswithcloud/weather-app
2) Create a Dockerfile
3) Push the image to docker repo 
4) Create a deployment in k8s with the same node app 
5) Expose the deployment with nodeport 

Doker volume
EPhem

ENV
ARGS




*** 
Volumes
PVC
PVC
Storage Class


CKA 2/17


Dec 1st weeks:
395$
50% 200$

Ddec6, next dec6 th

jan15th , exam pattern 



deploy

Sonar
    code .....sonar.proo
Contrast 
    war/jar 
Checkmarx


prisma, 
xray(jfrog)
    art
    images 

GAR (Vuln scan)
Aqua




Devops job is like the bank job 


dev
test
stage

production(jump server)

Master > kubectl 


jumpserver > production 

kubeadm 
* master 
    * kubeadm init
    * 
* worker-1
* worker-2


Master(ssh)
     kubectl get ****** 


laptop > jumpserver > kubectl 

Never



jumserver123
 /home/prafule(SRE)
    ~/.kube/config
 /home/koti/(DEV)
    ~/.kube/config
 home/ajay(Very less)

cert 
token : 1 day






Bigquery Code + proc 

enhancement 

Maven Build > jar 

jar > to**(interface)

jenkins > 

K8S : 
app deployments 
data processing 

customer > buckets > 


scrapper > processiong > big 


Deployemnt > image (work)
Jobs 
    cron-job


SRE 
k8s deployment (yamls)





difference 
jar > airflow (manual)

jar > deployment > Job (task)


S2I

github.com/sample-maven.git 
jar 
Dockerfile 
Image 
Push Registry 
Deploy
Svc
ingress


Openshit (built on top of k8s, enterprise version of k8s)
github.com/sample-maven.git
java > mvn 
node npm
interal
dePC
Svc
ruter


https://url



k8s 

vms 


GKE > node 
2 cpu

opens

10


7 k8s

3 openshift() **30-40k 
terraform 
AWS Cluster (Paid)


