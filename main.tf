module "web_mail_db_httpd" {
    source = "git@github.com:chaitanyaanand890/terraform_ansible_module.git"
    my_access_key = var.my_access_key
    my_secret_key = var.my_secret_key
    my_region = var.my_region
    my_domain_name = var.my_domain_name
    my_web_sub_domain_name = var.my_web_sub_domain_name
    my_mail_sub_domain_name = var.my_mail_sub_domain_name
    my_db_sub_domain_name = var.my_db_sub_domain_name
    my_httpd_server_sub_domain_name = var.my_httpd_server_sub_domain_name
    my_key_name = var.my_key_name
    my_local_aws_private_key_path = var.my_local_aws_private_key_path
    web_want = var.web_want
    web_count = var.web_count
    mail_want = var.mail_want
    mail_count = var.mail_count
    db_want = var.db_want
    db_count = var.db_count 
    httpd_want = var.httpd_want
    httpd_count = var.httpd_count
}


resource "null_resource" "ansible_playbook" {
  triggers = {
    file_changed = md5(local_file.loops.content)
    hosts_changed = md5(local_file.hosts.content)
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i hosts loops.yml"
  }

  depends_on = [
    local_file.loops
  ]
}
resource "local_file" "loops" {
  content = templatefile("${path.module}/users.tmpl", {
    names = var.names
    status = var.status
  })
  filename = "${path.module}/loops.yml"
}
resource "local_file" "hosts" {
  content = templatefile("${path.module}/hosts.tmpl", {
    web_server_host = module.web_mail_db_httpd.web_server_public_ip[0]
    mail_server_host = module.web_mail_db_httpd.mail_server_public_ip[0]
    db_server_host = module.web_mail_db_httpd.db_server_public_ip[0]
    httpd_server_host = module.web_mail_db_httpd.httpd_server_public_ip[0]
  })
  filename = "${path.module}/hosts"
}
