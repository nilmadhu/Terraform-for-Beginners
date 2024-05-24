# Defing Variables and use that variable in Security group

# variables define for cidr

variable "cidr" {

  default = "192.168.1.0/25"

}

# variable for ports number. "variable type = number"

# variable "port-1" {
#   description = "enter the HTTP port number"
#   type        = number
# }


# variable "port-2" {
#   description = "enter the HTTPs port number"
#   type        = number
# }


# variable "port-3" {
#   description = "enter the Jenkins port number"
#   type        = number
# }


# variable "port-4" {
#   description = "enter the RDP port number"
#   type        = number
# }

# Defining String variable ----> "data_type= string"
variable "machine_name" {
  description = "enter the machine name"
  type        = string
}

variable "security_group" {
  description = "enter the security_group_name"
  type        = string

}

# Defining List variable ----> "data_type= list"

variable "port_number" {
  description = "enter the inbound rules"
  type        = list(number)

}


# {                                                                   0   1    2     3
  # Note, Value has been carried out based on index position like  [ 80, 443, 8080, 3389]
  #var.port_number = var.port_number[0]
  #var.port_number = var.port_number[1]
  #var.port_number = var.port_number[2]
  #var.port_number = var.port_number[3]

#   Invoke your input in the below manner:   plan output

#   $ terraform plan
# var.machine_name        
#   enter the machine name

#   Enter a value: test-sevrver

# var.port_number
#   enter the inbound rules

#   Enter a value: [ 80, 443, 8080, 3389 ]

# var.security_group
#   enter the security_group_name

#   Enter a value: ggg
# }


# Map variable using for instance type

# variable instance_type {
#     type = map(string)
#     default = {

#     "bull" = "t2.micro"
#     "devops" = "t3.micro"
#     }
# }
