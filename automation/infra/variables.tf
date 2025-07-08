variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "zone" {
  description = "GCP Zone"
  type        = string
}

variable "instance_name" {
  description = "VM name"
  type        = string
}

variable "instance_user" {
  description = "Instance username"
  type        = string
}
