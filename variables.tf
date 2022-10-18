variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type        = string
}
variable "bucket" {
  description = "The project bucket for terraform backend"
  type        = string
}
variable "key" {
  description = "The project key for terraform backend"
  type        = string
}
variable "dynamodb_table" {
  description = "The project dynamodbt table for terraform backend"
  type        = string
}
variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}
