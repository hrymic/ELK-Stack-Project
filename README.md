# MH_Project_1
Building a virtual network in Azure

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](https://github.com/hrymic/MH_Project_1/blob/main/Diagrams/VNet_Diagram.drawio.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _.yml_ file may be used to install only certain pieces of it, such as Filebeat.

  - _filebeat-playbook.yml_

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly _redundant_, in addition to restricting _access_ to the network.
- What aspect of security do load balancers protect? What is the advantage of a jump box?_

---Load balancers protect from denial of service. The load balancer will route inbound traffic to healthy webservers.
---The advantage of a jumpbox is that the NSG only allows specific machines to SSH. Another benefit is creating Dockers to install applications to the webservers.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the _logs_ and system _metrics_.
- What does Filebeat watch for?_

---Filebeat monitors specific locations and collects log events. This data can be output into Elasticsearch to search for specific events or into Logstash to transform the data into graphic data.

- What does Metricbeat record?_

---Metricbeat collects metrics from the operating system and services running on a server. This information can output to Elasticsearch or Logstash

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name       |  Function | IP Address | Operating System |
|------------|:---------:|:----------:|:----------------:|
| Jump Box   |  Gateway  |  10.0.0.4  |       Linux      |
| Web-1      | Webserver |  10.0.0.5  |       Linux      |
| Web-2      | Webserver |  10.0.0.6  |       Linux      |
| ELK-Server |   Kibana  |  10.1.0.4  |       Linux      |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the _ELK_ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Add whitelisted IP addresses_

---50.39.161.198

Machines within the network can only be accessed by _the Jump Box_.
- Which machine did you allow to access your ELK VM? What was its IP address?_

---The Jump Box after attaching to the Ansible container. Since the Public IP of the Jump Box changes any IP will work as long as the source IP's Public Key matches the SSH Public Key on the ELK VM.

A summary of the access policies in place can be found in the table below.

| Name        | Publicly Accessible | Allowed IP Addresses    |
|-------------|---------------------|-------------------------|
| Jump Box    | Yes                 | 50.49.161.198           |
| Web-1/Web-2 | Yes                 | 50.49.161.198, 10.0.0.4 |
| ELK-Server  | Yes                 | 50.49.161.198, 10.0.0.4 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- What is the main advantage of automating configuration with Ansible?_

---Ansible doesn't require all the resources a normal system requires. The main purpose for Ansible is to automate installing software to groups of servers/workstations.

The playbook implements the following tasks:
- In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- Install docker.io, container created
- Install python3-pip, check that python is installed
- Download elk container, downloads elk image to docker container


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker ps](TODO: Update the path with the name of your screenshot of docker ps output]

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- List the IP addresses of the machines you are monitoring_

---10.0.0.5
---10.0.0.6

We have installed the following Beats on these machines:
- Specify which Beats you successfully installed_

---Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
- In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

---Filebeat collects log events that are scanned for new content, which can be output to Elasticsearch or Logstash. Metricbeat collects metrics on the server that cam be output to Elasticsearch or Logstash.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _install-elk.yml_ file to _the control node_.
- Update the _hosts_ file to include...

---[elk]
   10.1.0.4 ansible_python_interpreter=/usr/bin/python3

- Run the playbook, and navigate to _the ELK-Server_ to check that the installation worked as expected.

Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_

---The file that is the playbook is install-elk.yml. The file is copied to the ELK-Server.


- _Which file do you update to make Ansible run the playbook on a specific machine? How do you specify which machine to install the ELK server on versus which to install Filebeat on?_

---The file that was updated to make Ansible run the playbook on a specific machine was the playbook file. In the .yml file the first part of the script list the host to install the ELK or Filebeat and Metricbeat.


- _Which URL do you navigate to in order to check that the ELK server is running?

---Navigating to the public IP of the ELK server checks that the ELK server is running.


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._


---The user will need to curl the config file for filebeat:
<https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/files/filebeat-config.yml>

---Next the user edits the config file to update the host IP to 10.1.0.4 (ELK Server private IP)

---Then the user creates filebeat-playbook.yml using nano

---Once the filebeat-playbook.yml file was created use ansible-playbook filebeat-playbook.yml to run the playbook and install Filebeat onto the webservers.

---Check that filebeat is running on the webservers by navigating to the ELK Server web interface (Kibana).

---For metricbeat, the steps are the same. Curl the config file:
<https://gist.githubusercontent.com/slape/58541585cc1886d2e26cd8be557ce04c/raw/0ce2c7e744c54513616966affb5e9d96f5e12f73/metricbeat > /etc/ansible/files/metricbeat-config.yml>

---Edit the config file to update the host IP to 10.1.0.4

---Create the metricbeat-playbook.yml using nano

---Once the metricbeat-playbook.yml was created use ansible-playbook metricbeat-playbook.yml to run the playbook and install metricbeat onto the webservers

---Check that metricbeat is running on the webservers by navigating to the ELK Server web interface (Kibana).
