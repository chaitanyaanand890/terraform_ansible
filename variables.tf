variable "my_region" {
  type        = string
  description = "This variable is used to specify region"
}

variable "my_access_key" {
  type        = string
  description = "This variable is used to specify access_key"
}

variable "my_secret_key" {
  type        = string
  description = "This variable is used to specify secret_key"
}

variable "my_domain_name" {
  type = string
}

variable "my_web_sub_domain_name" {
  type = string
}


variable "my_mail_sub_domain_name" {
  type = string
}

variable "my_db_sub_domain_name" {
  type = string
}

variable "my_httpd_server_sub_domain_name" {
  type = string
}

variable "my_local_aws_private_key_path" {
  type = string

}

variable "my_key_name" {
  type = string
}

variable "names" {
  type = list(string)
}

variable "status" {
  type    = string
}




variable "db_want" {
  type    = bool
}

variable "db_count" {
  type    = number

}

variable "httpd_want" {
  type    = bool
}

variable "httpd_count" {
  type    = number

}

variable "mail_want" {
  type    = bool
}

variable "mail_count" {
  type    = number

}

variable "web_want" {
  type    = bool
}

variable "web_count" {
  type    = number

}
