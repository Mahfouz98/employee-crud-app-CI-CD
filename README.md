<h1>Deploying a Java application using complete CI/CD Pipeline with Terraform and MariaDB</h1>

This project demonstrates how to set up a complete CI/CD pipeline using GitHub Actions, Terraform, Java Spring, and MariaDB. The pipeline includes creating a VPC, public subnets, an EC2 instance, and deploying a simple CRUD employee application.

<h3>Prerequisites ✅</h3>
<h5>Before you begin, ensure you have the following prerequisites: </h5>

- <h4>GitHub Repository ✔️</h4> Create a new repository for your project on GitHub.

- <h4>AWS Account ✔️</h4> Set up an AWS account if you haven’t already.

- <h4>Terraform ✔️</h4> Install Terraform on your local machine.

- <h4>Java and Maven ✔️</h4> Ensure you have Java OpenJDK and JRE 17 or Higher.

- <h4>MariaDB ✔️</h4> Set up a MariaDB instance (locally or on AWS).


<h2>Steps to Set Up the Project</h2>
<h3>Terraform Configuration:</h3>

- Create a directory for your Terraform scripts (e.g., terraform/).

- Write Terraform code to create the VPC, subnets, and EC2 instance. Define variables for your AWS credentials and other parameters.
  
- Initialize Terraform (terraform init) and apply the configuration (terraform apply).
  
<h3>Java Spring Application:</h3>

- Develop CRUD employee application. Define the necessary endpoints, services, and database connections.

- Configure application properties to connect to the MariaDB instance.

<h2>GitHub Actions CI/CD Workflow:</h2>

- Inside your GitHub repository, create a directory named .github/workflows.

- In this directory, create a YAML file (e.g., ci-cd.yml). This file will define your CI/CD workflow.

- Use GitHub Actions to build, test, and deploy your application. Trigger the workflow on pushes to the main branch (in my case i have used manual trigger).


<h2>Project Structure</h2>

<h3>Directory structure of the project.</h3>

![Screenshot from 2024-03-31 21-21-19](https://github.com/Mahfouz98/employee-crud-app-CI-CD/assets/145352617/e89679b5-d766-49b5-b852-a9dadc8c6d3f)

___

<h3>Where to find Terraform scripts, Java code, and CI/CD configuration.</h3>


in the following file you can adjust your own MYSQL_USERNAME & MYSQL_PASSWORD, also you can change the listening port for database server, and in my case it was in the same localhost machine and same port 3306

- `./target/classes/application.properties`

___

This is the main file of terraform which i have used to create the resources i need,
like VPC, Subnets, Security Group, EIP, Internetgateway and EC2 to Deploy the app on.

- `./main.tf`

___

You can change VPC cider block, subnets cider and AWS_Region from the following file

- `./terraform.tfvars`

___

<h4>Note :</h4>

- Workflow file locates here you can check my CI/CD pipe line and how to install mariadb on my ec2 using non-interactive shell.

> I have used `sudo bash -c 'echo -e "[Unit]\nDescription=webserver Daemon\n[Service]\nExecStart=/usr/bin/java -jar /home/ubuntu/app/artifacts/employee-0.0.1-SNAPSHOT.jar\nUser=root\n[Install]\nWantedBy=multi-user.target" > /lib/systemd/system/java_api.service'` to run the application as a service.
>
> I'm on my way to improve my application and dockerize it.
>
> But i got no options to use, i tried `nohub` to run it in BG but it also stucks my pipeline

- `./.github/workflows/Workflow.yml`
  


<h3> Before you run workflow </h3>

- Make sure your AWS Credentials is on repo secrets.

- Change the Name of the S3 Bucket from `./terraform.tfvars` for your own bucket.

- Also change the Keypair name from the same file to your Keypair in AWS account.

___
<h3>Faced Problems</h3>

> First i have chose a AWS Linux 2 Ami, I got alot of non-solvable problems in SSH, I Checked my ingress and outgress and also my Keys and everything was working fine,
> Even i tried to ssh manually from my machine to the EC2 and it works !!, so in my opinion it was a bit harder to install my data on,
> So i have decided to work on Ubuntu version which was alot easier.
>
> Second and the Major one was install mysql instead on mariadb.
>  i got tons of error in editing Root Password for mysql server,
> which is doesn't make sense, I have tried to ssh to the EC2 and solve the problems manually using interactive shell but i got no good results but failing,
> also tried to move Validating password file and alter the Root user again it works finally but it's not a good practice to do,
> Finally i switched to mariadb and none of those previous errors happend.

___
<h3>Future Enhancements</h3>

- I'm planning to separate the database server into another EC2 instance, Which provides more security to the enviroment and also divides the workloads.

- Also Dockerize my application to make deploying process more easily.
___
Thanks for your precious time, Good luck! 🚀
