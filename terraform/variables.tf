variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_main_region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "private_zone_1_cidr" {
  type = string
}

variable "private_zone_2_cidr" {
  type = string
}

variable "private_zone_1_rds_cidr" {
  type = string
}

variable "private_zone_2_rds_cidr" {
  type = string
}

variable "public_zone_1_cidr" {
  type = string
}

variable "public_zone_2_cidr" {
  type = string
}

variable "eks_version" {
  type = string
}

variable "availability_zone_1" {
  type = string
}

variable "availability_zone_2" {
  type = string
}