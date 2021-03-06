provider "aws" {
 region = "us-east-2"
 access_key = "Your Access Key"
 secret_key = "Your Secret Key"
}

resource "aws_emr_cluster" "cluster" {
 name = "harish"
 release_label = "emr-6.2.0"
 applications = ["Spark"]
 ec2_attributes {
  subnet_id = "subnet-3d647e47"
  key_name = "hary"
  instance_profile = "arn:aws:iam::660343586613:instance-profile/EMR_EC2_DefaultRole"
  }
 master_instance_group {
  instance_type = "m5.xlarge"
  instance_count = "1"
  name = "EMR Master"

  ebs_config {
  size = "50"
  type = "gp2"
  volumes_per_instance = 1
  }
}

 core_instance_group {
 name = "EMR Slave"
 instance_type = "m5.xlarge"
 instance_count = 2

 ebs_config {
 size = "50"
 type = "gp2"
 volumes_per_instance = 1
 }
}
 service_role = "arn:aws:iam::660343586613:role/EMR_DefaultRole"

}
